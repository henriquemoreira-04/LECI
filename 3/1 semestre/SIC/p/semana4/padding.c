#include <stdint.h>
#include <assert.h>
#include <string.h>

#include "aes.h"
#include "padding.h"

// Adds PKCS#7 padding and returns the new plaintext length
int
add_padding( uint8_t * plain, const int plain_size )
{
    assert( plain != 0 );
    
    int padding_size = AES128_BLOCK_SIZE - (plain_size % AES128_BLOCK_SIZE);
    
    // Si el tamaño es múltiplo exacto, añadimos un bloque completo de padding
    if (padding_size == 0) {
        padding_size = AES128_BLOCK_SIZE;
    }
    
    // Rellenar con el valor del padding
    for (int i = 0; i < padding_size; i++) {
        plain[plain_size + i] = (uint8_t)padding_size;
    }
    
    return plain_size + padding_size;
}

/*
 * Checks PKCS#7 padding and returns the original plaintext length (w/o padding)
 * If an error is found in the padding, it returns -1.
*/
int
rm_padding( uint8_t * padded, const int full_size )
{
    assert( padded != 0 );
    
    if (full_size == 0 || full_size % AES128_BLOCK_SIZE != 0) {
        return -1; // Tamaño inválido
    }
    
    uint8_t padding_value = padded[full_size - 1];
    
    // Verificar que el padding value sea válido
    if (padding_value == 0 || padding_value > AES128_BLOCK_SIZE) {
        return -1;
    }
    
    // Verificar que todos los bytes de padding sean correctos
    for (int i = 0; i < padding_value; i++) {
        if (padded[full_size - 1 - i] != padding_value) {
            return -1;
        }
    }
    
    return full_size - padding_value;
}