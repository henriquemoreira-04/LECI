#include <stdint.h>
#include <memory.h>
#include <assert.h>

#include "aes.h"
#include "ecb.h"

void
aes128_ecb_enc ( const void * ctx, const uint8_t * plaintext, const int plain_size, uint8_t * ciphertext )
{
    assert( ctx != 0 && plaintext != 0 && ciphertext != 0);
    assert( plain_size % AES128_BLOCK_SIZE == 0 ); // Debe ser múltiplo del tamaño de bloque
    
    int num_blocks = plain_size / AES128_BLOCK_SIZE;
    
    for (int i = 0; i < num_blocks; i++) {
        const uint8_t *current_block = plaintext + (i * AES128_BLOCK_SIZE);
        uint8_t *output_block = ciphertext + (i * AES128_BLOCK_SIZE);
        
        aes128_block_enc(ctx, current_block, output_block);
    }
}

void
aes128_ecb_dec ( const void * ctx, const uint8_t * ciphertext, const int cipher_size, uint8_t * plaintext )
{
    assert( ctx != 0 && plaintext != 0 && ciphertext != 0);
    assert( cipher_size % AES128_BLOCK_SIZE == 0 ); // Debe ser múltiplo del tamaño de bloque
    
    int num_blocks = cipher_size / AES128_BLOCK_SIZE;
    
    for (int i = 0; i < num_blocks; i++) {
        const uint8_t *current_block = ciphertext + (i * AES128_BLOCK_SIZE);
        uint8_t *output_block = plaintext + (i * AES128_BLOCK_SIZE);
        
        aes128_block_dec(ctx, current_block, output_block);
    }
}