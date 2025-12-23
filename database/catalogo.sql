DROP DATABASE IF EXISTS catalogo;
CREATE DATABASE catalogo;
USE catalogo;

CREATE TABLE streamings (
id_streaming INT PRIMARY KEY AUTO_INCREMENT,
nome_plataforma VARCHAR(50) NOT NULL
);

CREATE TABLE generos (
id_genero INT PRIMARY KEY AUTO_INCREMENT,
nome_genero VARCHAR(50) NOT NULL
);

CREATE TABLE filmes (
id_filme INT PRIMARY KEY AUTO_INCREMENT,
nome_filme VARCHAR(60) NOT NULL,
descricao TEXT,
url_capa TEXT,
fk_streaming INT,
FOREIGN KEY (fk_streaming) REFERENCES streamings(id_streaming)
);

CREATE TABLE filmes_generos (
fk_filme INT,
fk_genero INT,
PRIMARY KEY (fk_filme, fk_genero),
FOREIGN KEY (fk_filme) REFERENCES filmes(id_filme),
FOREIGN KEY (fk_genero) REFERENCES generos(id_genero)
);

INSERT INTO streamings (nome_plataforma) VALUES 
('Disney+'),
('Netflix'),
('Amazon Prime'),
('HBO Max');

INSERT INTO generos (nome_genero) VALUES 
('Animação'),
('Aventura'),
('Comédia'),
('Drama'),
('Fantasia'),
('Ficção Científica'),
('Musical'),
('Policial'),
('Romance'),
('Ação');


INSERT INTO filmes (nome_filme, fk_streaming, descricao, url_capa) VALUES
('O Rei Leão', 1, 'Simba, um jovem leão cujo destino é se tornar o rei da selva.', 'https://m.media-amazon.com/images/M/MV5BNzJmNDVmNTAtODI3Mi00Y2Y2LTg4MDItNGI0ODE4NTQ1ZmNlXkEyXkFqcGc@._V1_.jpg'),
('Frozen', 1, 'A destemida princesa Anna parte em uma jornada para encontrar sua irmã Elsa.', 'https://m.media-amazon.com/images/M/MV5BYzEwYTZhNDMtMzBkOC00NDA0LTkwMWQtZjU2YmZhYjIwYmIzXkEyXkFqcGc@._V1_FMjpg_UX1259_.jpg'),
('Moana', 1, 'Uma jovem corajosa navega pelo oceano para salvar seu povo.', 'https://m.media-amazon.com/images/M/MV5BOTI3YWEzN2EtYjk5OS00NmJjLThkOWQtYzBjZmRiZjg4MDA0XkEyXkFqcGc@._V1_FMjpg_UX736_.jpg'),
('Toy Story', 1, 'A vida do cowboy Woody muda quando um novo brinquedo chega.', 'https://m.media-amazon.com/images/M/MV5BODdhYzcxYmYtOTAzZS00YTRkLTgzODYtNGUzN2Y2ZjNlZTBmXkEyXkFqcGc@._V1_FMjpg_UY1579_.jpg'),
('Vingadores: Ultimato', 1, 'Os heróis restantes devem se unir para desfazer as ações de Thanos.', 'https://m.media-amazon.com/images/M/MV5BMWYzMzk2MTktYjMzYS00MjVmLWE1ZDgtMzczMDc1NjZhODUwXkEyXkFqcGc@._V1_FMjpg_UX681_.jpg'),
('Star Wars: Uma Nova Esperança', 1, 'Luke Skywalker se junta a um cavaleiro Jedi para salvar a galáxia.', 'https://m.media-amazon.com/images/M/MV5BOWE0MDA0YjgtOGVhMi00NjY0LTkxNGQtYjVjMWU3ZTU5Mjc1XkEyXkFqcGc@._V1_FMjpg_UX765_.jpg'),
('Encanto', 1, 'A família Madrigal vive em uma casa mágica na Colômbia.', 'https://m.media-amazon.com/images/M/MV5BNGEyNzk2M2MtNjBhZS00MzYwLWI0Y2YtYjc5ZWE2MjM0YWE5XkEyXkFqcGc@._V1_FMjpg_UX1012_.jpg'),
('Zootopia', 1, 'Uma coelha policial e uma raposa malandra precisam trabalhar juntas.', 'https://m.media-amazon.com/images/M/MV5BZGIyM2NlYTMtNTkxYi00NmZlLTgwOGYtYTQxODE1YmFkOGQyXkEyXkFqcGc@._V1_FMjpg_UX770_.jpg'),
('Viva: A Vida é uma Festa', 1, 'Miguel sonha em ser músico e entra na Terra dos Mortos.', 'https://m.media-amazon.com/images/M/MV5BMjkyZDZjNzMtMmY0NS00NWMxLThjNWQtNjBlMjI2N2UwZGFiXkEyXkFqcGc@._V1_FMjpg_UX500_.jpg'),
('Divertida Mente', 1, 'As emoções de Riley tentam guiá-la através de uma mudança difícil.', 'https://m.media-amazon.com/images/M/MV5BODFkOTNhZTctYzVhNy00ZDYzLWFjNzMtNWRkZTFhZmRjMTc0XkEyXkFqcGc@._V1_FMjpg_UX1080_.jpg'),
('Soul', 1, 'Um professor de música viaja para outra dimensão para encontrar sua paixão.', 'https://m.media-amazon.com/images/M/MV5BZTZkYjA5MDEtMjY1ZC00ODk5LThjOTUtZDYxODEzYWNjMTU2XkEyXkFqcGc@._V1_FMjpg_UY2222_.jpg'),
('Luca', 1, 'Em um verão na Itália, dois amigos escondem que são monstros marinhos.', 'https://m.media-amazon.com/images/M/MV5BNjljNWYxYTUtNzQwOS00Y2ZiLWIyOGUtNjkzNDY2ZWI0NTg5XkEyXkFqcGc@._V1_FMjpg_UX917_.jpg'),
('Mulan', 1, 'Uma jovem se disfarça de homem para lutar no lugar de seu pai.', 'https://m.media-amazon.com/images/M/MV5BNjcyOGRmMGItODFmMC00NjlhLWE5ZDYtMzBlMjIxZTc3ODQ1XkEyXkFqcGc@._V1_FMjpg_UY2970_.jpg'),
('A Pequena Sereia', 1, 'Ariel deseja conhecer o mundo humano e faz um acordo perigoso por amor.', 'https://m.media-amazon.com/images/M/MV5BODg2NDY4MzItNGY5Yi00MDNmLTk3YjMtN2RkNGI1NTZkOTM3XkEyXkFqcGc@._V1_FMjpg_UY6606_.jpg'),
('Wall-E', 1, 'Um pequeno robô compactador de lixo descobre o amor no futuro.', 'https://m.media-amazon.com/images/M/MV5BMTc5ZDkzNWQtMDg2OS00MDc0LTg4OTgtMDMxZDYzYzlkOWJjXkEyXkFqcGc@._V1_FMjpg_UX701_.jpg');


