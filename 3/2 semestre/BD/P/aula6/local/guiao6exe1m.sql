-- a) Todos os tuplos da tabela autores (authors);
SELECT * FROM authors;

-- b) O primeiro nome, o último nome e o telefone dos autores;
SELECT au_fname, au_lname, phone FROM authors;

--c) Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente);

SELECT au_fname, au_lname, phone FROM authors ORDER BY au_fname ASC, au_lname ASC;

--d) d) Consulta definida em c) mas renomeando os atributos para (first_name, last_name,telephone);

SELECT au_fname AS first_name, au_lname AS last_name , phone AS telephone FROM authors ORDER BY first_name ASC, last_name ASC; 

--e) Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

SELECT au_fname AS first_name , au_lname AS last_name , phone AS telephone From authors WHERE state = 'CA' AND au_fname <> 'Ringer' ORDER BY first_name ASC, last_name ASC;

-- f) Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome;

SELECT * FROM publishers WHERE pub_name LIKE 'Bo';

-- g) Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’;

SELECT DISTINCT pub_name FROM dbo.publishers p JOIN dbo.titles t ON p.pub_id = t.pub_id WHERE t.type = 'Business';

-- h) Número total de vendas de cada editora;
