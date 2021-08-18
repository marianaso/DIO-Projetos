CREATE DATABASE game-shop;

CREATE TABLE games (id INT NOT NULL PRIMARY KEY AUTOINCREMENT, nome_game VARCHAR(30), preco DOUBLE, fk_idcategora INT);
CREATE TABLE categorias (id_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT, nome VARCHAR(20));
CREATE TABLE clientes (id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT, nome_cliente VARCHAR(30));
CREATE TABLE pedidos (id_pedido INT PRIMARY KEY AUTO_INCREMENT, fk_idcliente INT, fk_idgames INT, quantidade INT);

INSERT INTO categorias (nome) VALUES ('Ação');
INSERT INTO categorias (nome) VALUES ('Aventura');
INSERT INTO categorias (nome) VALUES ('Esportes');

INSERT INTO games (nome_game, preco, fk_idcategora) VALUES ('COD',300,1);
INSERT INTO games (nome_game, preco, fk_idcategora) VALUES ('NBA 2K',200,3);
INSERT INTO games (nome_game, preco, fk_idcategora) VALUES ('Among US',100,2);
INSERT INTO games (nome_game, preco, fk_idcategora) VALUES ('Diablo',500,1);
INSERT INTO games (nome_game, preco, fk_idcategora) VALUES ('Fifa',350,3);
INSERT INTO games (nome_game, preco, fk_idcategora) VALUES ('F1 2020',100,3);

INSERT INTO clientes (nome_cliente) VALUES ('Mariana');
INSERT INTO clientes (nome_cliente) VALUES ('Augusto');
INSERT INTO clientes (nome_cliente) VALUES ('João');
INSERT INTO clientes (nome_cliente) VALUES ('Julia');
INSERT INTO clientes (nome_cliente) VALUES ('Jephesson');

INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (1, 3, 2);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (2, 5, 1);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (3, 5, 2);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (1, 1, 2);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (1, 2, 3);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (3, 3, 1);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (4, 4, 1);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (4, 5, 1);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (1, 6, 2);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (5, 3, 2);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (5, 4, 1);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (3, 4, 3);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (5, 6, 2);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (2, 6, 1);
INSERT INTO pedidos (fk_idcliente, fk_idgames, quantidade) VALUES (2, 1, 4);

/* SELECT * FROM games JOIN categorias ON games.fk_idcategora = categorias.id_categoria;
SELECT games.nome_game, games.preco, categorias.nome FROM games JOIN categorias ON games.fk_idcategora = categorias.id_categoria;
 */
 
ALTER TABLE pedidos ADD CONSTRAINT fk_idcliente FOREIGN KEY fk_idcliente REFERENCES clientes.id_cliente ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pedidos ADD CONSTRAINT fk_idgames FOREIGN KEY fk_idgames REFERENCES games.id ON DELETE CASCADE ON UPDATE CASCADE;

/* SELECT * FROM pedidos JOIN clientes ON pedidos.fk_idcliente = clientes.id_cliente
JOIN games ON pedidos.fk_idgames = games.id
JOIN categorias ON games.fk_idcategora = categorias.id_categoria; */

SELECT clientes.nome_cliente, pedidos.quantidade, games.nome_game, games.preco, categorias.nome
FROM pedidos JOIN clientes ON pedidos.fk_idcliente = clientes.id_cliente
JOIN games ON pedidos.fk_idgames = games.id
JOIN categorias ON games.fk_idcategora = categorias.id_categoria ORDER BY games.nome_game;