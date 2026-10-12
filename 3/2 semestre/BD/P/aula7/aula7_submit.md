# BD: Guião 7


## ​7.2 
 
### *a)*

```
A relação original está só na 1FN (Primeira Forma Normal) porque todos os atributos são valores simples, Não permite atributos composto ou multivalor.

```

### *b)* 

```
2FN
Livro(Titulo_Livro, Nome_Autor, Tipo_Livro, Preco, NoPaginas, Editor, Endereco_Editor, Ano_Publicacao)
Autor(Nome_Autor, Afiliacao_Autor)

3FN
R1: Livro(Titulo_Livro, Nome_Autor, Tipo_Livro, NoPaginas, Editor, Ano_Publicacao)
R2: Autor(Nome_Autor, Afiliacao_Autor)  
R3: TipoLivro(Tipo_Livro, NoPaginas, Preco)
R4: Editora(Editor, Endereco_Editor)

```


## ​7.3
 
### *a)*

```
{A,B}

```


### *b)* 

```
R1(A, B, C)          PK: {A,B} → C  (dependência total)
R2(A, D, E)          PK: A → D,E
R3(B, F, G, H)       PK: B → F 

```


### *c)* 

```
R1(A,B,C)     PK:{A,B}
R2A(A,D,E)    PK: A
R4(D,I,J)     PK: D    FK: D→R2A
R3A(B,F)      PK: B
R3B(F,G,H)    PK: F    FK: F→R3A

```


## ​7.4
 
### *a)*

```
{A,B}

```


### *b)* 

```
R1(A,B,C)    PK:{A,B,C}
R2(D,E)      PK:D
R3(C,A)      PK:C

```


### *c)* 

```
R1 (B, C, D)
R2 (C, A)
R3 (D, E)

```



## ​7.5
 
### *a)*

```
{A,B}

```

### *b)* 

```
R1(A, C)         PK: A → C
R2(A, B, D, E)   PK: {A,B} → D,E

```


### *c)* 

```
R1(A, C)         PK: A
R2(C, D)         PK: C
R3(A, B, E)      PK: {A,B}

```

### *d)* 

```
R1(A, C)         PK: A
R2(C, D)         PK: C
R3(A, B, E)      PK: {A,B}

```
