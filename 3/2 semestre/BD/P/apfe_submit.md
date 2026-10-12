# BD: Trabalho Prático APFE

**Grupo**: PXGY
- António Fictício, MEC: 1000
- João Inventado, MEC: 2000

## Introdução
 
Escreva uma pequena introdução sobre o trabalho.

## ​Análise de Requisitos

Esta é a parte das principais entidades / utilizadores e as suas funcionalidades.

Requisitos:

Paciente: 

- É a pessoa que necessita de cuidados médicos no hospital.
- É quem procura os departamentos médicos disponíveis e os seus respetivos especialistas.
- Pode consultar o seu histórico clínico e diagnósticos anteriores.
- Pode visualizar as prescrições médicas (exames e medicamentos) e faturas associadas.

Médico:

- Acompanha a sua agenda diária e o histórico das consultas realizadas.
- É quem pode inserir os diagnósticos e está autorizado a emitir prescrições médicas (exames e medicamentos) e as faturas associadas.
- Tem autorização para consultar o histórico clínico dos pacientes que tem a seu cargo.

Enfermeiro:

- É a pessoa que irá consultar o planeamento do departamento ao qual pertence.
- Tem os dados básicos dos pacientes para apoio nas consultas e no tratamento dos pacientes.

Administrativo:

- Pode adicionar/remover pacientes, médicos e enfermeiros do sistema.
- É o principal responsável pela gestão dos funcionários de cada departamento.
- Gere os agendamentos de consultas e os estados das faturas no sistema.

Equipamento:

- Representa os equipamentos médicos disponíveis no hospital, como máquinas de ressonância magnética, equipamentos de raio-x, etc.
- Cada equipamento esta inventariado e alocado a um departamento específico, e tem um estado de disponibilidade.



ENTIDADES: las principales entidades de nuestra base de datos 

Pessoa: representa la instancia mas general del sistema conteniendo informacion como ( NIF ,nome, etc.)

Paciente: Representa o utente do hospital. É uma especialização de Pessoa, contendo dados clínicos básicos como o Grupo Sanguíneo e o Número de Utente.

Funcionário: Representa um trabalhador do hospital. É uma especialização de Pessoa, possuindo atributos como Data de Contratação e Salário Base.

Médico: Representa um profissional de saúde responsável pelas consultas. É uma especialização de Funcionário, que tem uma Especialidade, uma Cédula Profissional e pertence a um departamento.

Enfermeiro: Representa um profissional de enfermagem que auxilia nos processos clínicos. É uma especialização de Funcionário e está alocado a um departamento.

Administrativo: Representa o funcionário responsável pela gestão hospitalar, marcações e faturação. É uma especialização de Funcionário.

Departamento: Representa as diferentes alas ou especialidades médicas do hospital (ex: Cardiologia, Urgências), onde estão alocados os vários profissionais de saúde.

Consulta: Representa o evento clínico agendado. Cruza um Paciente e um Médico numa determinada data, hora e gabinete, servindo também para registar o diagnóstico final.

Prescrição: Representa os medicamentos ou exames receitados por um médico a um paciente específico durante uma consulta.

Fatura: Representa o registo financeiro gerado após a prestação de um serviço médico, sendo gerida pelo departamento administrativo para posterior liquidação por parte do paciente.

Fatura: Representa o registo financeiro gerado após a prestação de um serviço médico ou consulta, sendo gerida pelo departamento administrativo para controlar o estado de pagamento do paciente.

Equipamento: Representa os recursos físicos e maquinaria médica (ex: aparelhos de Raio-X, Ecógrafos). Cada equipamento está inventariado e alocado a um Departamento específico para controlo de uso.

Medicamento: Representa o catálogo de fármacos disponíveis na instituição. Vai relacionar-se diretamente com a Prescrição, permitindo detalhar exatamente o que foi receitado ao utente.

## DER


![Diagrama DER](der.jpg "Imagem")

## ER

![Diagrama ER](er.jpg "Imagem")
