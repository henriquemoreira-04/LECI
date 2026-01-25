// Helper file for SIC Lab on Symmetric Cryptography

#include <stdint.h>
#include <memory.h>
#include <assert.h>

#include "aes.h"
#include "cbc.h"

// Función helper para XOR de bloques
static void block_xor(const uint8_t *a, const uint8_t *b, uint8_t *result) {
    for (int i = 0; i < AES128_BLOCK_SIZE; i++) {
        result[i] = a[i] ^ b[i];
    }
}

void
aes128_cbc_enc( void * ctx, const uint8_t * iv, const uint8_t * plaintext, const int plain_size, uint8_t * ciphertext )
{
    assert( ctx != 0 && iv != 0 && plaintext != 0 && ciphertext != 0);
    assert( plain_size % AES128_BLOCK_SIZE == 0 ); // Debe ser múltiplo del tamaño de bloque
    
    int num_blocks = plain_size / AES128_BLOCK_SIZE;
    uint8_t temp_block[AES128_BLOCK_SIZE];
    const uint8_t *previous_cipher = iv;
    
    for (int i = 0; i < num_blocks; i++) {
        const uint8_t *current_plain = plaintext + (i * AES128_BLOCK_SIZE);
        uint8_t *current_cipher = ciphertext + (i * AES128_BLOCK_SIZE);
        
        // XOR con el bloque cifrado anterior (o IV para el primer bloque)
        block_xor(current_plain, previous_cipher, temp_block);
        
        // Cifrar el resultado
        aes128_block_enc(ctx, temp_block, current_cipher);
        
        // Actualizar para el siguiente bloque
        previous_cipher = current_cipher;
    }
}

void
aes128_cbc_dec( void * ctx, const uint8_t * iv, const uint8_t * ciphertext, const int cipher_size, uint8_t * plaintext )
{
    assert( ctx != 0 && iv != 0 && plaintext != 0 && ciphertext != 0);
    assert( cipher_size % AES128_BLOCK_SIZE == 0 ); // Debe ser múltiplo del tamaño de bloque
    
    int num_blocks = cipher_size / AES128_BLOCK_SIZE;
    uint8_t temp_block[AES128_BLOCK_SIZE];
    const uint8_t *previous_cipher = iv;
    
    for (int i = 0; i < num_blocks; i++) {
        const uint8_t *current_cipher = ciphertext + (i * AES128_BLOCK_SIZE);
        uint8_t *current_plain = plaintext + (i * AES128_BLOCK_SIZE);
        
        // Descifrar el bloque actual
        aes128_block_dec(ctx, current_cipher, temp_block);
        
        // XOR con el bloque cifrado anterior (o IV para el primer bloque)
        block_xor(temp_block, previous_cipher, current_plain);
        
        // Actualizar para el siguiente bloque
        previous_cipher = current_cipher;
    }
}