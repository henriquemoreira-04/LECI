#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <memory.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>
#include <assert.h>

// Compilación:
// gcc -O2 -Wall avalanche-analysis.c -o avalanche-analysis -lcrypto

#include <openssl/types.h>
#include <openssl/evp.h>
#include <openssl/md5.h>
#include <openssl/sha.h>

#ifndef MAX
#define MAX(x,y) (x > y ? x : y)
#endif

#define HASH_OUTPUT_MAX_BYTES   MAX( MD5_DIGEST_LENGTH, SHA256_DIGEST_LENGTH )
#define HASH_OUTPUT_MAX_BITS	(8 * HASH_OUTPUT_MAX_BYTES)
#define HASH_OUTPUT_BLOCK_SIZE	HASH_OUTPUT_MAX_BYTES

int bad_usage(const char *p) {
    fprintf(stderr, "Uso:\n\t%s M N\n\n"
                    "\tM: tamaño en bytes del mensaje original\n"
                    "\tN: número de mensajes con 1 bit alterado\n"
                    "\n", p);
    return -2;
}

static int ones[16] = {
    0, 1, 1, 2,
    1, 2, 2, 3,
    1, 2, 2, 3,
    2, 3, 3, 4
};

int count_1s(uint8_t c) {
    return ones[c & 0xF] + ones[c >> 4];
}

int count_diff_bits(const uint8_t *h1, const uint8_t *h2, const uint32_t size) {
    int n = 0;
    for (uint32_t i = 0; i < size; i++) {
        n += count_1s(h1[i] ^ h2[i]);
    }
    assert(n <= 8 * size);
    return n;
}

void change_me_a_bit(const uint8_t *source, const uint32_t source_size,
                     uint8_t *track_mods, uint8_t *working_buf)
{
    memcpy(working_buf, source, source_size);

    uint32_t bit_idx = rand() % (source_size * 8);
    uint32_t byte_idx = bit_idx / 8;
    uint32_t bit_offset = bit_idx % 8;
    uint8_t bit_mask = 1 << bit_offset;

    uint32_t tries = 0;
    while (track_mods[byte_idx] & bit_mask) {
        tries++;
        assert(tries < source_size * 8);
        bit_idx = (bit_idx + 1) % (source_size * 8);
        byte_idx = bit_idx / 8;
        bit_offset = bit_idx % 8;
        bit_mask = 1 << bit_offset;
    }

    working_buf[byte_idx] ^= bit_mask;
    track_mods[byte_idx] |= bit_mask;

    assert(count_diff_bits(source, working_buf, source_size) == 1);
}

void change_me_a_byte(const uint8_t *source, const uint32_t source_size,
                      uint8_t *track_mods, uint8_t *working_buf)
{
    memcpy(working_buf, source, source_size);

    uint32_t byte_idx = rand() % source_size;
    while (track_mods[byte_idx]) {
        byte_idx = (byte_idx + 1) % source_size;
    }

    uint8_t new_val;
    do {
        new_val = rand() & 0xFF;
    } while (new_val == source[byte_idx]);

    working_buf[byte_idx] = new_val;
    track_mods[byte_idx] = 1;
}

void sha256(const uint8_t *data, const uint32_t data_size, uint8_t *output_hash)
{
    EVP_MD_CTX *ctx = EVP_MD_CTX_new();
    EVP_DigestInit(ctx, EVP_sha256());
    EVP_DigestUpdate(ctx, data, data_size);
    EVP_DigestFinal(ctx, output_hash, NULL);
    EVP_MD_CTX_free(ctx);
}

void md5(const uint8_t *data, const uint32_t data_size, uint8_t *output_hash)
{
    EVP_MD_CTX *ctx = EVP_MD_CTX_new();
    EVP_DigestInit(ctx, EVP_md5());
    EVP_DigestUpdate(ctx, data, data_size);
    EVP_DigestFinal(ctx, output_hash, NULL);
    EVP_MD_CTX_free(ctx);
}

int main(int argc, char *argv[])
{
    if (argc != 3)
        return bad_usage(argv[0]);

    uint32_t source_size, n_variations;
    assert(sscanf(argv[1], "%d", &source_size));
    assert(sscanf(argv[2], "%d", &n_variations));

    fprintf(stderr, "Trabajando con M=%d bytes y N=%d variaciones...\n",
            source_size, n_variations);

    assert(n_variations <= source_size * 8);

    uint32_t histogram[HASH_OUTPUT_MAX_BITS + 1];
    memset(histogram, 0, sizeof(histogram));

    uint8_t *source = malloc(source_size);
    uint8_t *bit_mod = malloc(source_size);
    uint8_t *track_mods = calloc(source_size, 1);
    assert(source && bit_mod && track_mods);

    srand(time(NULL) ^ getpid());

    // ✅ Corrección: validar el valor de retorno de read()
    int fd = open("/dev/urandom", O_RDONLY);
    if (fd >= 0) {
        ssize_t bytes_read = read(fd, source, source_size);
        if (bytes_read != (ssize_t)source_size) {
            fprintf(stderr, "Advertencia: se leyeron solo %zd bytes de /dev/urandom\n", bytes_read);
        }
        close(fd);
    } else {
        for (uint32_t i = 0; i < source_size; i++)
            source[i] = rand() & 0xFF;
    }

    uint8_t source_hash[HASH_OUTPUT_BLOCK_SIZE];
    uint8_t bit_mod_hash[HASH_OUTPUT_BLOCK_SIZE];
    const int size_of_hash = SHA256_DIGEST_LENGTH;

    sha256(source, source_size, source_hash);

    for (uint32_t i = 0; i < n_variations; i++) {
        change_me_a_bit(source, source_size, track_mods, bit_mod);
        sha256(bit_mod, source_size, bit_mod_hash);
        int n = count_diff_bits(source_hash, bit_mod_hash, size_of_hash);
        histogram[n]++;
    }

    uint8_t *zeros = calloc(source_size, 1);
    assert(count_diff_bits(track_mods, zeros, source_size) == n_variations);
    free(zeros);

    printf("# HammingDistance  Occurrences\n");
    for (int i = 0; i <= size_of_hash * 8; i++) {
        if (histogram[i] > 0)
            printf("%3d %d\n", i, histogram[i]);
    }

    free(source);
    free(bit_mod);
    free(track_mods);

    return 0;
}
