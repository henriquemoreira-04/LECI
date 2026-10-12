# BD: Guião 9


## ​9.1
 
### *a)*

```
CREATE PROCEDURE remover_funcionario 
  @ssn char(9)
AS
BEGIN
  -- Obter o ID do funcionário a ser removido
  DECLARE @v_id char(9);
  SELECT @v_id = Ssn FROM Employee WHERE Ssn = @ssn;
   
  -- Remover entradas na tabela works_on
  DELETE FROM Works_on WHERE Essn = @v_id;
  
  -- Remover dependentes
  DELETE FROM Dependent WHERE Essn = @v_id;
  
  -- Remover funcionário
  DELETE FROM Employee WHERE Ssn = @v_id;

  UPDATE Employee set Super_ssn = NULL where Super_ssn = @ssn;
  
END;

Utilizar transações para manter a consistência dos dados.
Verificar se o funcionário existe nas tabelas antes de executar as exclusões.
Configurar restrições de chave estrangeira para garantir a integridade dos dados ao excluir registros relacionados.
Lidar com erros durante a execução, capturando exceções e fornecendo lógica de tratamento adequada.
Verificar se o usuário possui as permissões necessárias para acessar, modificar e excluir os registros nas tabelas relevantes.
```

### *b)* 

```
CREATE PROCEDURE getManagerInfo
AS
BEGIN
    -- Obtém a data atual
    DECLARE @currentDate AS DATE = GETDATE();

    -- Cria uma tabela temporária para armazenar os dados dos gestores
    CREATE TABLE #ManagerInfo
    (
        Ssn VARCHAR(10),
        YearsOfService INT
    );

    -- Insere os dados dos gestores na tabela temporária
    INSERT INTO #ManagerInfo (Ssn, YearsOfService)
    SELECT Mgr_ssn, DATEDIFF(YEAR, Mgr_start_date, @currentDate) AS YearsOfService
    FROM Department
    WHERE Mgr_ssn IS NOT NULL;

    -- Obtém os dados dos gestores
    SELECT E.Fname, E.Minit, E.LName, E.Ssn, D.Mgr_ssn, MI.YearsOfService
    FROM Employee E
    INNER JOIN Department D ON E.Ssn = D.Mgr_ssn
    INNER JOIN #ManagerInfo MI ON E.Ssn = MI.Ssn;

    -- Obtém o ssn e número de anos do gestor mais antigo
    SELECT TOP 1 Ssn, YearsOfService
    FROM #ManagerInfo
    ORDER BY YearsOfService DESC;

    -- Remove a tabela temporária
    DROP TABLE #ManagerInfo;
END;
```

### *c)* 

```
CREATE TRIGGER tr_check_manager_assignment
ON Company.Department
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT Mgr_ssn
        FROM Department
        WHERE Mgr_ssn IN (
            SELECT Mgr_ssn
            FROM inserted
        )
        GROUP BY Mgr_ssn
        HAVING COUNT(*) > 1
    )
    BEGIN
        RAISERROR ('O funcionário já é gestor de outro departamento.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
```

### *d)* 

```
CREATE TRIGGER tr_check_salary
ON Company.Employee
AFTER INSERT, UPDATE
AS
BEGIN
    -- Verifica se há funcionários com salário superior ao gestor do seu departamento
    IF EXISTS (
        SELECT e.Ssn
        FROM Employee e
        INNER JOIN Department d ON e.Dno = d.Dnumber
        INNER JOIN Employee manager ON d.Mgr_ssn = manager.Ssn
        WHERE e.Ssn IN (
            SELECT Ssn
            FROM inserted
        ) AND e.Salary > (manager.Salary - 1)
    )
    BEGIN
        -- Atualiza o salário dos funcionários para o salário do gestor menos uma unidade
        UPDATE e
        SET e.Salary = manager.Salary - 1
        FROM Employee e
        INNER JOIN Department d ON e.Dno = d.Dnumber
        INNER JOIN Employee manager ON d.Mgr_ssn = manager.Ssn
        WHERE e.Ssn IN (
            SELECT Ssn
            FROM inserted
        ) AND e.Salary > (manager.Salary - 1);
    END;
END;

```

### *e)* 

```
CREATE FUNCTION employeeProjects
(
    @ssn VARCHAR(9)
)
RETURNS TABLE
AS
RETURN
(
    SELECT p.Pname, p.Plocation
    FROM Company.Project p
    INNER JOIN Company.Works_on w ON p.Pnumber = w.Pno
    INNER JOIN Company.Employee e ON w.Essn = e.Ssn
    WHERE e.Ssn = @ssn
);

GO
SELECT * FROM employeeProjects('183623612');
```

### *f)* 

```
CREATE FUNCTION udf_get_employees_above_avg_salary
(
    @dno INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT e.Fname, e.Minit, e.Lname, e.Ssn, e.Salary
    FROM Employee e
    INNER JOIN Department d ON e.Dno = d.Dnumber
    WHERE d.Dnumber = @dno
        AND e.Salary > (
            SELECT AVG(Salary)
            FROM Employee
            WHERE Dno = @dno
        )
);

```

