/*Analises tabelas videos*/

CREATE TABLE videos (id_videos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,fk_author INT, title VARCHAR(30), likes INT, dislikes INT);

INSERT INTO videos ( fk_author, title, likes, dislikes) VALUES (2, 'MySQL', 10, 2);
INSERT INTO videos ( fk_author, title, likes, dislikes) VALUES (1, 'HTML 5', 30, 1);
INSERT INTO videos ( fk_author, title, likes, dislikes) VALUES (3, 'CSS', 18, 3);
INSERT INTO videos ( fk_author, title, likes, dislikes) VALUES (2, 'JavaScript', 15, 8);
INSERT INTO videos ( fk_author, title, likes, dislikes) VALUES (1, 'Python', 50, 0);
INSERT INTO videos ( fk_author, title, likes, dislikes) VALUES (1, 'PHP', 18, 3);

CREATE TABLE author (id_author INT NOT NULL PRIMARY KEY AUTO_INCREMENT,name_author VARCHAR(30), born DATE);

INSERT INTO author (name_author, born) VALUES ('Mariana', '1991-01-21');
INSERT INTO author (name_author, born) VALUES ('Maria', '1993-03-19');
INSERT INTO author (name_author, born) VALUES ('João', '1997-04-11');
INSERT INTO author (name_author, born) VALUES ('Flavia', '1999-11-05');

CREATE TABLE seo (id_seo INT NOT NULL PRIMARY KEY AUTO_INCREMENT, category VARCHAR(30));

INSERT INTO seo (category) VALUES ('BackEnd'); --1
INSERT INTO seo (category) VALUES ('FrontEnd'); --2

/* Analises pré criação da playlist */

ALTER TABLE videos ADD fk_category = INT;
UPDATE videos SET fk_category = 1 WHERE id_videos=1;
UPDATE videos SET fk_category = 1 WHERE id_videos=5;
UPDATE videos SET fk_category = 1 WHERE id_videos=6;
UPDATE videos SET fk_category = 2 WHERE id_videos=2;
UPDATE videos SET fk_category = 2 WHERE id_videos=3;
UPDATE videos SET fk_category = 2 WHERE id_videos=4;

/*Juntando as tabelas videos e autor*/
ALTER TABLE videos ADD CONSTRAINT fk_author FOREIGN KEY fk_author REFERENCES author.id_author ON DELETE CASCADE ON UPDATE CASCADE;
SELECT * FROM videos JOIN author ON videos.fk_author=author.id_author;
SELECT videos.title, author.name_author FROM videos JOIN author ON videos.fk_author=author.id_author;

/*Juntando as tabelas videos e categoria*/
ALTER TABLE seo ADD CONSTRAINT fk_category FOREIGN KEY fk_category REFERENCES seo.id_seo ON DELETE CASCADE ON UPDATE CASCADE;
SELECT * FROM videos JOIN seo ON videos.fk_category=seo.id_seo;
SELECT videos.title, seo.category FROM videos JOIN seo ON videos.fk_category=seo.id_seo;

SELECT videos.title, seo.category, author.name_author FROM videos 
JOIN seo ON videos.fk_category=seo.id_seo
JOIN author ON videos.fk_author = author.id_author;

/*Criação Tabela Playlist*/

CREATE TABLE playlist (id_playlist INT NOT NULL PRIMARY KEY AUTO_INCREMENT,fk_author INT, name_playlist VARCHAR(30));

INSERT INTO playlist (fk_author, name_playlist) VALUES (4, 'HTML + CSS');
INSERT INTO playlist (fk_author, name_playlist) VALUES (3, 'HTML + PHP + JS');
INSERT INTO playlist (fk_author, name_playlist) VALUES (4, 'Python + MySQL');

CREATE TABLE videos_playlist (id_vp INT NOT NULL PRIMARY KEY AUTO_INCREMENT,fk_videos INT, fk_playlist INT);

INSERT INTO videos_playlist (fk_videos, fk_playlist) VALUES (2,1); --HTML + CSS
INSERT INTO videos_playlist (fk_videos, fk_playlist) VALUES (3,1); --HTML + CSS
INSERT INTO videos_playlist (fk_videos, fk_playlist) VALUES (2,2); --HTML + PHP + JS
INSERT INTO videos_playlist (fk_videos, fk_playlist) VALUES (4,2); --HTML + PHP + JS
INSERT INTO videos_playlist (fk_videos, fk_playlist) VALUES (6,2); --HTML + PHP + JS
INSERT INTO videos_playlist (fk_videos, fk_playlist) VALUES (1,3); --Python + MySQL
INSERT INTO videos_playlist (fk_videos, fk_playlist) VALUES (5,3); --Python + MySQL

/*Analise Tabela Playlist*/

--Retorna a tabela playlist com a tabela videos_playlist (todos os dados)
SELECT * FROM playlist JOIN videos_playlist ON playlist.id_playlist=videos_playlist.fk_playlist
JOIN videos ON videos.id_video=videos_playlist.fk_videos;
--Retorna a tabela playlist com a tabela videos_playlist (apenas o nome da playlist e o nome do video)
SELECT playlist.name_playlist, videos.title FROM playlist JOIN videos_playlist ON playlist.id_playlist=videos_playlist.fk_playlist
JOIN videos ON videos.id_video=videos_playlist.fk_videos;

--Retorna a tabela playlist com a tabela videos_playlist (nome da playlist, nome do video, autor do video)
SELECT playlist.name_playlist, videos.title, author.nome_author FROM playlist
JOIN videos_playlist ON playlist.id_playlist=videos_playlist.fk_playlist
JOIN videos ON videos.id_video=videos_playlist.fk_videos
JOIN author ON videos.fk_author=author.id_author;

--Retorna a tabela playlist com a tabela videos_playlist (nome da playlist, nome do video, autor da playlist)
SELECT playlist.name_playlist, videos.title, author.nome_author FROM playlist
JOIN videos_playlist ON playlist.id_playlist=videos_playlist.fk_playlist
JOIN videos ON videos.id_video=videos_playlist.fk_videos
JOIN author ON playlist.fk_author=author.id_author;

--Retorna a tabela playlist com a tabela videos_playlist (nome da playlist, nome do video, autor do video, autor da playlist)
SELECT playlist.name_playlist, videos.title, author.nome_author, a2.nome_author FROM playlist
JOIN videos_playlist ON playlist.id_playlist=videos_playlist.fk_playlist
JOIN videos ON videos.id_video=videos_playlist.fk_videos 
JOIN author ON videos.fk_author = author.id_author
JOIN author a2 ON playlist.fk_author=a2.id_author;
