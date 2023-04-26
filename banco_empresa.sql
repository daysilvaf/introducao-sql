CREATE TABLE DEPT(
DEPTNO INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
localizacao VARCHAR(100)
);

INSERT INTO DEPT VALUES
(10, 'Tecnologia da Informação', 'New York'),
(20, 'Pesquisa', 'Alaska'),
(30, 'Vendas', 'New Jersey'),
(40, 'Operacional', 'Chicago');

CREATE TABLE EMP(
EMPNO INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
cargo VARCHAR(100),
gerente INT,
data_contratacao DATETIME,
salario NUMERIC(10,2),
comissao NUMERIC(10,2),
DEPTNO INT NULL,

CONSTRAINT FK_DEPT FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO),
CONSTRAINT FK_EMP FOREIGN KEY (gerente) REFERENCES EMP (EMPNO)

SET LANGUAGE english

INSERT INTO EMP VALUES
(7369, 'Noah', 'Analista de negócios', 7902, '17-DEC-15', 3500, NULL, 20),
(7499, 'Leona', 'Vendedora', 7698, '20-FEB-16', 5050, 300, 30),
(7521, 'Ethan', 'Vendedor', 7698, '22-FEB-15', 4250, 500, 30),
(7566, 'Amaya', 'Contadora', 7893, '2-APR-20', 7600, NULL, 20),
(7654, 'Kalil', 'Vendedor', 7698, '28-SEP-21', 4250, 400, 30),
(7698, 'Kaya', 'Web designer', 7893, '1-MAY-20', 7850, NULL, 10),
(7782, 'Kayn', 'Analista desenvolvedor', 7893, '9-JUN-19', 9450, NULL, 10),
(7788, 'Zoe', 'Analista de negócios', 7566, '09-DEC-19', 5000, NULL, 10),
(7839, 'Kendrick', 'Presidente', NULL, '17-JAN-17', 25000, NULL, 10),
(7844, 'Lyra', 'Vendedora', 7698, '8-SEP-20', 4500, 0, 30),
(7876, 'Otelo', 'Balconista', 7788, '12-JAN-22', 1000, NULL, 20),
(7900, 'Maite', 'Balconista', '7633', '3-DEC-11', 1950, NULL, 30),
(7902, 'Sky', 'Web designer', 7566, '3-DEC-10', 4800, NULL, 10),
(7934, 'Greta', 'Balconista', 7782, '23-JAN-12', 2300, NULL, NULL)

CREATE TABLE salgrade
grau INT AUTO_INCREMENT NOT NULL,
salario_minimo NUMERIC(10,2),
salario_maximo NUMERIC(10,2)

INSERT INTO salgrade VALUES
(1,0,2000),
(2, 2000, 4000),
(3, 4000, 6000),
(4, 6000, 9000),
(5, 9000, 99999)

CREATE TABLE parametro(
valor_desconto NUMERIC(10,2);

INSERT INTO parametro VALUES (0.20)

-- Exibir o nome do empregado, nome do departamento, onde trabalha e salário.
-- Somente empregados que possuem salário acima de R$ 1.000,00.

SELECT EMP.nome AS "Nome",
DEPT.nome AS "Departamento",
EMP.salario AS "Salário"

FROM EMP
LEFT OUTER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE EMP.salario > '1000'

-- Exibir o nome do empregado, departamento e local onde trabalha.
-- Exibir todos os departamento, mesmo os que não possuem empregados.

SELECT EMP.nome AS "Nome",
DEPT.nome +' - '+DEPT.localizacao AS "Departamento e Local"
FROM EMP
LEFT OUTER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO

-- Exibir o nome do empregado, salário e nível de acordo com seu salário (Tabela: SALGRADE).

SELECT EMP.nome AS "Funcionário",
EMP.salario AS "Salário"
salgrade.grau AS "Grau - Salário"
FROM EMP
INNER JOIN salgrade
ON (EMP.salario >= salgrade.salario_minimo) AND (EMP.salario <= salgrade.salario_maximo)

-- Exibir o nome do empregado, salário, bem como o nome e salário do seu gerente.
-- Exibir todos os empregados, mesmo os que não possuem gerente.

SELECT CONVERT (VARCHAR, E.EMPNO) + ' - ' + E.nome AS "Funcionário",
E.salario AS "Salário",
CONVERT (VARCHAR, G.EMPNO) + ' - ' G.nome AS "Gerente",
G.salario AS "Salário"
FROM EMP E
JOIN EMP G ON E.gerente = G.EMPNO