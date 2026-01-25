CC = cc
CFLAGS = -Wall -g
LDFLAGS = -lcrypto

# Fuentes comunes
COMMON_SOURCES = aes-sw.o ecb.o cbc.o padding.o

# Targets principales
all: aes128-test-modes aes128-test-padding pbkdf2-kickoff

# Programa de test de modos
aes128-test-modes: aes128-test-modes.o $(COMMON_SOURCES)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

# Programa de test de padding
aes128-test-padding: aes128-test-padding.o $(COMMON_SOURCES)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

# Programa PBKDF2
pbkdf2-kickoff: pbkdf2-kickoff.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)



# File encryption/decryption target
file-crypt: file-crypt.o $(COMMON_SOURCES)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

file-crypt.o: file-crypt.c
	$(CC) $(CFLAGS) -c -o $@ $<

# File encryption targets
file-encrypt: file-encrypt.o $(COMMON_SOURCES)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

file-encrypt-std: file-encrypt-std.o $(COMMON_SOURCES)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

file-encrypt.o: file-encrypt.c
	$(CC) $(CFLAGS) -c -o $@ $<

file-encrypt-std.o: file-encrypt-std.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Compilación de objetos
aes128-test-modes.o: aes128-test-modes.c
	$(CC) $(CFLAGS) -c -o $@ $<

aes128-test-padding.o: aes128-test-padding.c
	$(CC) $(CFLAGS) -c -o $@ $<

pbkdf2-kickoff.o: pbkdf2-kickoff.c
	$(CC) $(CFLAGS) -c -o $@ $<

ecb.o: ecb.c
	$(CC) $(CFLAGS) -c -o $@ $<

cbc.o: cbc.c
	$(CC) $(CFLAGS) -c -o $@ $<

padding.o: padding.c
	$(CC) $(CFLAGS) -c -o $@ $<

aes-sw.o: aes-sw.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Versión con AES-NI (opcional)
aes-ni.o: aes-ni.c
	$(CC) $(CFLAGS) -msse2 -msse -maes -c -o $@ $<

aes128-test-modes-ni: aes128-test-modes.o ecb.o cbc.o aes-ni.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f *.o aes128-test-modes aes128-test-padding aes128-test-modes-ni pbkdf2-kickoff

.PHONY: all clean