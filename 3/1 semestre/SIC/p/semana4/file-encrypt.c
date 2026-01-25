#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <openssl/evp.h>
#include <openssl/sha.h>
#include <openssl/kdf.h>

#include "aes.h"
#include "ecb.h"
#include "cbc.h"
#include "padding.h"

#define SALT_SIZE 32
#define BUFFER_SIZE 4096

// Función para derivar key e IV desde password
int derive_key_iv(const char *password, uint8_t *salt, uint8_t *key, uint8_t *iv) {
    uint8_t kdf_output[32]; // 256 bits
    
    if (PKCS5_PBKDF2_HMAC(password, strlen(password), salt, SALT_SIZE, 
                         100000, EVP_sha256(), sizeof(kdf_output), kdf_output) != 1) {
        return -1;
    }
    
    memcpy(key, kdf_output, 16);
    memcpy(iv, kdf_output + 16, 16);
    return 0;
}

// Función para cifrar archivo
int encrypt_file(const char *password, const char *mode, 
                const char *input_file, const char *output_file) {
    
    FILE *in_fp, *out_fp;
    uint8_t salt[SALT_SIZE];
    uint8_t key[16], iv[16];
    uint8_t buffer[BUFFER_SIZE];
    uint8_t encrypted_buffer[BUFFER_SIZE];
    size_t bytes_read;
    
    // Abrir archivos
    in_fp = fopen(input_file, "rb");
    if (!in_fp) {
        perror("Error abriendo archivo de entrada");
        return -1;
    }
    
    out_fp = fopen(output_file, "wb");
    if (!out_fp) {
        perror("Error abriendo archivo de salida");
        fclose(in_fp);
        return -1;
    }
    
    // Generar salt aleatorio
    int fd = open("/dev/urandom", O_RDONLY);
    read(fd, salt, SALT_SIZE);
    close(fd);
    
    // Derivar key e IV
    if (derive_key_iv(password, salt, key, iv) != 0) {
        fprintf(stderr, "Error derivando clave\n");
        fclose(in_fp);
        fclose(out_fp);
        return -1;
    }
    
    // Escribir salt al inicio del archivo cifrado
    fwrite(salt, 1, SALT_SIZE, out_fp);
    
    // Inicializar contexto AES
    void *ctx = aes128_init_context(key);
    
    // Leer, aplicar padding y cifrar
    int use_ecb = (strcasecmp(mode, "ECB") == 0);
    size_t total_bytes = 0;
    uint8_t *padded_data = NULL;
    
    while ((bytes_read = fread(buffer, 1, BUFFER_SIZE, in_fp)) > 0) {
        total_bytes += bytes_read;
        
        // Aplicar padding al final del último bloque
        if (feof(in_fp)) {
            padded_data = malloc(bytes_read + 16);
            memcpy(padded_data, buffer, bytes_read);
            int padded_size = add_padding(padded_data, bytes_read);
            
            if (use_ecb) {
                aes128_ecb_enc(ctx, padded_data, padded_size, encrypted_buffer);
            } else {
                aes128_cbc_enc(ctx, iv, padded_data, padded_size, encrypted_buffer);
            }
            
            fwrite(encrypted_buffer, 1, padded_size, out_fp);
            free(padded_data);
        } else {
            // Cifrar bloque completo sin padding
            if (use_ecb) {
                aes128_ecb_enc(ctx, buffer, bytes_read, encrypted_buffer);
            } else {
                aes128_cbc_enc(ctx, iv, buffer, bytes_read, encrypted_buffer);
            }
            fwrite(encrypted_buffer, 1, bytes_read, out_fp);
        }
    }
    
    // Limpiar
    aes128_free_context(&ctx);
    fclose(in_fp);
    fclose(out_fp);
    
    printf("Archivo cifrado exitosamente:\n");
    printf("  Modo: %s\n", mode);
    printf("  Archivo original: %s (%zu bytes)\n", input_file, total_bytes);
    printf("  Archivo cifrado: %s\n", output_file);
    
    return 0;
}

void print_usage(const char *program_name) {
    printf("Uso: %s <password> <ECB|CBC> <archivo_entrada> <archivo_salida>\n", program_name);
    printf("Ejemplo: %s 'mi_password' ECB documento.txt documento.cifrado\n", program_name);
}

int main(int argc, char *argv[]) {
    if (argc != 5) {
        print_usage(argv[0]);
        return 1;
    }
    
    const char *password = argv[1];
    const char *mode = argv[2];
    const char *input_file = argv[3];
    const char *output_file = argv[4];
    
    // Validar modo
    if (strcasecmp(mode, "ECB") != 0 && strcasecmp(mode, "CBC") != 0) {
        fprintf(stderr, "Error: Modo debe ser ECB o CBC\n");
        return 1;
    }
    
    return encrypt_file(password, mode, input_file, output_file);
}