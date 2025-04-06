CREATE DATABASE Biblioteca1;

USE Biblioteca1;

CREATE TABLE Autor (
    AutorID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Nacionalidade VARCHAR(50)
);


CREATE TABLE Editora (
    EditoraID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Cidade VARCHAR(50),
    AnoFundacao INT
);


CREATE TABLE Livro (
    LivroID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    AnoPublicacao INT,
    EditoraID INT,
    FOREIGN KEY (EditoraID) REFERENCES Editora(EditoraID),
    Genero varchar(50)
);


CREATE TABLE LivroAutor (
    LivroID INT,
    AutorID INT,
    PRIMARY KEY (LivroID, AutorID),
    FOREIGN KEY (LivroID) REFERENCES Livro(LivroID),
    FOREIGN KEY (AutorID) REFERENCES Autor(AutorID)
);


CREATE TABLE Usuario (
    UsuarioID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(20),
    Endereco TEXT
);


CREATE TABLE Emprestimo (
    EmprestimoID INT PRIMARY KEY AUTO_INCREMENT,
    LivroID INT,
    UsuarioID INT,
    DataEmprestimo DATE NOT NULL,
    DataDevolucaoPrevista DATE NOT NULL,
    DataDevolucaoEfetiva DATE,
    Status ENUM('ativo', 'devolvido', 'atrasado') DEFAULT 'ativo',
    FOREIGN KEY (LivroID) REFERENCES Livro(LivroID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID)
);


INSERT INTO Autor (Nome, Nacionalidade) 
VALUES
	('Machado de Assis', 'Brasileira'),
	('Clarice Lispector', 'Brasileira'),
	('George Orwell', 'Britânico');

INSERT INTO Editora (Nome, Cidade, AnoFundacao) 
VALUES
	('Companhia das Letras', 'São Paulo', 1986),
	('Editora 34', 'Rio de Janeiro', 1992),
	('Martin Claret', 'São Paulo', 1997);

INSERT INTO Livro (Titulo, ISBN, AnoPublicacao, EditoraID, Genero) 
VALUES
	('Dom Casmurro', '9788535910663', 1899, 1, 'Romance'),
	('A Hora da Estrela', '9788532502585', 1977, 2,'Romance'),
	('1984', '9788535906550', 1949, 1,'Ficção Ciêntifica');

INSERT INTO LivroAutor (LivroID, AutorID)
VALUES
(1, 1),
(2, 2),
(3, 3);


INSERT INTO Usuario (Nome, Email, Telefone, Endereco) 
VALUES
	('Eric Albuquerque', 'eric.albuquerque@email.com', '(81) 99999-9999', 'Rua do Sol, 100 - Recife/PE'),
	('Douglas Inacio', 'douglas.inacio@email.com', '(81) 98888-8888', 'Av. Boa Viagem, 500 - Recife/PE'),
	('Bruno Michel', 'bruno.michel@email.com', '(81) 97777-7777', 'Rua da Aurora, 200 - Recife/PE'),
	('Arthur Bruno', 'arthur.bruno@email.com', '(81) 96666-6666', 'Rua do Riachuelo, 300 - Recife/PE'),
	('Hugo William', 'hugo.shogun@email.com', '(81) 95555-5555', 'Av. Conde da Boa Vista, 400 - Recife/PE');


INSERT INTO Emprestimo (LivroID, UsuarioID, DataEmprestimo, DataDevolucaoPrevista) VALUES
	(1, 3, '2023-06-01', '2023-06-15'),
	(2, 5, '2023-06-02', '2023-06-16'),  
	(3, 2, '2023-06-03', '2023-06-17');





SELECT * FROM Editora;
SELECT * FROM Livro;
SELECT * FROM LivroAutor;
SELECT * FROM Usuario;
SELECT * FROM Emprestimo;