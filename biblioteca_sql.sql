CREATE DATABASE IF NOT EXISTS biblioteca_gi;
USE biblioteca_gi;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE Livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    isbn VARCHAR(13) UNIQUE,
    descricao TEXT,
    quantidade_paginas INT
);

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150),
    email VARCHAR(50) UNIQUE,
    data_cadastro DATE,
    nivel_associacao VARCHAR(50)
);

CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150),
    data_nascimento DATE,
    biografia TEXT
);

CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150)
);

CREATE TABLE Emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT,
    data_emprestimo DATE,
    data_limite_devolucao DATE,
    data_devolucao_real DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);

-- Tabela associativa do Autor e do Livro
CREATE TABLE Autor_Livro (
    id_autor_livro INT AUTO_INCREMENT PRIMARY KEY,
    id_autor INT,
    id_livro INT,
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor),
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);

-- Tabela associativa da Categoria e do Livro
CREATE TABLE Categoria_Livro (
    id_categoria_livro INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    id_livro INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);


-- Inserindo dados na tabela Livro
INSERT INTO Livro (titulo, descricao, quantidade_paginas, isbn) VALUES
('É Assim Que Acaba', 'A história de Lily Bloom, que supera uma infância traumática e se apaixona pelo neurocirurgião Ryle, mas o relacionamento se torna abusivo, forçando-a a quebrar o ciclo de violência com a ajuda de seu primeiro amor, Atlas.', 368, '9788501112514'),
('A Biblioteca da Meia-Noite', 'Entre a vida e a morte, Nora Seed se encontra em uma biblioteca onde pode experimentar as vidas que teria vivido se tivesse feito escolhas diferentes, em uma jornada para descobrir o que realmente importa.', 304, '9786558380342'),
('Renegados', 'Em um mundo de heróis e vilões, Nova Artino, uma Anarquista, se infiltra entre os Renegados em uma missão de vingança, mas começa a questionar suas lealdades ao se aproximar de um jovem herói.', 480, '9788579803913'),
('After', 'A jovem Tessa Young começa a faculdade e sua vida muda completamente quando conhece o rebelde e misterioso Hardin Scott, com quem inicia um relacionamento intenso e turbulento.', 528, '9788584390001'),
('Vermelho, Branco e Sangue Azul', 'O primeiro-filho dos EUA, Alex, e o príncipe britânico Henry iniciam uma rivalidade que evolui para um romance secreto que pode mudar o cenário político mundial.', 392, '9788555340942'),
('Alexander e o Dia Terrível, Horrível, Espantoso e Horroroso', 'A história de Alexander, um garoto que tem um dia em que absolutamente tudo dá errado, desde acordar com chiclete no cabelo até ter que comer vagem no jantar.', 32, '9788574065609'),
('O Pequeno Príncipe', 'Um piloto de avião encontra um jovem príncipe de outro planeta no deserto do Saara, em uma fábula poética sobre amizade, amor, perda e a essência da vida.', 96, '9788595081512'),
('Harry Potter e o Enigma do Príncipe', 'No sexto ano em Hogwarts, Harry Potter descobre um antigo livro de poções pertencente ao "Príncipe Mestiço" enquanto aprende mais sobre o passado sombrio de Lord Voldemort.', 432, '9788532522928'),
('Como Enfrentar o Ódio', 'Felipe Neto compartilha suas experiências e estratégias para combater o discurso de ódio e as fake news na era digital, defendendo a importância do posicionamento e do debate.', 160, '9786555209373'),
('Heartstopper: Dois Garotos, Um Encontro', 'Charlie, um garoto abertamente gay, e Nick, um popular jogador de rúgbi, se tornam amigos, e essa amizade rapidamente floresce para um romance inesperado.', 288, '9788550817928'),
('Coisas Óbvias Sobre o Amor', 'Uma comédia romântica sobre uma jovem que, após uma desilusão amorosa, decide seguir uma lista de regras para não se apaixonar, mas seus planos são desafiados por um novo interesse amoroso.', 350, '9788592857418');

-- Inserindo dados na tabela Usuario
INSERT INTO Usuario (nome, email, data_cadastro, nivel_associacao) VALUES
('Giovanna Marques', 'giovannamarquesz.lima@gmail.com', '2025-02-08', 'Premium'),
('André Previto', 'andre.previto@gmail.com', '2024-06-01', 'Normal'),
('João Souza', 'joaosouza@gmail.com', '2024-09-12', 'Normal'),
('Melissa Janes Lovato', 'melovato@gmail.com', '2020-02-26', 'Premium'),
('Carol Lovato', 'carolovato@gmail.com', '2025-06-01', 'Premium'),
('Giovanna Marques Lovato', 'lovato.giovanna@gmail.com', '2020-12-10', 'Premium'),
('Juliano Abreu', 'jucaabreu@gmail.com', '2021-06-22', 'Normal'),
('Tarcilia Marques', 'tarcilia.marques@gmail.com', '2025-09-20', 'Normal'),
('Eloah Borin', 'eloahborinn@gmail.com', '2024-09-21', 'Premium'),
('Leonardo Diaz', 'leodiazz@gmail.com', '2023-04-22', 'Normal');

