# BD: Trabalho Prático APFE

**Grupo**: P6G2

- Miguel Santos, MEC: 119649
- Henrique Malaver, MEC: 119809

## Introdução / Introduction

Neste projeto, vamos tentar modelar um **Sistema de Gestão Hospitalar**. O sistema permitirá o acompanhamento do percurso do paciente, desde a marcação de consultas até à faturação, passando pela alocação de profissionais de saúde aos respetivos departamentos.

O sistema tem como objetivo facilitar o trabalho de médicos, enfermeiros e pessoal administrativo, permitindo aos utilizadores gerir as suas agendas, registar diagnósticos e consultar o histórico médico dos pacientes, de forma eficiente e segura.

Em resumo, o nosso sistema fornecerá uma solução centralizada e robusta para facilitar a gestão hospitalar, melhorando a experiência dos utentes, a eficiência dos profissionais de saúde e a organização da administração do hospital.

## ​Análise de Requisitos / Requirements

### **Entidades**

| Entidades | Descrição | Atributos |
|---|---|---|
| *Pessoa* | Entidade mais genérica do sistema| <ul><li>Nome</li><li>Contacto</li><li>Morada</li><li>NIF</li><li>Cartão de Cidadão</li></ul> |
| *Paciente* | Utente do Hospital. <br>Instância de Pessoa. | <ul><li>Número de Utente</li><li>Grupo Sanguíneo</li><li>Histórico Médico</li></ul> |
| *Médico* | Profissional de Saúde responsável pelas consultas. <br>Instância de Pessoa. | <ul><li>Especialidade</li><li>Cédula Profissional</li><li>Número de Médico</li><li>Número Departamento</li></ul> |
| *Enfermeiro* | Profissional de Enfermagem. <br>Instância de Pessoa. | <ul><li>Número de Enfermeiro</li><li>Número Departamento</li></ul> |
| *Administrativo* | Responsável pela gestão hospitalar. <br>Instância de Pessoa. | <ul><li>Número de Administrador</li><li>Número Departamento</li></ul> |
| *Departamento* | Representa as diferentes alas ou especialidades médicas do hospital. | <ul><li>Nome</li><li>Número Departamento</li></ul> |
| *Consulta* | Representa o evento clínico agendado. Cruza um Paciente e um Médico numa determinada data, hora e gabinete, servindo também para registar o diagnóstico final. | <ul><li>Número Consulta</li><li>Data</li><li>Hora</li><li>Gabinete</li><li>Diagnóstico</li><li>Número Médico</li><li>Número Paciente</li></ul> |
| *Prescrição* | Representa os medicamentos ou exames receitados por um médico a um paciente específico durante uma consulta. | <ul><li>Número Prescrição</li><li>Medicamento</li><li>Número de Médico</li><li>Número de Paciente</li><li>Data e Hora</li></ul> |
| *Fatura* | Representa o registo financeiro gerado após a prestação de um serviço médico ou consulta, sendo gerida pelo departamento administrativo para controlar o estado de pagamento do paciente. | <ul><li>Número Fatura</li><li>Valor</li><li>Estado de Pagamento</li><li>Numero de Paciente</li><li>Numero de Consulta</li></ul> |
| *Equipamento* | Representa os recursos físicos e maquinaria médica (ex: aparelhos de Raio-X, Ecógrafos). Cada equipamento está inventariado e alocado a um Departamento específico para controlo de uso. | <ul><li>Número de Equipamento</li><li>Nome</li><li>Descrição</li><li>Número Departamento</li></ul> |
| *Fármaco* | Representa o catálogo de fármacos disponíveis na instituição. Vai relacionar-se diretamente com a Prescrição, permitindo detalhar exatamente o que foi receitado ao utente. | <ul><li>Número de Fármaco</li><li>Nome</li><li>Dosagem</li><li>Quantidade</li></ul> |
| | | |

### **Requisitos Funcionais**

| Entidades | Funcionalidades |
|---|---|
| *Paciente* | <ul><li>Pedir marcação/cancelamento de consultas</li><li>Consultar histórico médico</li><li>Faturação</li></ul> |
| *Médico* | <ul><li>Consultar agenda</li><li>Consultar paciente</li><li>Realizar consultas</li><li>Prescrever tratamentos</li><li>Consultar histórico médico</li></ul> |
| *Enfermeiro* | <ul><li>Consultar agenda</li><li>Consultar paciente</li><li>Realizar consultas</li><li>Prescrever tratamentos</li><li>Consultar histórico médico</li></ul> |
| *Administrativo* | <ul><li>Consultar agenda</li><li>Consultar paciente</li><li>Gerir médicos/enfermeiros</li><li>Gerir faturas</li><li>Gerir Inventário</li><li>Gerir Equipamento</li><li>Gerir Fármacos</li><li>Gerir Prescrições</li><li>Gerir Consultas</li></ul> |
| | |

## DER

![DER Diagram!](der.jpg "AnImage")

## ER

![ER Diagram!](er.jpg "AnImage")
