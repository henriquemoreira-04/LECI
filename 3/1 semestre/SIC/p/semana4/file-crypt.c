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
#define BMP_HEADER_SIZE 54

// Función para derivar key e IV (la misma de antes)
int derive_key_iv(const char *password, uint8_t *salt, uint8_t *key, uint8_t *iv) {
    uint8_t kdf_output[32];
    if (PKCS5_PBKDF2_HMAC(password, strlen(password), salt, SALT_SIZE, 
                         100000, EVP_sha256(), sizeof(kdf_output), kdf_output) != 1) {
        return -1;
    }
    memcpy(key, kdf_output, 16);
    memcpy(iv, kdf_output + 16, 16);
    return 0;
}

// Función específica para cifrar imágenes BMP
int encrypt_bmp_image(const char *password, const char *mode, 
                     const char *input_bmp, const char *output_enc) {
    
    FILE *in_fp, *out_fp;
    uint8_t salt[SALT_SIZE];
    uint8_t key[16], iv[16];
    uint8_t bmp_header[BMP_HEADER_SIZE];
    uint8_t buffer[4096];
    uint8_t encrypted_buffer[4096];
    size_t bytes_read;
    
    // Abrir archivos
    in_fp = fopen(input_bmp, "rb");
    if (!in_fp) {
        perror("Error abriendo imagen BMP");
        return -1;
    }
    
    out_fp = fopen(output_enc, "wb");
    if (!out_fp) {
        perror("Error creando archivo cifrado");
        fclose(in_fp);
        return -1;
    }
    
    // Leer y verificar header BMP
    if (fread(bmp_header, 1, BMP_HEADER_SIZE, in_fp) != BMP_HEADER_SIZE) {
        fprintf(stderr, "Error: No se pudo leer el header BMP\n");
        fclose(in_fp);
        fclose(out_fp);
        return -1;
    }
    
    // Verificar que es un BMP (primeros 2 bytes = "BM")
    if (bmp_header[0] != 0x42 || bmp_header[1] != 0x4D) {
        fprintf(stderr, "Error: El archivo no es un BMP válido\n");
        fclose(in_fp);
        fclose(out_fp);
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
    
    // Escribir salt al archivo cifrado
    fwrite(salt, 1, SALT_SIZE, out_fp);
    
    // Inicializar contexto AES
    void *ctx = aes128_init_context(key);
    
    int use_ecb = (strcasecmp(mode, "ECB") == 0);
    size_t total_data_bytes = 0;
    
    // Cifrar los datos de la imagen (excluyendo el header)
    while ((bytes_read = fread(buffer, 1, sizeof(buffer), in_fp)) > 0) {
        total_data_bytes += bytes_read;
        
        if (feof(in_fp)) {
            // Último bloque - aplicar padding
            uint8_t *padded_data = malloc(bytes_read + 16);
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
            // Bloques completos
            if (use_ecb) {
                aes128_ecb_enc(ctx, buffer, bytes_read, encrypted_buffer);
            } else {
                aes128_cbc_enc(ctx, iv, buffer, bytes_read, encrypted_buffer);
            }
            fwrite(encrypted_buffer, 1, bytes_read, out_fp);
        }
    }
    
    aes128_free_context(&ctx);
    fclose(in_fp);
    fclose(out_fp);
    
    printf("✅ Imagen BMP cifrada:\n");
    printf("   Modo: %s\n", mode);
    printf("   Original: %s\n", input_bmp);
    printf("   Cifrado: %s\n", output_enc);
    printf("   Datos cifrados: %zu bytes\n", total_data_bytes);
    
    return 0;
}

// Función para restaurar header BMP en archivo cifrado
int restore_bmp_header(const char *original_bmp, const char *encrypted_file, 
                      const char *output_bmp) {
    
    FILE *orig_fp, *enc_fp, *out_fp;
    uint8_t header[BMP_HEADER_SIZE];
    uint8_t buffer[4096];
    size_t bytes_read;
    
    // Abrir archivo original para leer header
    orig_fp = fopen(original_bmp, "rb");
    if (!orig_fp) {
        perror("Error abriendo imagen original");
        return -1;
    }
    
    // Leer header BMP
    if (fread(header, 1, BMP_HEADER_SIZE, orig_fp) != BMP_HEADER_SIZE) {
        fprintf(stderr, "Error leyendo header BMP\n");
        fclose(orig_fp);
        return -1;
    }
    fclose(orig_fp);
    
    // Abrir archivo cifrado (salt + datos cifrados)
    enc_fp = fopen(encrypted_file, "rb");
    if (!enc_fp) {
        perror("Error abriendo archivo cifrado");
        return -1;
    }
    
    // Crear archivo de salida
    out_fp = fopen(output_bmp, "wb");
    if (!out_fp) {
        perror("Error creando archivo de salida");
        fclose(enc_fp);
        return -1;
    }
    
    // Escribir header BMP original
    fwrite(header, 1, BMP_HEADER_SIZE, out_fp);
    
    // Saltar el salt (32 bytes) en el archivo cifrado
    fseek(enc_fp, SALT_SIZE, SEEK_SET);
    
    // Copiar datos cifrados (sin el salt)
    while ((bytes_read = fread(buffer, 1, sizeof(buffer), enc_fp)) > 0) {
        fwrite(buffer, 1, bytes_read, out_fp);
    }
    
    fclose(enc_fp);
    fclose(out_fp);
    
    printf("✅ Header BMP restaurado:\n");
    printf("   Archivo visualizable: %s\n", output_bmp);
    
    return 0;
}

void print_usage(const char *program_name) {
    printf("Uso: %s <encrypt|restore-header> <password> <ECB|CBC> <input> <output>\n", program_name);
    printf("Ejemplos:\n");
    printf("  %s encrypt 'pass' ECB Tux.bmp Tux.enc\n", program_name);
    printf("  %s restore-header Tux.bmp Tux.enc Tux_ecb.bmp\n", program_name);
    printf("\nLuego usar: dd if=Tux.bmp of=Tux_ecb.bmp ibs=1 count=54 conv=notrunc\n");
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        print_usage(argv[0]);
        return 1;
    }
    
    if (strcasecmp(argv[1], "encrypt") == 0 && argc == 6) {
        return encrypt_bmp_image(argv[2], argv[3], argv[4], argv[5]);
    } else if (strcasecmp(argv[1], "restore-header") == 0 && argc == 5) {
        return restore_bmp_header(argv[2], argv[3], argv[4]);
    } else {
        print_usage(argv[0]);
        return 1;
    }
}