-- Inserindo dados na tabela Autor
INSERT INTO Autor (nome, data_nascimento, biografia) VALUES
('Colleen Hoover', '1979-12-11', 'Autora norte-americana best-seller, conhecida por seus romances e ficções para jovens adultos. Seus livros frequentemente abordam temas complexos como abuso, luto e amor, e ganhou notoriedade global com obras como "É Assim que Acaba".'),
('Matt Haig', '1975-07-03', 'Escritor e jornalista britânico, autor de ficção e não-ficção para crianças e adultos. Suas obras, como "A Biblioteca da Meia-Noite", exploram temas como saúde mental, humanidade e esperança, recebendo aclamação da crítica.'),
('Marissa Meyer', '1984-02-19', 'Escritora norte-americana famosa por suas séries de fantasia e ficção científica para jovens adultos. É mais conhecida pela série "As Crônicas Lunares", que reconta contos de fadas clássicos em um cenário futurista.'),
('Anna Todd', '1989-03-20', 'Autora norte-americana que alcançou fama mundial através da plataforma Wattpad com a série "After". Sua escrita foca em romances intensos e turbulentos, que se tornaram um fenômeno editorial e foram adaptados para o cinema.'),
('Casey McQuiston', '1991-01-21', 'Autora norte-americana de ficção romântica contemporânea, célebre por seu livro de estreia "Vermelho, Branco e Sangue Azul". Suas obras são conhecidas por apresentarem personagens LGBTQIA+ em histórias divertidas e emocionantes.'),
('Judith Viorst', '1931-02-02', 'Escritora, jornalista e pesquisadora norte-americana, conhecida por sua vasta obra que inclui literatura infantil, poesia e livros de psicologia. Seu livro mais famoso é "Alexander e o Dia Terrível, Horrível, Espantoso e Horroroso".'),
('Antoine de Saint-Exupéry', '1900-06-29', 'Escritor, ilustrador e aviador francês, considerado um dos grandes nomes da literatura do século XX. Sua obra mais famosa, "O Pequeno Príncipe", é um clássico atemporal que mescla poesia e filosofia. Desapareceu em uma missão de voo em 1944.'),
('J.K. Rowling', '1965-07-31', 'Autora e filantropa britânica, mundialmente famosa por criar a série de fantasia "Harry Potter", que se tornou um fenômeno cultural e uma das séries de livros mais vendidas da história. Seu trabalho inspirou filmes, peças de teatro e parques temáticos.'),
('Felipe Neto', '1988-01-21', 'Empresário, vlogger e influenciador digital brasileiro. É uma das personalidades mais conhecidas da internet no Brasil, com milhões de seguidores. Além de seu trabalho online, escreveu livros onde aborda sua trajetória e temas atuais como o discurso de ódio.'),
('Alice Oseman', '1994-10-16', 'Autora e ilustradora britânica de ficção para jovens adultos. É a criadora da aclamada série de graphic novels "Heartstopper", que explora o romance entre dois garotos e foi adaptada para uma série de sucesso da Netflix.'),
('Mary C. Müller', '1991-09-21', 'Escritora brasileira de Florianópolis, conhecida por suas comédias românticas leves e divertidas. Começou sua carreira publicando de forma independente na internet e conquistou um público fiel com livros como "Coisas Óbvias Sobre o Amor".');

-- Inserindo dados na tabela Categoria
INSERT INTO Categoria (nome) VALUES
('Drama'), ('Suspense'), ('Ficção científica'), ('Terror'), ('Ação'),
('Comédia'), ('Romance'), ('Distopia'), ('Aventura'), ('Mistério');

-- Inserindo dados na Tabela Emprestimo
INSERT INTO Emprestimo (id_usuario, id_livro, data_emprestimo, data_limite_devolucao, data_devolucao_real) VALUES
(1, 2, '2025-05-01', '2025-06-01', '2025-06-03'),
(3, 10, '2025-01-22', '2025-02-22', '2025-01-29'),
(4, 9, '2025-04-05', '2025-05-05', '2025-05-15'),
(6, 3, '2025-06-11', '2025-07-11', '2025-07-19'),
(2, 8, '2025-02-09', '2025-03-09', '2025-03-21'),
(7, 1, '2025-11-28', '2025-12-28', '2025-12-10'),
(5, 4, '2025-06-20', '2025-07-20', '2025-07-08'),
(10, 6, '2025-03-20', '2025-04-20', '2025-04-20'),
(8, 7, '2025-03-22', '2025-04-22', '2025-04-17'),
(9, 5, '2025-09-09', '2025-10-11', '2025-10-02');

-- Inserindo dados na tabela Autor_Livro
INSERT INTO Autor_Livro (id_livro, id_autor) VALUES
(1, 1),   -- É Assim Que Acaba - Colleen Hoover
(2, 2),   -- A Biblioteca da Meia-Noite - Matt Haig
(3, 3),   -- Renegados - Marissa Meyer
(4, 4),   -- After - Anna Todd
(5, 5),   -- Vermelho, Branco e S. Azul - Casey McQuiston
(6, 6),   -- Alexander e o Dia Terrível - Judith Viorst
(7, 7),   -- O Pequeno Príncipe - Antoine de Saint-Exupéry
(8, 8),   -- Harry Potter e o E. do P. - J.K. Rowling
(9, 9),   -- Como Enfrentar o Ódio - Felipe Neto
(10, 10), -- Heartstopper - Alice Oseman
(11, 11); -- Coisas Óbvias Sobre o Amor - Mary C. Müller

-- Inserindo dados na tabela Categoria_Livro
INSERT INTO Categoria_Livro (id_livro, id_categoria) VALUES
(1, 7), (1, 1),
(2, 3),
(3, 3), (3, 9),
(4, 7),
(5, 7),
(6, 6),
(7, 9),
(8, 9), (8, 10),
(10, 7),
(11, 7), (11, 6);

-- VERIFICAÇÃO DoS DADOS
SELECT * FROM Usuario;
SELECT * FROM Autor;
SELECT * FROM Livro;
SELECT * FROM Categoria;
SELECT * FROM Emprestimo;
SELECT * FROM Autor_Livro;
SELECT * FROM Categoria_Livro;