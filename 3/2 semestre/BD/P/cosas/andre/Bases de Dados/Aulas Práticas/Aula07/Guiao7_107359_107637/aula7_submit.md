# BD: Guião 7


## ​7.2 
 
### *a)*

```
Está na 1FN, pois os seus atributos são atómicos (Não permite atributos composto ou multivalores) e não suporta relações dentro de relações (não é possível utilizar uma relação como valor de um atributo de um tuplo).
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
R1 (_A_, _B_, C)
R2 (_B_, F, G, H)
R3 (_A_, D, E, I, J)
```


### *c)* 

```
R1 (_A_, _B_, C)
R2 (_B_, F)
R3 (_F_, G, H)
R4 (_A_, D, E)
R5 (_D_, I, J) 
```


## ​7.4
 
### *a)*

```
{A,B}
```


### *b)* 

```
Já está em 2FN, pois não contém dependèncias parciais.

3FN
R1 (_A_, _B_, C, D)
R2 (_D_, E)
R3 (_C_, A)
```


### *c)* 

```
R1 (_B_, C, D)
R2 (_C_, A)
R3 (_D_. E)
```



## ​7.5
 
### *a)*

```
{A,B}
```

### *b)* 

```
R1 (_A_, _B_, C, D, E)
R2 (_A_, C, D)
```


### *c)* 

```
R3 = (_A_, _B_, E)
R4 = (_C_, D)
R5 = (_A_, C)
```

### *d)* 

```
Já está na BCNF
```
