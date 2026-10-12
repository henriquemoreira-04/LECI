-- ============================================================
-- Base de Dados : Sistema de Gestão Hospitalar
-- Queries de Teste e Aprendizagem
-- ============================================================


-- ============================================================
-- 1. SELECT * — Verificação rápida de dados por tabela
--    Resultado esperado: contagem de registos por tabela
-- ============================================================

SELECT 'Pessoa' AS Tabela, COUNT(*) AS Total FROM SGH.Pessoa              -- 16
UNION ALL
SELECT 'Hospital',          COUNT(*) FROM SGH.Hospital                    -- 2
UNION ALL
SELECT 'Departamento',      COUNT(*) FROM SGH.Departamento                -- 5
UNION ALL
SELECT 'Tipo_de_Sala',      COUNT(*) FROM SGH.Tipo_de_Sala               -- 4
UNION ALL
SELECT 'Equipamento_Medico',COUNT(*) FROM SGH.Equipamento_Medico         -- 6
UNION ALL
SELECT 'Paciente',          COUNT(*) FROM SGH.Paciente                    -- 6
UNION ALL
SELECT 'Administrador',     COUNT(*) FROM SGH.Administrador               -- 2
UNION ALL
SELECT 'Enfermeiro',        COUNT(*) FROM SGH.Enfermeiro                  -- 4
UNION ALL
SELECT 'Medico',            COUNT(*) FROM SGH.Medico                      -- 4
UNION ALL
SELECT 'Sala',              COUNT(*) FROM SGH.Sala                        -- 10
UNION ALL
SELECT 'Sala_Equipamento',  COUNT(*) FROM SGH.Sala_Equipamento            -- 11
UNION ALL
SELECT 'Avaliacao',         COUNT(*) FROM SGH.Avaliacao                   -- 8
UNION ALL
SELECT 'Diagnostico',       COUNT(*) FROM SGH.Diagnostico                 -- 7
UNION ALL
SELECT 'Cirurgia',          COUNT(*) FROM SGH.Cirurgia                    -- 4
UNION ALL
SELECT 'Enfermeiro_Cirurgia', COUNT(*) FROM SGH.Enfermeiro_Cirurgia       -- 7
UNION ALL
SELECT 'Medico_Cirurgia',   COUNT(*) FROM SGH.Medico_Cirurgia;           -- 6


-- ============================================================
-- 2. JOIN simples — Ver dados completos das sub-entidades
--    de Pessoa (Paciente, Médico, Enfermeiro, Administrador)
-- ============================================================

-- 2a. Pacientes com os seus dados pessoais
-- Resultado esperado: 6 linhas
SELECT P.N_utente, O.Nome, O.Contacto, P.Grupo_Sanguineo, P.Historico_Medico
FROM (SGH.Paciente AS P JOIN SGH.Pessoa AS O ON P.CC = O.CC);

-- 2b. Médicos com os seus dados pessoais e especialidade
-- Resultado esperado: 4 linhas
SELECT M.N_medico, O.Nome, M.Especialidade, M.Hospital_Nome
FROM (SGH.Medico AS M JOIN SGH.Pessoa AS O ON M.CC = O.CC);

-- 2c. Enfermeiros com os seus dados pessoais
-- Resultado esperado: 4 linhas
SELECT E.N_enfermeiro, O.Nome, E.Hospital_Nome
FROM (SGH.Enfermeiro AS E JOIN SGH.Pessoa AS O ON E.CC = O.CC);

-- 2d. Administradores com os seus dados pessoais
-- Resultado esperado: 2 linhas
SELECT A.N_Administrador, O.Nome, A.Hospital_Nome
FROM (SGH.Administrador AS A JOIN SGH.Pessoa AS O ON A.CC = O.CC);


-- ============================================================
-- 3. JOIN com WHERE — Filtragem após junção
-- ============================================================

