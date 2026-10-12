# BD: Guião 8

## ​8.1. Complete a seguinte tabela.

Complete the following table.

| #   | Query                                                                                                      | Rows  | Cost  | Pag. Reads | Time (ms) | Index used               | Index Op.            | Discussion |
| :-- | :--------------------------------------------------------------------------------------------------------- | :---- | :---- | :--------- | :-------- | :----------------------- | :------------------- | :--------- |
| 1   | SELECT \* from Production.WorkOrder                                                                        | 72591 | 0.484 | 531        | 1171      | PK_WorkOrder_WorkOrderID | Clustered Index Scan |            |
| 2   | SELECT \* from Production.WorkOrder where WorkOrderID=1234                                                 | 1     | 0.000 | 28         | 35        | PK_WorkOrder_WorkOrderID | Clustered Index Scan |            |
| 3.1 | SELECT \* FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010                              | 11    | 0.000 | 286        | 68        | PK_WorkOrder_WorkOrderID | Clustered Index Scan |            |
| 3.2 | SELECT \* FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591                                  | 72591 | 0.080 | 575        | 776       | PK_WorkOrder_WorkOrderID | Clustered Index Scan |            |
| 4   | SELECT \* FROM Production.WorkOrder WHERE StartDate = '2007-06-25'                                         | 0     | 0.080 | 1724       | 121       | PK_WorkOrder_WorkOrderID | Clustered Index Scan |            |
| 5   | SELECT \* FROM Production.WorkOrder WHERE ProductID = 757                                                  | 9     | 0.000 | 48         | 200       | IX_WorkOrder_ProductID   | Index Seek           |            |
| 6.1 | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 757                              | 9     | 0.000 | 64         | 86        | IX_WorkOrder_ProductID   | Index Seek           |            |
| 6.2 | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945                              | 1105  | 0.000 | 556        | 54        | PK_WorkOrder_WorkOrderID | Clustered Index Scan |            |
| 6.3 | SELECT WorkOrderID FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2012-05-09'            | 1     | 0.001 | 558        | 16        | PK_WorkOrder_WorkOrderID | Clustered Index Scan |            |
| 7   | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2012-05-09' | 1     | 0.008 | 558        | 79        | PK_WorkOrder_WorkOrderID | Clustered Index Scan |            |
| 8   | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2012-05-09' | 1     | 0.000 | 558        | 78        | PK_WorkOrder_WorkOrderID | Clustered Index Scan |            |

## ​8.2.

### a)

```
ALTER TABLE mytemp
ADD CONSTRAINT PK_mytemp_rid PRIMARY KEY CLUSTERED (rid);
```

### b)

```
Inserted      50000 total records
Milliseconds used: 114530

A percentagem de fragmentação dos índices: 99,04 %
Ocupação das páginas dos índices: 68,69 %
```

### c)

```
-- CREATE UNIQUE CLUSTERED INDEX  ridIndex_c1 ON mytemp(rid) WITH (FILLFACTOR = 65, PAD_INDEX = ON)
-- Tempo: 1:56

-- CREATE UNIQUE CLUSTERED INDEX  ridIndex_c1 ON mytemp(rid) WITH (FILLFACTOR = 80, PAD_INDEX = ON)
-- Tempo: 1:52

-- CREATE UNIQUE CLUSTERED INDEX  ridIndex_c1 ON mytemp(rid) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
-- Tempo: 1:53
```

### d)

```
Criando uma tabela com o seguinte codigo:
CREATE TABLE mytemp (
    rid BIGINT IDENTITY (1, 1) NOT NULL,
    at1 INT NULL,
    at2 INT NULL,
    at3 INT NULL,
    lixo varchar(100) NULL
);

-- CREATE UNIQUE CLUSTERED INDEX  ridIndex_c1 ON mytemp(rid) WITH (FILLFACTOR = 65, PAD_INDEX = ON)
-- Tempo: 1:55

-- CREATE UNIQUE CLUSTERED INDEX  ridIndex_c1 ON mytemp(rid) WITH (FILLFACTOR = 80, PAD_INDEX = ON)
-- Tempo: 1:55

-- CREATE UNIQUE CLUSTERED INDEX  ridIndex_c1 ON mytemp(rid) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
-- Tempo: 1:54
```

### e)

```
CREATE INDEX IX_mytemp_at1 ON mytemp(at1);
CREATE INDEX IX_mytemp_at2 ON mytemp(at2);
CREATE INDEX IX_mytemp_at3 ON mytemp(at3);

Os tempos de execução aumentam uma vez que a operação está a ser efetuada para cada indice criado
```

## ​8.3.

```
-- i)
CREATE UNIQUE CLUSTERED INDEX ssnEmployee ON employee(Ssn);

-- ii)
CREATE INDEX names ON employee(Lname, Fname);

-- iii)
CREATE INDEX Dno ON employe(Dno);

-- iv)
CREATE CLUSTERED INDEX Works ON works_on(Essn, Pno);

-- v)
CREATE CLUSTERED INDEX dependent ON dependent(Essn);

--vi)
CREATE INDEX DNum ON project(Dnum);
```
