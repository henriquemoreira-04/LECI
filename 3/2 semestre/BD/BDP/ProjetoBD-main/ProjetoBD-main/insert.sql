-- ============================================================
-- Base de Dados : Sistema de Gestão Hospitalar
-- Script de Inserção de Dados (DML)
-- ============================================================
-- NOTA: A ordem de inserção respeita as dependências de FK.
--       Todos os identificadores numéricos começam em 1.
-- ============================================================


-- ============================================================
-- FASE 1: Tabelas sem dependências
-- ============================================================

-- 1. PESSOA (CC: PK | NIF: UNIQUE)
-- CC 1-6   → Pacientes
-- CC 7-10  → Médicos
-- CC 11-14 → Enfermeiros
-- CC 15-16 → Administradores
-- ============================================================
INSERT INTO SGH.Pessoa (CC, NIF, Nome, Contacto, Morada) VALUES
('1',  '1',  'João Silva',        '912345001', 'Rua das Flores 1, Braga'),
('2',  '2',  'Maria Santos',      '912345002', 'Rua do Carmo 15, Braga'),
('3',  '3',  'António Costa',     '912345003', 'Av. da Liberdade 30, Guimarães'),
('4',  '4',  'Ana Ferreira',      '912345004', 'Rua de São João 8, Braga'),
('5',  '5',  'Pedro Oliveira',    '912345005', 'Largo do Toural 12, Guimarães'),
('6',  '6',  'Catarina Rocha',    '912345006', 'Rua do Souto 22, Braga'),
('7',  '7',  'Ricardo Mendes',    '912345007', 'Rua da Boavista 5, Braga'),
('8',  '8',  'Sofia Almeida',     '912345008', 'Rua de Santa Maria 18, Guimarães'),
('9',  '9',  'Carlos Pereira',    '912345009', 'Rua dos Chãos 7, Braga'),
('10', '10', 'Beatriz Lopes',     '912345010', 'Praça da República 3, Guimarães'),
('11', '11', 'Tiago Martins',     '912345011', 'Rua do Raio 9, Braga'),
('12', '12', 'Inês Ribeiro',      '912345012', 'Rua de Camões 14, Guimarães'),
('13', '13', 'Daniel Sousa',      '912345013', 'Rua Nova 21, Braga'),
('14', '14', 'Laura Gomes',       '912345014', 'Rua de Gil Vicente 6, Guimarães'),
('15', '15', 'Fernando Cardoso',  '912345015', 'Rua D. Afonso Henriques 10, Braga'),
('16', '16', 'Helena Pinto',      '912345016', 'Rua da Oliveira 25, Guimarães');


-- 2. HOSPITAL (Nome: PK)
-- ============================================================
INSERT INTO SGH.Hospital (Nome, Localizacao) VALUES
('Hospital de Braga',     'Sete Fontes, São Victor, Braga'),
('Hospital de Guimarães', 'Rua dos Cutileiros, Creixomil, Guimarães');


-- 3. TIPO DE SALA (Identificador: PK)
-- ============================================================
INSERT INTO SGH.Tipo_de_Sala (Identificador, Designacao) VALUES
(1, 'Gabinete'),
(2, 'Bloco Operatório'),
(3, 'Enfermaria'),
(4, 'Laboratório');


-- 4. EQUIPAMENTO MÉDICO (Identificador: PK)
-- ============================================================
INSERT INTO SGH.Equipamento_Medico (Identificador, Nome) VALUES
(1, 'Aparelho de Raio-X'),
(2, 'Ecógrafo'),
(3, 'Monitor Cardíaco'),
(4, 'Desfibrilhador'),
(5, 'Ventilador Mecânico'),
(6, 'Eletrocardiograma');


-- ============================================================
-- FASE 2: Tabelas com uma camada de dependência
-- ============================================================

-- 5. DEPARTAMENTO (PK composta: N_Departamento + Hospital_Nome)
--    FK → Hospital(Nome)
-- ============================================================
INSERT INTO SGH.Departamento (N_Departamento, Nome, Hospital_Nome) VALUES
(1, 'Cardiologia', 'Hospital de Braga'),
(2, 'Ortopedia',   'Hospital de Braga'),
(3, 'Pediatria',   'Hospital de Braga'),
(1, 'Urgência',    'Hospital de Guimarães'),
(2, 'Neurologia',  'Hospital de Guimarães');


-- 6. PACIENTE (CC: PK | N_utente: UNIQUE)
--    FK → Pessoa(CC)
-- ============================================================
INSERT INTO SGH.Paciente (CC, N_utente, Grupo_Sanguineo, Historico_Medico) VALUES
('1', '1', 'A+',  'Sem antecedentes relevantes'),
('2', '2', 'O-',  'Diabetes tipo 2'),
('3', '3', 'B+',  'Hipertensão arterial'),
('4', '4', 'AB+', 'Asma crónica'),
('5', '5', 'A-',  'Sem antecedentes relevantes'),
('6', '6', 'O+',  'Alergia a penicilina');