-- 3a. Pacientes com grupo sanguíneo tipo 'O' (O+ ou O-)
-- Resultado esperado: 2 linhas (Maria Santos O-, Catarina Rocha O+)
SELECT O.Nome, P.Grupo_Sanguineo
FROM (SGH.Paciente AS P JOIN SGH.Pessoa AS O ON P.CC = O.CC)
WHERE P.Grupo_Sanguineo LIKE 'O%';

-- 3b. Médicos que trabalham no Hospital de Braga
-- Resultado esperado: 3 linhas (Ricardo, Carlos, Beatriz... wait)
-- Na verdade: Ricardo (Cardio Braga), Carlos (Ortop Braga) = 2 no Braga
-- Sofia (Neuro Guimarães), Beatriz (Urgência Guimarães) = 2 no Guimarães
-- Resultado esperado: 2 linhas
SELECT O.Nome, M.Especialidade
FROM (SGH.Medico AS M JOIN SGH.Pessoa AS O ON M.CC = O.CC)
WHERE M.Hospital_Nome = 'Hospital de Braga';

-- 3c. Salas do tipo 'Bloco Operatório' (Tipo_Sala = 2)
-- Resultado esperado: 3 linhas (Salas 3, 4, 8)
SELECT S.N_Sala, S.Andar, S.Hospital_Nome, T.Designacao
FROM (SGH.Sala AS S JOIN SGH.Tipo_de_Sala AS T ON S.Tipo_Sala = T.Identificador)
WHERE T.Designacao = 'Bloco Operatório';


-- ============================================================
-- 4. JOIN encadeado — Cruzar 3+ tabelas
-- ============================================================

-- 4a. Avaliações: nome do paciente, nome do médico, data e sala
-- Resultado esperado: 8 linhas
SELECT A.N_Avaliacao, 
       PP.Nome AS Paciente, 
       PM.Nome AS Medico, 
       A.Data,
       A.N_Sala_Gabinete
FROM ((SGH.Avaliacao AS A
       JOIN SGH.Pessoa AS PP ON A.CC_Paciente = PP.CC)
       JOIN SGH.Pessoa AS PM ON A.CC_Medico = PM.CC);

-- 4b. Cirurgias: nome do paciente, diagnóstico, risco, sala e tipo de sala
-- Resultado esperado: 4 linhas
SELECT C.N_Cirurgia,
       P.Nome AS Paciente,
       D.Designacao AS Diagnostico,
       C.Risco,
       C.Data,
       S.N_Sala,
       T.Designacao AS Tipo_Sala
FROM ((((SGH.Cirurgia AS C
         JOIN SGH.Pessoa AS P ON C.CC_Paciente = P.CC)
         JOIN SGH.Diagnostico AS D ON C.N_Diagnostico = D.N_Diagnostico)
         JOIN SGH.Sala AS S ON C.N_Sala_Operacao = S.N_Sala)
         JOIN SGH.Tipo_de_Sala AS T ON S.Tipo_Sala = T.Identificador);

-- 4c. Equipamentos por sala: sala, andar, hospital, equipamento, quantidade
-- Resultado esperado: 11 linhas
SELECT S.N_Sala,
       S.Andar,
       S.Hospital_Nome,
       E.Nome AS Equipamento,
       SE.Quantidade
FROM ((SGH.Sala_Equipamento AS SE
       JOIN SGH.Sala AS S ON SE.N_Sala = S.N_Sala)
       JOIN SGH.Equipamento_Medico AS E ON SE.Identificador_Equipamento = E.Identificador);


-- ============================================================
-- 5. GROUP BY e COUNT — Agregações
-- ============================================================

-- 5a. Número de médicos por hospital
-- Resultado esperado: 2 linhas (Braga: 2, Guimarães: 2)
SELECT M.Hospital_Nome, COUNT(*) AS Num_Medicos
FROM SGH.Medico AS M
GROUP BY M.Hospital_Nome;

