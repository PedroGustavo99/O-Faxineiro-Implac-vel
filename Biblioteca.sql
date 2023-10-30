drop database if exists Biblioteca;
create database if not exists Biblioteca;

use Biblioteca;
create table if not exists autores(
	cd_autor int primary key auto_increment,
    nome_autor varchar(255)
);

insert into autores (nome_autor) values
('John Green'),
('J.K. Rowling'),
('J.R.R. Tolkien'),
('J.D. Salinger'),
('George Orwell'),
('Rick Riordan'),
('João Guimarães Rosa'),
('Graciliano Ramos'),
('Machado de Assis'),
('Aluísio Azevedo'),
('Mário de Andrade');


create table if not exists editoras(
	cd_editora int primary key auto_increment,
    nome_editora varchar(255)
);

insert into editoras (nome_editora) values
('Intrínseca'),
('Rocco'),
('Martins Fontes'),
('Little, Brown and Company'),
('Nova Fronteira'),
('Companhia Editora Nacional'),
('Companhia das Letras'),
('Martin Claret'),
('Penguin Companhia');


create table if not exists livros (
    cd_livros int primary key auto_increment,
    nm_titulo varchar(255),
    nm_autor varchar(255),
    nm_editora varchar(255),
    ano_publicacao int,
    isbn varchar(30)
);

-- elimine as colunas 'autor' e 'editora' da tabela 'Livros'. adicione as colunas 'cd_autor' e 'cd_editora'
alter table livros 
drop column nm_autor,
drop column nm_editora;

alter table livros 
add column cd_autor int not null,
add column cd_editora int not null;

alter table livros
add foreign key(cd_autor) references autores(cd_autor) on delete cascade on update cascade,
add foreign key(cd_editora) references editoras(cd_editora) on delete cascade on update cascade;

insert into livros (nm_titulo, ano_publicacao, isbn, cd_autor, cd_editora) values
('A Culpa é das Estrelas', 2012, '9788580573466', 1, 2),
('Harry Potter e a Pedra Filosofal', 1997, '9788532511010', 2, 2),
('O Senhor dos Anéis: A Sociedade do Anel', 1954, '9788533603149', 3, 3),
('The Catcher in the Rye', 1951, '9780316769488', 4, 4 ),
('1984',  1949, '9788522106169', 5, 5),
('Percy Jackson e o Ladrão de Raios',  2005, '9788598078355', 6, 1),
('Grande Sertão: Veredas', 1956, '9788520923251', 7, 6),
('Memórias Póstumas de Brás Cubas', 1881,'9788535910663', 8, 7),
('Vidas Secas', 1938,'9788572326972', 9, 5),
('O Alienista', 1882,'9788572327429', 8, 8), 
('O Cortiço', 1890,'9788579027048', 10, 9),
('Dom Casmurro', 1899,'9788583862093', 8, 9),
('Macunaíma', 1928,'9788503012302', 11, 5); 
