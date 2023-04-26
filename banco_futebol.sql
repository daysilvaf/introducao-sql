CREATE TABLE posicao(
ID_Posicao INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(20) NOT NULL
);

INSERT INTO posicao (ID_Posicao, nome)
VALUES(1, 'Centroavante'), (2, 'Atacante'), (3, 'Ponta-esquerda'), (4, 'Zagueiro'), (5, 'Lateral-direito'), (6, 'Meia-atacante');

CREATE TABLE time(
ID_Time INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
estado CHAR(2)
);

INSERT INTO time (ID_Time, nome, estado)
VALUES (1, 'Corinthians', 'SP'), (2, 'Palmeiras', 'SP'), (3, 'Flamengo', 'RJ');

CREATE TABLE jogador(
ID_Jogador INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
salario NUMERIC(10,2),
data_nascimento DATETIME,
ID_Posicao INT NOT NULL,
ID_Time INT NOT NULL,
);

FOREIGN KEY (ID_Posicao) REFERENCES posicao (ID_Posicao),
FOREIGN KEY (ID_time) REFERENCES time (ID_Time)

INSERT INTO jogador(ID_Jogador, nome, salario, data_nascimento, ID_Posicao, ID_Time)
VALUES (1, 'Yuri Alberto', 1900000, '18/03/01', 1, 1),
(2, 'Gabriel Barbosa', 1600000, '30/08/03', 2, 3),
(3, 'Roger Guedes', 1000000, '02/10/02', 3, 1),
(4, 'Gabriel Menino', 200000, '29/09/00', 5, 2),
(5, 'Rodrigo Caio', 650000, '17/08/01', 4, 3),
(6, 'Raphael Cavalcante Veiga', 1000000, '19/06/00', 6, 2);

-- Exibir o nome do jogador, salário e nome do time em que joga. Nomear as colunas como "jogador", "salário" e "time", respectivamente. 
-- Ordenar o resultado pelo nome do time e em seguida pelo salário em ordem decrescente.

SELECT jogador.nome AS "Jogador", 
jogador.salario AS "Salario", 
time.nome AS "Time"

FROM jogador
INNER JOIN time
ON jogador.ID_Time = time.ID_Time
ORDER BY jogador.nome

SELECT jogador.nome AS "Jogador", 
jogador.salario AS "Salario", 
time.nome AS "Time"

FROM jogador
INNER JOIN time
ON jogador.ID_Time = time.ID_Time
ORDER BY salario DESC

-- Exibir o nome do jogador, data de nascimeno e o nome da posição em que joga.
-- Nomear as colunas como "jogador", "data de nascimento" e "posição", respectivamente.
-- Ordenar o resultado pelo nome da posição e em seguida pela data de nascimento em ordem crescente.

SELECT jogador.nome AS "Nome",
jogador.data_nascimento AS "Data de nascimento",
posicao.nome AS "Posiçao"

FROM jogador
INNER JOIN posicao
ON jogador.ID_Posicao = posicao.ID_Posicao
ORDER BY posicao.nome

SELECT jogador.nome AS "Nome",
jogador.data_nascimento AS "Data de nascimento", 
posicao.nome AS "Posiçao"

FROM jogador
INNER JOIN posicao
ON jogador.ID_Posicao = posicao.ID_Posicao
ORDER BY jogador.data_nascimento

-- Exibir o nome do jogador, salário, nome do time em que joga e nome da posição em que joga.
-- Nomear as colunas como "jogador", "salário", "time" e "posição", respectivamente.
-- Ordenar o resultado pelo nome do time, e em seguida pelo salário, em ordem crescente.

SELECT jogador.nome AS "Jogador", 
jogador.salario AS "Salário",
time.nome AS "Time",
posicao.nome AS "Posicao"

FROM jogador
INNER JOIN time
ON jogador.ID_Time = time.ID_Time
INNER JOIN posicao
ON jogador.ID_Posicao = posicao.ID_Posicao
ORDER BY time.nome

SELECT jogador.nome AS "Jogador",
jogador.salario AS "Salario",
time.nome AS "Time",
posicao.nome AS "Posicao"

FROM jogador
INNER JOIN time
ON jogador.ID_Time = time.ID_Time
INNER JOIN posicao
ON jogador.ID_Posicao = posicao.ID_Posicao
ORDER BY jogador.salario

-- Exibir o nome do jogador e o nome do time em que joga.
-- Exibir todos os jogadores, mesmo os que não possuírem time.
-- Nomear as colunas como "jogador" e "time", respectivamente.

SELECT jogador.nome AS "Jogador",
time.nome AS "Time"
FROM jogador
LEFT OUTER JOIN time ON time.ID_Time = jogador.ID_Time

-- Exibir o nome do time e o nome do jogador pertencente a ele.
-- Exibir todos os times, mesmo os que não possuírem jogador.
-- Nomear as colunas como "time" e "jogador", respectivamente.

SELECT time.nome AS "Time",
jogador.nome as "Jogador"
FROM time
LEFT OUTER JOIN jogador ON time.ID_Time = jogador.ID_Time