### *g)* 

```
CREATE FUNCTION dbo.employeeDeptHighAverage (@Dno INT)
RETURNS @ProjectInfo TABLE
(
	Pname VARCHAR(30),
    Pnumber INT,
    Plocation VARCHAR(20),
	Dnum INT,
    Budget DECIMAL(10,2),
    TotalBudget DECIMAL(10,2)
)
AS
BEGIN
    DECLARE @Pname VARCHAR(30), @Pnumber INT, @Plocation VARCHAR(20), @Dnum INT, @Budget DECIMAL(10,2), @TotalBudget DECIMAL(10,2) = 0, @EmployeeSalary DECIMAL(10,2);

    DECLARE project_cursor CURSOR FOR 
    SELECT p.Pname, p.Pnumber, p.Plocation, p.Dnum, e.Salary
    FROM Company.Project p
    JOIN Company.Works_on w ON p.Pnumber = w.Pno
    JOIN Company.Employee e ON w.Essn = e.Ssn
    WHERE p.Dnum = @Dno;

    OPEN project_cursor;

    FETCH NEXT FROM project_cursor INTO @Pname, @Pnumber, @Plocation, @Dnum, @EmployeeSalary;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Budget = @EmployeeSalary / 40;
        SET @TotalBudget = @TotalBudget + @Budget;

        INSERT INTO @ProjectInfo (Pname, Pnumber, Plocation, Dnum, Budget, TotalBudget)
        VALUES (@Pname, @Pnumber, @Plocation, @Dnum, @Budget, @TotalBudget);

		FETCH NEXT FROM project_cursor INTO @Pname, @Pnumber, @Plocation, @Dnum, @EmployeeSalary;
    END;

    CLOSE project_cursor;
    DEALLOCATE project_cursor;

    RETURN;
END;

SELECT * FROM dbo.employeeDeptHighAverage(3);
```

### *h)* 

```
Trigger AFTER:

CREATE TRIGGER Company.DeleteDepartment ON Company.Department
AFTER DELETE
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Department_Deleted')
    BEGIN
        SELECT * INTO Department_Deleted FROM Company.Department WHERE 1=0;
    END

    INSERT INTO Department_Deleted
    SELECT * FROM deleted;
END
GO

Vatnagens: 
    A tabela department_deleted é criada apenas se necessário, economizando espaço em disco.
    O trigger é disparado após a exclusão do departamento, garantindo que a operação de exclusão seja concluída antes de inserir na tabela department_deleted.
Desvantagens:
    Pode haver um pequeno atraso entre a exclusão do departamento e a inserção na tabela department_deleted, pois a operação é realizada em duas etapas.

Trigger INSTANCE OF:

CREATE TRIGGER Company.DeleteDepartment ON Company.Department
AFTER DELETE
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Department_Deleted')
    BEGIN
        SELECT * INTO Department_Deleted FROM Company.Department WHERE 1=0;
    END

    INSERT INTO Department_Deleted
    SELECT * FROM deleted;

	DELETE FROM Company.Department WHERE Dnumber IN (SELECT Dnumber FROM deleted);
END
GO

Vatnagens: 
    O trigger é disparado antes da exclusão do departamento, permitindo que o registro seja primeiro inserido na tabela department_deleted e, em seguida, excluído da tabela department.
    Garante que o registro seja movido para a tabela department_deleted imediatamente, sem atrasos.
Desvantagens:
    A tabela department_deleted é criada a cada execução do trigger, mesmo que já exista, o que pode causar um pequeno desperdício de recursos do sistema.
```

### *i)* 

```
Stored Procedures

Vantagens: Modularidade, reutilização de código, controle de acessos e melhor desempenho

Situações de uso:
    Processamento complexo de dados: Quando há necessidade de executar várias etapas lógicas e manipular dados complexos.
    Segurança: Quando é necessário controlar o acesso aos dados e restringir as operações executadas pelos usuários.
    Reutilização de código: Quando há partes do código SQL que são usadas em vários lugares e devem ser centralizadas.

Uma situação comum é uma aplicação web que precisa inserir um novo pedido no banco de dados. A stored procedure pode ser usada para lidar com a validação do pedido, atualização de stock, cálculos de preços e geração de faturas.

User-Defined Functions (UDFs)

Vantagens: Reutilização de código, encapsulamento lógico e extensibilidade

Situações de uso:
    Transformação de dados: Quando é necessário realizar operações complexas em colunas de uma tabela antes de retornar o resultado.
    Cálculos específicos: Quando é necessário realizar cálculos personalizados ou funções matemáticas específicas.
    Manipulação de strings: Quando é necessário realizar manipulações complexas em strings, como formatação ou extração de partes específicas.

Obter o nome completo formatado de um funcionário, incluindo o título, o primeiro nome e o sobrenome. Uma UDF pode ser criada para combinar essas informações e retornar o nome completo formatado em uma consulta.
```
