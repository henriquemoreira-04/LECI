# BD: Trabalho Prático APFE

**Grupo**: P6G2

- Miguel Santos, MEC: 119649
- Henrique Malaver, MEC: 119809

## Introdução / Introduction

Neste projeto, vamos tentar modelar um **Sistema de Gestão Hospitalar**. O sistema permitirá o acompanhamento do percurso do paciente, desde a marcação de avaliações até à realização de cirurgias, passando pela alocação de profissionais de saúde aos respetivos departamentos.

O sistema tem como objetivo facilitar o trabalho de médicos, enfermeiros e pessoal administrativo, permitindo aos utilizadores gerir as suas agendas, registar diagnósticos e consultar o histórico médico dos pacientes, de forma eficiente e segura.

Em resumo, o nosso sistema fornecerá uma solução centralizada e robusta para facilitar a gestão hospitalar, melhorando a experiência dos utentes, a eficiência dos profissionais de saúde e a organização da administração do hospital.

## ​Análise de Requisitos / Requirements

### **Entidades**

| Entidades | Descrição | Atributos |
|---|---|---|
| *Pessoa* | Entidade mais genérica do sistema. | <ul><li>CC (Cartão de Cidadão)</li><li>NIF</li><li>Nome</li><li>Contacto</li><li>Morada</li></ul> |
| *Paciente* | Utente do Hospital. <br>Instância de Pessoa. | <ul><li>CC</li><li>Número de Utente</li><li>Grupo Sanguíneo</li><li>Histórico Médico</li></ul> |
| *Médico* | Profissional de Saúde responsável pelas avaliações. <br>Instância de Pessoa. Pertence a um Departamento. | <ul><li>CC</li><li>Número de Médico</li><li>Especialidade</li><li>Histórico Consultas</li><li>Número Departamento</li><li>Nome Hospital</li></ul> |
| *Enfermeiro* | Profissional de Enfermagem. <br>Instância de Pessoa. Pertence a um Departamento. | <ul><li>CC</li><li>Número de Enfermeiro</li><li>Histórico Consultas</li><li>Número Departamento</li><li>Nome Hospital</li></ul> |
| *Administrador* | Responsável pela gestão hospitalar. <br>Instância de Pessoa. Pertence a um Departamento. | <ul><li>CC</li><li>Número de Administrador</li><li>Número Departamento</li><li>Nome Hospital</li></ul> |
| *Hospital* | Representa a instituição hospitalar à qual os departamentos pertencem. | <ul><li>Nome</li><li>Localização</li></ul> |
| *Departamento* | Representa as diferentes alas ou especialidades médicas do hospital. Pertence a um Hospital. | <ul><li>Número Departamento</li><li>Nome</li><li>Nome Hospital</li></ul> |
| *Tipo de Sala* | Classifica as salas do hospital por finalidade (ex: gabinete, bloco operatório, enfermaria). | <ul><li>Identificador</li><li>Designação</li></ul> |
| *Sala* | Representa as salas ou gabinetes do hospital, associadas a um departamento e a um tipo. | <ul><li>Número Sala</li><li>Andar</li><li>Número Departamento</li><li>Nome Hospital</li><li>Tipo Sala</li></ul> |
| *Equipamento Médico* | Representa os recursos físicos e maquinaria médica (ex: aparelhos de Raio-X, Ecógrafos). | <ul><li>Identificador</li><li>Nome</li></ul> |
| *Sala_Equipamento* | Tabela associativa que regista quais equipamentos estão alocados a cada sala e em que quantidade. | <ul><li>Número Sala</li><li>Identificador Equipamento</li><li>Quantidade</li></ul> |
| *Avaliação* | Representa o evento clínico agendado, cruzando um Paciente e um Médico numa determinada data e sala. | <ul><li>Número Avaliação</li><li>Data</li><li>CC Paciente</li><li>CC Médico</li><li>Número Sala/Gabinete</li></ul> |
| *Diagnóstico* | Resultado clínico produzido por uma avaliação, contendo a designação e a data do diagnóstico. | <ul><li>Número Diagnóstico</li><li>Número Avaliação</li><li>Data</li><li>Designação</li></ul> |
| *Cirurgia* | Procedimento cirúrgico originado por um diagnóstico, realizado numa sala de operações sobre um paciente. | <ul><li>Número Cirurgia</li><li>Data</li><li>Risco</li><li>Observações</li><li>CC Paciente</li><li>Número Sala Operação</li><li>Número Diagnóstico</li><li>Número Avaliação</li></ul> |
| *Enfermeiro_Cirurgia* | Tabela associativa que regista quais enfermeiros assistem a cada cirurgia. | <ul><li>CC Enfermeiro</li><li>Número Cirurgia</li></ul> |
| *Medico_Cirurgia* | Tabela associativa que regista quais médicos realizam cada cirurgia. | <ul><li>CC Médico</li><li>Número Cirurgia</li></ul> |
| | | |

### **Requisitos Funcionais**

| Entidades | Funcionalidades |
|---|---|
| *Paciente* | <ul><li>Pedir marcação/cancelamento de avaliações</li><li>Consultar histórico médico</li></ul> |
| *Médico* | <ul><li>Consultar agenda</li><li>Consultar paciente</li><li>Realizar avaliações</li><li>Registar diagnósticos</li><li>Participar em cirurgias</li><li>Consultar histórico médico</li></ul> |
| *Enfermeiro* | <ul><li>Consultar agenda</li><li>Consultar paciente</li><li>Assistir em cirurgias</li><li>Consultar histórico médico</li></ul> |
| *Administrador* | <ul><li>Consultar agenda</li><li>Consultar paciente</li><li>Gerir médicos/enfermeiros</li><li>Gerir Inventário</li><li>Gerir Equipamento Médico</li><li>Gerir Salas</li><li>Gerir Avaliações</li><li>Gerir Cirurgias</li></ul> |
| | |

## DER

![DER Diagram!](der.png "AnImage")

## ER

![ER Diagram!](er.png "AnImage")