INSERT INTO filmes (nome_filme, fk_streaming, descricao, url_capa) VALUES
('Alerta Vermelho', 2, 'Um agente do FBI persegue o ladrão de arte mais procurado do mundo.', 'https://m.media-amazon.com/images/M/MV5BZGNmN2M1MjYtMzg2Ni00ZDgzLWI3YjEtZGNhZWZhMTU1ZWM2XkEyXkFqcGc@._V1_FMjpg_UY2222_.jpg'),
('O Irlandês', 2, 'Um assassino de aluguel recorda seu envolvimento com a máfia.', 'https://m.media-amazon.com/images/M/MV5BZTQxYTE1NzItMjRjMC00MWYzLWI1Y2QtNjYyNjk0ODI2MTBmXkEyXkFqcGc@._V1_FMjpg_UY2048_.jpg'),
('Mistério no Mediterrâneo', 2, 'Um policial e sua esposa são incriminados em um assassinato durante as férias.', 'https://m.media-amazon.com/images/M/MV5BODUxY2I1OWItMDZkOC00OGQ5LThiOTktNTBhODI3OTFmMDQ2XkEyXkFqcGc@._V1_FMjpg_UX426_.jpg'),
('Bird Box', 2, 'Uma força misteriosa dizima a população; se você a vir, você morre.', 'https://m.media-amazon.com/images/M/MV5BMjAzMTI1MjMyN15BMl5BanBnXkFtZTgwNzU5MTE2NjM@._V1_FMjpg_UY2048_.jpg'),
('Enola Holmes', 2, 'A irmã adolescente de Sherlock Holmes usa suas habilidades de detetive para encontrar sua mãe.', 'https://m.media-amazon.com/images/M/MV5BYzE5ODhhODctODk2MS00MTg3LTk2OTYtZmNlYTNjMjY4MjczXkEyXkFqcGc@._V1_FMjpg_UY2222_.jpg');


