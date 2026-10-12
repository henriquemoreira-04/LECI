# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
SELECT * FROM authors
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
SELECT au_fname, au_lname, phone FROM authors
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
SELECT au_fname, au_lname, phone FROM authors ORDER BY au_fname, au_lname;
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
SELECT au_fname as first_name, au_lname as last_name, phone as telephone FROM authors ORDER BY au_fname, au_lname;
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
SELECT au_fname as first_name, au_lname as last_name, phone as telephone FROM authors
WHERE state='CA' AND au_lname!='Ringer'
ORDER BY au_fname, au_lname; 
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
SELECT * FROM publishers
WHERE pub_name LIKE '%Bo%';
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
SELECT pub_name FROM titles, publishers
WHERE titles.pub_id = publishers.pub_id AND [type] = 'business'
```

### *h)* Número total de vendas de cada editora; 

```
SELECT pub_name, SUM(qty) as sales
FROM ((sales join titles on sales.title_id = titles.title_id)
      join publishers on titles.pub_id = publishers.pub_id)
GROUP BY pub_name
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
select pub_name, title, sum(qty) as sales
from publishers, sales, titles
where publishers.pub_id = titles.pub_id AND
      sales.title_id = titles.title_id
group by pub_name, title
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
select distinct title
from (
    (titles join sales on titles.title_id = sales.title_id) join stores on sales.stor_id = stores.stor_id
    )
where stores.stor_name = 'Bookbeat';
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
SELECT au_fname as 'First name', au_lname as 'Last name'
FROM authors, titles, titleauthor
WHERE authors.au_id = titleauthor.au_id and titles.title_id = titleauthor.title_id
GROUP BY au_fname, au_lname
HAVING count(DISTINCT [type]) > 1
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
select titles.type,titles.pub_id, avg(titles.price) as avg_price, sum(sales.qty) as total_sales
from (
    titles join sales on titles.title_id = sales.title_id
    )
group by titles.type,titles.pub_id;
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
select type, max(advance) as max_advance, avg(advance) as avg_advance
FROM titles
GROUP BY type
HAVING max(advance) > 1.5 * avg(advance)
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
select distinct authors.au_id as 'Author ID', authors.au_fname as 'First Name',authors.au_lname as 'Last Name', titles.title as 'Title', sum(sales.qty) as 'Total Sales'
from (
    ((titles join sales on titles.title_id = sales.title_id) join titleauthor on titles.title_id = titleauthor.title_id) join authors on titleauthor.au_id = authors.au_id
    )
group by authors.au_id, authors.au_fname,authors.au_lname,titles.title;
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
select title, ytd_sales,price*ytd_sales as facturacao, price*ytd_sales*royalty/100 as auths_revenue, price*ytd_sales-price*ytd_sales*royalty/100 as publisher_revenue
from titles;
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
select title, CONCAT(authors.au_fname, ' ', authors.au_lname) as author, price*ytd_sales*royalty/100 as auth_revenue, price*ytd_sales-price*ytd_sales*royalty/100 as publisher_revenue
from (
	(titles join titleauthor on titles.title_id=titleauthor.title_id) join authors on titleauthor.au_id=authors.au_id
	)
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
select stor_name
from (
    (stores join sales on stores.stor_id=sales.stor_id) join titles on sales.title_id=titles.title_id
)
group by stor_name
having count(title)=(select count(title_id) from titles);
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
select stor_name
from (
    stores join sales on stores.stor_id=sales.stor_id
)
group by stor_name
having sum(sales.qty) > avg(sales.qty);
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
(select distinct title
from titles)
except
(select distinct title
from (
    (titles left outer join sales on titles.title_id = sales.title_id) join stores on sales.stor_id = stores.stor_id
)
where stores.stor_name = 'Bookbeat')
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
select publishers.pub_name, stores.stor_name
	from (
		((stores left outer join sales on stores.stor_id=sales.stor_id) left outer join titles on sales.title_id=titles.title_id) left outer join publishers on titles.pub_id=publishers.pub_id
	)
