#include <unistd.h>
#include <fcntl.h>
#include <memory.h>
#include <openssl/evp.h>
#include <openssl/sha.h>
#include <openssl/kdf.h>
#include <assert.h>
#include <string.h>
#include <stdio.h>

void
hex_dump( char * text, uint8_t * data, int data_len )
{
    printf( "%s: ", text );

    for(int i = 0; i < data_len; i++) {
        printf( "%02X", data[i] );
    }
    printf( "\n" );
}

int
main( int argc, char * argv[] )
{
    const int kdf_iter = 100000; // number of iterations to use in PKCS5_PBKDF2_HMAC
    uint8_t salt[SHA256_DIGEST_LENGTH]; // space for a salt that would be randomly generated
    uint8_t kdf_output[SHA256_DIGEST_LENGTH]; // space for the output key (256 bits = 32 bytes)
    uint8_t key[16]; // space for an AES key (128 bits)
    uint8_t iv[16]; // space for an AES CBC IV (128 bits)

    if (argc < 2) {
        fprintf( stderr, "Usage: %s password\n", argv[0] );
        return 1;
    }

    // get salt from a good (and fast) source of randomness
    int fd = open( "/dev/urandom", 0 );
    assert( fd != -1 );
    read( fd, salt, sizeof(salt) );
    close ( fd );

    // generate the 256-bit key using PBKDF2-HMAC-SHA256
    if (PKCS5_PBKDF2_HMAC(argv[1], strlen(argv[1]), salt, sizeof(salt), kdf_iter, EVP_sha256(), sizeof(kdf_output), kdf_output) != 1) {
        fprintf(stderr, "Error in PKCS5_PBKDF2_HMAC\n");
        return 1;
    }

    // Split the 256-bit output into 128-bit key and 128-bit IV
    memcpy( key, kdf_output,     16 ); // First 16 bytes = AES Key
    memcpy( iv , kdf_output + 16, 16 ); // Next 16 bytes = IV

    // dump the salt
    hex_dump( "Salt", salt, sizeof(salt) );

    // dump the key
    hex_dump( "Key", key, sizeof(key) );

    // dump the IV
    hex_dump( "IV", iv, sizeof(iv) );

    return 0;
}