-- 7. SALA (N_Sala: PK)
--    FK → Departamento(N_Departamento, Hospital_Nome)
--    FK → Tipo_de_Sala(Identificador)
-- ---------------------------------------------------------
--  Salas Gabinete (Tipo 1):           1, 2, 6, 7
--  Salas Bloco Operatório (Tipo 2):   3, 4, 8
--  Salas Enfermaria (Tipo 3):         5, 9
--  Salas Laboratório (Tipo 4):        10
-- ============================================================
INSERT INTO SGH.Sala (N_Sala, Andar, N_Departamento, Hospital_Nome, Tipo_Sala) VALUES
(1,  1, 1, 'Hospital de Braga',     1),   -- Gabinete, Cardiologia, Braga
(2,  1, 2, 'Hospital de Braga',     1),   -- Gabinete, Ortopedia, Braga
(3,  2, 1, 'Hospital de Braga',     2),   -- Bloco Op., Cardiologia, Braga
(4,  2, 2, 'Hospital de Braga',     2),   -- Bloco Op., Ortopedia, Braga
(5,  1, 3, 'Hospital de Braga',     3),   -- Enfermaria, Pediatria, Braga
(6,  1, 1, 'Hospital de Guimarães', 1),   -- Gabinete, Urgência, Guimarães
(7,  1, 2, 'Hospital de Guimarães', 1),   -- Gabinete, Neurologia, Guimarães
(8,  2, 1, 'Hospital de Guimarães', 2),   -- Bloco Op., Urgência, Guimarães
(9,  1, 2, 'Hospital de Guimarães', 3),   -- Enfermaria, Neurologia, Guimarães
(10, 1, 1, 'Hospital de Braga',     4);   -- Laboratório, Cardiologia, Braga


-- ============================================================
-- FASE 3: Tabelas com duas camadas de dependência
-- ============================================================

-- 8. ADMINISTRADOR (CC: PK | N_Administrador: UNIQUE)
--    FK → Pessoa(CC)
--    FK → Departamento(N_Departamento, Hospital_Nome)
-- ============================================================
INSERT INTO SGH.Administrador (CC, N_Administrador, Departamento_N, Hospital_Nome) VALUES
('15', '1', 1, 'Hospital de Braga'),
('16', '2', 1, 'Hospital de Guimarães');


-- 9. ENFERMEIRO (CC: PK | N_enfermeiro: UNIQUE)
--    FK → Pessoa(CC)
--    FK → Departamento(N_Departamento, Hospital_Nome)
-- ============================================================
INSERT INTO SGH.Enfermeiro (CC, N_enfermeiro, Historico_Consultas, Departamento_N, Hospital_Nome) VALUES
('11', '1', NULL, 1, 'Hospital de Braga'),
('12', '2', NULL, 1, 'Hospital de Guimarães'),
('13', '3', NULL, 2, 'Hospital de Braga'),
('14', '4', NULL, 2, 'Hospital de Guimarães');


-- 10. MÉDICO (CC: PK | N_medico: UNIQUE)
--     FK → Pessoa(CC)
--     FK → Departamento(N_Departamento, Hospital_Nome)
-- ============================================================
INSERT INTO SGH.Medico (CC, N_medico, Especialidade, Historico_Consultas, Departamento_N, Hospital_Nome) VALUES
('7',  '1', 'Cardiologia', NULL, 1, 'Hospital de Braga'),
('8',  '2', 'Neurologia',  NULL, 2, 'Hospital de Guimarães'),
('9',  '3', 'Ortopedia',   NULL, 2, 'Hospital de Braga'),
('10', '4', 'Urgência',    NULL, 1, 'Hospital de Guimarães');


-- 11. SALA_EQUIPAMENTO (PK composta: N_Sala + Identificador_Equipamento)
--     FK → Sala(N_Sala)
--     FK → Equipamento_Medico(Identificador)
-- ============================================================
INSERT INTO SGH.Sala_Equipamento (N_Sala, Identificador_Equipamento, Quantidade) VALUES
(1,  6, 1),   -- Gabinete Cardio Braga: Eletrocardiograma x1
(1,  3, 1),   -- Gabinete Cardio Braga: Monitor Cardíaco x1
(2,  1, 1),   -- Gabinete Ortop Braga: Raio-X x1
(3,  3, 2),   -- Bloco Op. Cardio Braga: Monitor Cardíaco x2
(3,  4, 1),   -- Bloco Op. Cardio Braga: Desfibrilhador x1
(3,  5, 1),   -- Bloco Op. Cardio Braga: Ventilador Mecânico x1
(4,  1, 1),   -- Bloco Op. Ortop Braga: Raio-X x1
(6,  3, 1),   -- Gabinete Urgência Guim: Monitor Cardíaco x1
(8,  4, 1),   -- Bloco Op. Urgência Guim: Desfibrilhador x1
(8,  5, 2),   -- Bloco Op. Urgência Guim: Ventilador Mecânico x2
(10, 2, 1);   -- Laboratório Braga: Ecógrafo x1


-- ============================================================
-- FASE 4: Fluxo clínico (cadeia de eventos)
-- ============================================================

