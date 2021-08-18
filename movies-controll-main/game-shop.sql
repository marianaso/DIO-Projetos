CREATE DATABASE movies;

CREATE TABLE movies (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30) NOT NULL, type INT NOT NULL, total_ep INT, atual_ep INT, last_view DATE);
CREATE TABLE types (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, nome_type VARCHAR(30) NOT NULL);


INSERT INTO movies (name, type, total_ep, atual_ep, last_view) VALUES ('Avengers',1,NULL, NULL, '2020-12-20');
INSERT INTO movies (name, type, total_ep, atual_ep, last_view) VALUES ('Psycho',1,NULL, NULL, '2021-01-21');
INSERT INTO movies (name, type, total_ep, atual_ep, last_view) VALUES ('Star Wars',1,NULL, NULL, '2021-03-27');
INSERT INTO movies (name, type, total_ep, atual_ep, last_view) VALUES ('The Mandalorian',2,16, 16, '2020-12-18');
INSERT INTO movies (name, type, total_ep, atual_ep, last_view) VALUES ('Lupin',2,9, 3, '2021-04-11');
INSERT INTO movies (name, type, total_ep, atual_ep, last_view) VALUES ('What If',2,2, 2, current_timestamp());
INSERT INTO movies (name, type, last_view) VALUES ('Cruella',1, current_timestamp());

INSERT INTO types (nome_type) VALUE ('Movie');
INSERT INTO types (nome_type) VALUE ('Serie');

ALTER TABLE movies ADD CONSTRAINT type_id FOREIGN KEY types REFERENCES types.id ON DELETE CASCADE ON UPDATE CASCADE;

SELECT movies.name, types.nome_type, movies.total_ep, movies.atual_ep, movies.last_view
FROM movies JOIN types ON movies.type = types.id ORDER BY movies.name;