-- 5b. Número de avaliações por médico (com nome)
-- Resultado esperado: 4 linhas
SELECT P.Nome AS Medico, COUNT(*) AS Num_Avaliacoes
FROM (SGH.Avaliacao AS A JOIN SGH.Pessoa AS P ON A.CC_Medico = P.CC)
GROUP BY P.Nome;

-- 5c. Número de cirurgias por nível de risco
-- Resultado esperado: 2 linhas (Alto: 2, Médio: 2)
SELECT Risco, COUNT(*) AS Num_Cirurgias
FROM SGH.Cirurgia
GROUP BY Risco;

-- 5d. Quantidade total de equipamentos por sala (soma das quantidades)
-- Resultado esperado: linhas para salas 1,2,3,4,6,8,10
SELECT S.N_Sala, S.Hospital_Nome, SUM(SE.Quantidade) AS Total_Equipamentos
FROM (SGH.Sala_Equipamento AS SE JOIN SGH.Sala AS S ON SE.N_Sala = S.N_Sala)
GROUP BY S.N_Sala, S.Hospital_Nome;


-- ============================================================
-- 6. GROUP BY com HAVING — Filtragem sobre grupos
-- ============================================================

-- 6a. Médicos com mais de 1 avaliação
-- Resultado esperado: 4 linhas (Ricardo:2, Sofia:2, Carlos:2, Beatriz:2)
SELECT P.Nome AS Medico, COUNT(*) AS Num_Avaliacoes
FROM (SGH.Avaliacao AS A JOIN SGH.Pessoa AS P ON A.CC_Medico = P.CC)
GROUP BY P.Nome
HAVING COUNT(*) > 1;

-- 6b. Salas com mais de 2 equipamentos alocados (soma de quantidades)
-- Resultado esperado: salas que tenham SUM(Quantidade) > 2
SELECT SE.N_Sala, SUM(SE.Quantidade) AS Total_Equipamentos
FROM SGH.Sala_Equipamento AS SE
GROUP BY SE.N_Sala
HAVING SUM(SE.Quantidade) > 2;

-- 6c. Pacientes com mais de 1 avaliação
-- Resultado esperado: 2 linhas (João: 2, Maria: 2)
SELECT P.Nome AS Paciente, COUNT(*) AS Num_Avaliacoes
FROM (SGH.Avaliacao AS A JOIN SGH.Pessoa AS P ON A.CC_Paciente = P.CC)
GROUP BY P.Nome
HAVING COUNT(*) > 1;


-- ============================================================
-- 7. Subqueries — Consultas dentro de consultas
-- ============================================================

-- 7a. Pacientes que NUNCA fizeram uma cirurgia
-- Resultado esperado: 3 linhas (Maria, Pedro, ???)
SELECT O.Nome
FROM (SGH.Paciente AS P JOIN SGH.Pessoa AS O ON P.CC = O.CC)
WHERE P.CC NOT IN (SELECT CC_Paciente FROM SGH.Cirurgia);

-- 7b. Médicos que já participaram em pelo menos uma cirurgia
-- Resultado esperado: 4 linhas (todos participaram)
SELECT DISTINCT O.Nome, M.Especialidade
FROM (SGH.Medico AS M JOIN SGH.Pessoa AS O ON M.CC = O.CC)
WHERE M.CC IN (SELECT CC_Medico FROM SGH.Medico_Cirurgia);

-- 7c. Salas que NÃO têm nenhum equipamento alocado
-- Resultado esperado: salas 5, 7, 9
SELECT S.N_Sala, S.Hospital_Nome, T.Designacao AS Tipo
FROM (SGH.Sala AS S JOIN SGH.Tipo_de_Sala AS T ON S.Tipo_Sala = T.Identificador)
WHERE S.N_Sala NOT IN (SELECT N_Sala FROM SGH.Sala_Equipamento);