group by publishers.pub_name, stores.stor_name
having COUNT(sales.qty)=0
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_1_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_1_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
Select Ssn, Fname, Minit, Lname, Pno
from employee, works_on
where works_on.Essn = employee.Ssn
order by Pno
```

##### *b)* 

```
Select funcionario.Fname, funcionario.Minit, funcionario.Lname
from employee as funcionario, employee as super
where funcionario.Super_ssn = super.Ssn and super.Fname='Carlos' and super.Minit='D' and super.Lname='Gomes'
```

##### *c)* 

```
select project.Pname, sum(works_on.Hours) as horas_semana
from project, works_on
where works_on.Pno = project.Pnumber
group by project.Pname
```

##### *d)* 

```
select Fname, Lname
from ((works_on join project on Pno=Pnumber) join employee on Ssn=Essn)
where Dno = 3 and Pname = 'Aveiro Digital' and Hours > 20
```

##### *e)* 

```
select Fname,Lname
from employee left outer join works_on on Ssn=Essn
where Essn is null
```

##### *f)* 

```
select Dname, avg(Salary) as salario_medio
from employee join department on Dno=Dnumber
where Sex='F'
group by Dname
```

##### *g)* 

```
select Fname, Lname, count(Dependent_name) as Number
from employee join dependent on Ssn=Essn
group by Fname, Lname
having count(Dependent_name) > 2;
```

##### *h)* 

```
select Fname, Lname
from employee join department on Ssn=Mgr_ssn left join dependent on Ssn=Essn
where Essn is null
```

##### *i)* 

```
select distinct Fname, Lname, Address
from employee join works_on on Ssn=Essn join project on Pno=Pnumber join dept_location on Dno=Dnumber
where Plocation='Aveiro' and Dlocation!='Aveiro'
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
select nome
from fornecedor left join encomenda on nif=encomenda.fornecedor
where encomenda.fornecedor is null
```

##### *b)* 

```
select codProd, avg(unidades) as media
from item
group by codProd
```


##### *c)* 

```
SELECT avg(cast(produto_encomenda as float)) AS media_produto_encomenda
FROM (
    SELECT numEnc, COUNT(codProd) AS produto_encomenda
    FROM item
    GROUP BY numEnc
) as total_produtos
```


##### *d)* 

```
select fornecedor.nome, produto.nome, sum(item.unidades) as quantidade
from fornecedor join encomenda on nif=fornecedor join item on numEnc=numero join produto on codigo = codProd
group by fornecedor.nome, produto.nome
order BY fornecedor.nome
```

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
select nome
from paciente left outer join prescricao on paciente.numUtente=prescricao.numUtente
where prescricao.numUtente is null
```

##### *b)* 

```
select especialidade, count(especialidade) as numero_prescricoes
from medico join prescricao on numSNS=numMedico
group by especialidade
```


##### *c)* 

```
select nome, count(numPresc) as prescricoes_processadas
from farmacia join prescricao on nome=farmacia
group by nome
```


##### *d)* 

```
select farmaco.nome
from farmaco where farmaco.numRegFarm=906 EXCEPT(
    select presc_farmaco.nomeFarmaco
    from( prescricao left outer join presc_farmaco on prescricao.numPresc=presc_farmaco.numPresc)
    where presc_farmaco.numRegFarm=906
)
```

##### *e)* 

```
select farmacia,nome,count(nomeFarmaco) as farmaco_vendido_farmacia from prescricao,presc_farmaco,farmaceutica
where prescricao.dataProc is not null and presc_farmaco.numPresc = prescricao.numPresc and numReg=numRegFarm
group by farmacia,nome
order by farmacia
```

##### *f)* 

```
select prescricao.numUtente, paciente.nome
from (prescricao join medico on prescricao.numMedico=medico.numSNS join paciente on prescricao.numUtente=paciente.numUtente)
group by prescricao.numUtente, paciente.nome
having count(prescricao.numMedico)>1
```
