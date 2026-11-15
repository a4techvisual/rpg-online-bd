/* =============================================================
   Projeto: Jogo de RPG Online
   Avaliacao 2 - Criacao das tabelas (DDL)
   SGBD: Microsoft SQL Server (T-SQL)
   Autor: Romulo Delalibera Junior
   ============================================================= */

/* -------------------------------------------------------------
   1. Criacao do banco de dados
   ------------------------------------------------------------- */
CREATE DATABASE RpgOnlineDB;
GO

-- Seleciona o banco recem-criado (sai do master)
USE RpgOnlineDB;
GO

/* -------------------------------------------------------------
   2. Criacao das tabelas
   Ordem: primeiro as tabelas sem chave estrangeira (menos
   dependentes), depois as que referenciam outras.
   ------------------------------------------------------------- */

-- Tabela USUARIOS (nao depende de nenhuma outra)
CREATE TABLE USUARIOS
(
     UsuarioId INT PRIMARY KEY IDENTITY
    ,Email VARCHAR(120) NOT NULL UNIQUE
    ,Senha VARCHAR(255) NOT NULL
);
GO

-- Tabela CLASSES (nao depende de nenhuma outra)
CREATE TABLE CLASSES
(
     ClasseId INT PRIMARY KEY IDENTITY
    ,Nome VARCHAR(120) NOT NULL UNIQUE
    ,Descricao VARCHAR(255)
);
GO

-- Tabela HABILIDADES (nao depende de nenhuma outra)
CREATE TABLE HABILIDADES
(
     HabilidadeId INT PRIMARY KEY IDENTITY
    ,Nome VARCHAR(120) NOT NULL UNIQUE
);
GO

-- Tabela PERSONAGENS
-- Relacionamentos:
--   USUARIOS 1:N PERSONAGENS  (um usuario possui varios personagens)
--   CLASSES  1:N PERSONAGENS  (um personagem pertence a uma classe)
CREATE TABLE PERSONAGENS
(
     PersonagemId INT PRIMARY KEY IDENTITY
    ,NomePersonagem VARCHAR(120) NOT NULL
    ,UsuarioId INT NOT NULL FOREIGN KEY REFERENCES USUARIOS(UsuarioId)
    ,ClasseId INT NOT NULL FOREIGN KEY REFERENCES CLASSES(ClasseId)
);
GO

-- Tabela CLASSES_HABILIDADES (tabela associativa)
-- Resolve o relacionamento N:N entre CLASSES e HABILIDADES.
-- A chave primaria e composta pelas duas chaves estrangeiras.
CREATE TABLE CLASSES_HABILIDADES
(
     ClasseId INT NOT NULL FOREIGN KEY REFERENCES CLASSES(ClasseId)
    ,HabilidadeId INT NOT NULL FOREIGN KEY REFERENCES HABILIDADES(HabilidadeId)
    ,PRIMARY KEY (ClasseId, HabilidadeId)
);
GO