-- ============================================================
-- 8. EXISTS / NOT EXISTS
-- ============================================================

-- 8a. Avaliações que NÃO geraram nenhum diagnóstico
-- Resultado esperado: 1 linha (Avaliação 8)
SELECT A.N_Avaliacao, A.Data, P.Nome AS Paciente
FROM (SGH.Avaliacao AS A JOIN SGH.Pessoa AS P ON A.CC_Paciente = P.CC)
WHERE NOT EXISTS (
    SELECT * FROM SGH.Diagnostico AS D
    WHERE D.N_Avaliacao = A.N_Avaliacao
);

-- 8b. Diagnósticos que originaram cirurgia
-- Resultado esperado: 4 linhas (Diagnósticos 1, 3, 4, 6)
SELECT D.N_Diagnostico, D.Designacao
FROM SGH.Diagnostico AS D
WHERE EXISTS (
    SELECT * FROM SGH.Cirurgia AS C
    WHERE C.N_Diagnostico = D.N_Diagnostico
);


-- ============================================================
-- 9. ORDER BY — Ordenação de resultados
-- ============================================================

-- 9a. Todas as avaliações ordenadas por data (mais recente primeiro)
-- Resultado esperado: 8 linhas ordenadas DESC por data
SELECT A.N_Avaliacao, A.Data, PP.Nome AS Paciente, PM.Nome AS Medico
FROM ((SGH.Avaliacao AS A
       JOIN SGH.Pessoa AS PP ON A.CC_Paciente = PP.CC)
       JOIN SGH.Pessoa AS PM ON A.CC_Medico = PM.CC)
ORDER BY A.Data DESC;

-- 9b. Cirurgias ordenadas por risco (Alto primeiro) e depois por data
SELECT C.N_Cirurgia, C.Risco, C.Data, P.Nome AS Paciente
FROM (SGH.Cirurgia AS C JOIN SGH.Pessoa AS P ON C.CC_Paciente = P.CC)
ORDER BY C.Risco ASC, C.Data ASC;


-- ============================================================
-- 10. DISTINCT — Eliminar duplicados
-- ============================================================

-- 10a. Hospitais que têm pelo menos uma cirurgia (sem repetições)
-- Resultado esperado: 2 hospitais
SELECT DISTINCT S.Hospital_Nome
FROM (SGH.Cirurgia AS C JOIN SGH.Sala AS S ON C.N_Sala_Operacao = S.N_Sala);

-- 10b. Especialidades médicas distintas presentes no sistema
-- Resultado esperado: 4 especialidades
SELECT DISTINCT Especialidade FROM SGH.Medico;


-- ============================================================
-- 11. Consulta completa — Percurso clínico do paciente
--     Avaliação → Diagnóstico → Cirurgia (se existir)
-- ============================================================

SELECT PP.Nome AS Paciente,
       A.N_Avaliacao,
       A.Data AS Data_Avaliacao,
       PM.Nome AS Medico_Avaliacao,
       D.Designacao AS Diagnostico,
       C.N_Cirurgia,
       C.Data AS Data_Cirurgia,
       C.Risco
FROM (((SGH.Avaliacao AS A
        JOIN SGH.Pessoa AS PP ON A.CC_Paciente = PP.CC)
        JOIN SGH.Pessoa AS PM ON A.CC_Medico = PM.CC)
        LEFT OUTER JOIN SGH.Diagnostico AS D ON A.N_Avaliacao = D.N_Avaliacao)
        LEFT OUTER JOIN SGH.Cirurgia AS C ON D.N_Diagnostico = C.N_Diagnostico
ORDER BY PP.Nome, A.Data;
-- Resultado esperado: 8 linhas, com NULL em N_Cirurgia/Data_Cirurgia/Risco
-- quando não houve cirurgia (usa LEFT OUTER JOIN para manter avaliações
-- mesmo sem diagnóstico ou cirurgia associados)