-- 12. AVALIAÇÃO (N_Avaliacao: PK)
--     FK → Paciente(CC)
--     FK → Medico(CC)
--     FK → Sala(N_Sala) — salas tipo Gabinete: 1, 2, 6, 7
-- ============================================================
INSERT INTO SGH.Avaliacao (N_Avaliacao, Data, CC_Paciente, CC_Medico, N_Sala_Gabinete) VALUES
(1, '2025-01-10', '1', '7',  1),   -- João c/ Dr. Ricardo (Cardio), Gab. Braga
(2, '2025-01-15', '2', '7',  1),   -- Maria c/ Dr. Ricardo (Cardio), Gab. Braga
(3, '2025-02-05', '3', '9',  2),   -- António c/ Dr. Carlos (Ortop), Gab. Braga
(4, '2025-02-20', '4', '10', 6),   -- Ana c/ Dra. Beatriz (Urgência), Gab. Guimarães
(5, '2025-03-01', '5', '8',  7),   -- Pedro c/ Dra. Sofia (Neuro), Gab. Guimarães
(6, '2025-03-10', '6', '9',  2),   -- Catarina c/ Dr. Carlos (Ortop), Gab. Braga
(7, '2025-03-20', '1', '8',  7),   -- João c/ Dra. Sofia (Neuro), Gab. Guimarães
(8, '2025-04-05', '2', '10', 6);   -- Maria c/ Dra. Beatriz (Urgência), Gab. Guimarães


-- 13. DIAGNÓSTICO (N_Diagnostico: PK)
--     FK → Avaliacao(N_Avaliacao)
--     Data do diagnóstico >= Data da avaliação
-- ============================================================
INSERT INTO SGH.Diagnostico (N_Avaliacao, N_Diagnostico, Data, Designacao) VALUES
(1, 1, '2025-01-10', 'Arritmia cardíaca'),
(2, 2, '2025-01-15', 'Insuficiência cardíaca leve'),
(3, 3, '2025-02-05', 'Fratura do fémur'),
(4, 4, '2025-02-20', 'Apendicite aguda'),
(5, 5, '2025-03-01', 'Enxaqueca crónica'),
(6, 6, '2025-03-10', 'Hérnia discal lombar'),
(7, 7, '2025-03-20', 'Nevralgia do trigémeo');


-- 14. CIRURGIA (N_Cirurgia: PK)
--     FK → Paciente(CC)
--     FK → Sala(N_Sala) — salas tipo Bloco Operatório: 3, 4, 8
--     FK → Diagnostico(N_Diagnostico)
--     Apenas diagnósticos que requerem intervenção cirúrgica.
-- ============================================================
INSERT INTO SGH.Cirurgia (N_Cirurgia, Data, Risco, Observacoes, CC_Paciente, N_Sala_Operacao, N_Diagnostico) VALUES
(1, '2025-01-25', 'Alto',  'Ablação por cateter para correção de arritmia',       '1', 3, 1),
(2, '2025-02-15', 'Médio', 'Redução cirúrgica de fratura com colocação de placa', '3', 4, 3),
(3, '2025-03-01', 'Alto',  'Apendicectomia de urgência',                          '4', 8, 4),
(4, '2025-03-25', 'Médio', 'Discectomia lombar minimamente invasiva',             '6', 4, 6);


-- 15. ENFERMEIRO_CIRURGIA (PK composta: CC_Enfermeiro + N_Cirurgia)
--     FK → Enfermeiro(CC)
--     FK → Cirurgia(N_Cirurgia)
-- ============================================================
INSERT INTO SGH.Enfermeiro_Cirurgia (CC_Enfermeiro, N_Cirurgia) VALUES
('11', 1),   -- Tiago assiste cirurgia 1 (Braga)
('13', 1),   -- Daniel assiste cirurgia 1 (Braga)
('11', 2),   -- Tiago assiste cirurgia 2 (Braga)
('13', 2),   -- Daniel assiste cirurgia 2 (Braga)
('12', 3),   -- Inês assiste cirurgia 3 (Guimarães)
('14', 3),   -- Laura assiste cirurgia 3 (Guimarães)
('13', 4);   -- Daniel assiste cirurgia 4 (Braga)


-- 16. MEDICO_CIRURGIA (PK composta: CC_Medico + N_Cirurgia)
--     FK → Medico(CC)
--     FK → Cirurgia(N_Cirurgia)
-- ============================================================
INSERT INTO SGH.Medico_Cirurgia (CC_Medico, N_Cirurgia) VALUES
('7',  1),   -- Dr. Ricardo (Cardio) opera cirurgia 1
('9',  2),   -- Dr. Carlos (Ortop) opera cirurgia 2
('7',  2),   -- Dr. Ricardo (Cardio) assiste cirurgia 2
('10', 3),   -- Dra. Beatriz (Urgência) opera cirurgia 3
('8',  3),   -- Dra. Sofia (Neuro) assiste cirurgia 3
('9',  4);   -- Dr. Carlos (Ortop) opera cirurgia 4