INSERT INTO filmes (nome_filme, fk_streaming, descricao, url_capa) VALUES
('A Guerra do Amanhã', 3, 'Viajantes do tempo chegam para recrutar soldados para uma guerra futura.', 'https://m.media-amazon.com/images/M/MV5BMzA3ZDMwYTMtNTI3Yi00NDJjLWFhZjUtYTRiZTg3NzA5YjlhXkEyXkFqcGc@._V1_FMjpg_UY2560_.jpg'),
('Air: A História Por Trás do Logo', 3, 'A parceria revolucionária entre Michael Jordan e a divisão de basquete da Nike.', 'https://m.media-amazon.com/images/M/MV5BZjkxMzFjMTUtYzA1Ni00OWExLWJlOTItMWI0MGEwYjZmOGI3XkEyXkFqcGc@._V1_FMjpg_UY3767_.jpg'),
('Matador de Aluguel', 3, 'Um ex-lutador do UFC aceita um emprego como segurança em uma estalagem na Flórida.', 'https://m.media-amazon.com/images/M/MV5BOGYxMjFhZTMtZWU4MS00MDY1LWJiNzQtMWRjYTk1NDkxY2UwXkEyXkFqcGc@._V1_FMjpg_UY3480_.jpg'),
('Vermelho, Branco e Sangue Azul', 3, 'O filho da presidente dos EUA e o príncipe britânico precisam fingir uma amizade que vira romance.', 'https://m.media-amazon.com/images/M/MV5BNjMwNThiNGMtODA5YS00NmE0LWJmMjgtM2Q4NDZjMWFiOTVlXkEyXkFqcGc@._V1_FMjpg_UY3000_.jpg'),
('Sem Remorso', 3, 'Um oficial de elite busca vingança pelo assassinato de sua esposa grávida.', 'https://m.media-amazon.com/images/M/MV5BOTM3ZDZiYTgtYmMwOS00NjIyLWFmZjMtN2I3MzE2ZDFiYmYxXkEyXkFqcGc@._V1_FMjpg_UY12150_.jpg');


INSERT INTO filmes (nome_filme, fk_streaming, descricao, url_capa) VALUES
('Duna', 4, 'Paul Atreides deve viajar para o planeta mais perigoso do universo para garantir o futuro de seu povo.', 'https://m.media-amazon.com/images/M/MV5BM2I1ZDY2N2ItY2EwMC00MGQ3LWIwMzgtNTE0ZTMzN2Q2Yzc4XkEyXkFqcGc@._V1_FMjpg_UY4096_.jpg'),
('Batman', 4, 'O vigilante de Gotham descobre corrupção conectada à sua própria família enquanto persegue o Charada.', 'https://m.media-amazon.com/images/M/MV5BMmU5NGJlMzAtMGNmOC00YjJjLTgyMzUtNjAyYmE4Njg5YWMyXkEyXkFqcGc@._V1_FMjpg_UY4096_.jpg'),
('Coringa', 4, 'Um comediante falido enlouquece e se torna um criminoso psicopata.', 'https://m.media-amazon.com/images/M/MV5BNzM3ODNlNTAtYTYxNy00NjZhLTg3MGMtYTIwOWYxNzAwMzQ1XkEyXkFqcGc@._V1_FMjpg_UX648_.jpg'),
('Barbie', 4, 'Barbie sofre uma crise que a leva a questionar seu mundo e sua existência.', 'https://m.media-amazon.com/images/M/MV5BZjA4NmQwNmItMGMwNy00NjgxLThlMDQtYzQ5ODRhOGI3MTFhXkEyXkFqcGc@._V1_FMjpg_UY4096_.jpg'),
('Interestelar', 4, 'Exploradores viajam através de um buraco de minhoca no espaço para garantir a sobrevivência da humanidade.', 'https://m.media-amazon.com/images/M/MV5BMmUwMmFlMzktYWVlNy00N2I0LWFhMTYtZWI2ZTM4N2I3ZTk0XkEyXkFqcGc@._V1_FMjpg_UY3459_.jpg');


INSERT INTO filmes_generos (fk_filme, fk_genero) VALUES
(1, 1), (1, 2), (1, 4),
(2, 1), (2, 2), (2, 5),
(3, 1), (3, 2), (3, 7),
(4, 1), (4, 2), (4, 3),
(5, 10), (5, 6), (5, 2),
(6, 6), (6, 10), (6, 2),
(7, 1), (7, 7), (7, 5),
(8, 1), (8, 8), (8, 3),
(9, 1), (9, 5), (9, 7),
(10, 1), (10, 3), (10, 4),
(11, 1), (11, 5), (11, 4),
(12, 1), (12, 2), (12, 3),
(13, 1), (13, 2), (13, 10),
(14, 1), (14, 9), (14, 5),
(15, 1), (15, 6), (15, 9),
(16, 10), (16, 3), (16, 8),
(17, 4), (17, 8),
(18, 3), (18, 8), (18, 9),
(19, 6), (19, 4),
(20, 2), (20, 8), (20, 4),
(21, 6), (21, 10),
(22, 4),
(23, 10), (23, 8),
(24, 9), (24, 3),
(25, 10), (25, 8),
(26, 6), (26, 2), (26, 4),
(27, 10), (27, 8), (27, 4),
(28, 4), (28, 8),
(29, 3), (29, 5), (29, 2),
(30, 6), (30, 4), (30, 2);