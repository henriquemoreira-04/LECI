# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
funcionarios_com_supervisor = σ Super_ssn≠null (π Fname,Minit,Lname,Super_ssn (employee))

ssn_carlos = π Ssn (σ Fname='Carlos' ∧ Minit='D' ∧ Lname='Gomes' (employee))

π Ssn,Fname,Minit,Lname (funcionarios_com_supervisor ⨝Super_ssn=Ssn ssn_carlos)
```


### *b)* 

```
π employee.Ssn,Fname,Minit,Lname (employee ⨝ (Super_ssn=Carlos.Ssn) (ρ Carlos (π Ssn (σ Fname='Carlos' ∧ Minit='D' ∧ Lname='Gomes' (employee)))))
```


### *c)* 

```
γ Pnumber,Pname;sum(Hours)->horas (employee ⨝Ssn=Essn (project ⨝Pnumber=Pno works_on))
```


### *d)* 

```
funcionario_projeto = employee ⨝Ssn=Essn works_on

π Ssn,Fname,Minit,Lname (σ Dno=3 ∧ Hours>20 (funcionario_projeto))
```


### *e)* 

```
π Ssn,Fname,Minit,Lname (σ Pno=null (employee ⟕Ssn=Essn works_on))
```


### *f)* 

```
funcionario_departamento = employee ⨝Dno=Dnumber department

γ Dname;avg(Salary)->salario_medio (σ Sex='F' (funcionario_departamento))
```


### *g)* 

```
funcionarios_dependentes = employee ⨝Ssn=Essn dependent

numero_dependentes = γ Ssn,Fname,Minit,Lname;count(Dependent_name)->dependentes (funcionarios_dependentes)

π Ssn,Fname,Minit,Lname (σ dependentes>2 (numero_dependentes))
```


### *h)* 

```
gestores = employee ⨝Ssn=Mgr_ssn department

π Ssn,Fname,Minit,Lname (σ dependent.Essn=null (gestores ⟕Ssn=Essn dependent))
```


### *i)* 

```
projeto_funcionario = project ⨝Pno=Pnumber (employee ⨝Ssn=Essn works_on)

local_departamento = π department.Dnumber,Dname,Dlocation (department ⨝department.Dnumber=dept_location.Dnumber dept_location)

π Ssn,Fname,Minit,Lname,Address (σ dept_location.Dlocation≠'Aveiro' ∧ project.Plocation='Aveiro' (projeto_funcionario ⨝Dno=Dnumber local_departamento))
```


## ​Problema 5.2

### *a)*

```
π nome (σ numero=null (fornecedor⟕(nif=fornecedor) encomenda))
```

### *b)* 

```
γ codProd;avg(unidades)->TotalUnidades item
```


### *c)* 

```
tot_produtos_encomenda = γ numEnc; count(numEnc)-> total_product (item)

γ avg(total_product)-> numero_medio_produtos (tot_produtos_encomenda)
```


### *d)* 

```
fornecedor_encomenda = fornecedor⨝nif=fornecedor encomenda

produtos_fornecedor = π nome,codProd,unidades (item⨝numEnc=numero (fornecedor_encomenda))

produto_fornecedor = produto⨝codigo=codProd (produtos_fornecedor)

γ fornecedor.nome,produto.nome; sum(item.unidades)->UnidadesTotal (produto_fornecedor)
```


## ​Problema 5.3

### *a)*

```
π numUtente,nome (σ numPresc = null (paciente ⟕ prescricao))
```

### *b)* 

```
medico_prescricao = medico ⨝numSNS=numMedico prescricao

γ especialidade;count(especialidade)->numero_prescricoes (medico_prescricao)
```


### *c)* 

```
prescricao_farmacia = farmacia ⨝nome=farmacia prescricao

γ nome;count(numPresc)->prescricoes_processadas (prescricao_farmacia)
```


### *d)* 

```
todos_farmacos_famacia906 = π nome (σ numRegFarm=906 (farmaco))

farmacos_farmacia906 = π presc_farmaco.nomeFarmaco (σ numRegFarm=906 (presc_farmaco))

todos_farmacos_famacia906-farmacos_farmacia906
```

### *e)* 

```
prescricao_farmacia = farmacia ⨝nome=farmacia prescricao

farmaceutica_farmaco_farmacia = π presc_farmaco.numPresc, numRegFarm, nomeFarmaco, nome (presc_farmaco ⨝prescricao.numPresc=presc_farmaco.numPresc (prescricao_farmacia))

nomeFarmaceutica_farmaco_farmacia = π presc_farmaco.numPresc, farmaceutica.nome, nomeFarmaco, farmacia.nome (farmaceutica ⨝numReg=numRegFarm farmaceutica_farmaco_farmacia)

γ farmacia.nome,farmaceutica.nome;count(farmaceutica.nome)->vendas (nomeFarmaceutica_farmaco_farmacia)
```

### *f)* 

```
prescricao_paciente = prescricao ⨝prescricao.numUtente=paciente.numUtente paciente

medico_paciente = π numSNS,medico.nome,paciente.nome (medico ⨝numSNS=numMedico (prescricao_paciente))

γ paciente.nome;count(medico.nome)->num_medicos (medico_paciente)
```
