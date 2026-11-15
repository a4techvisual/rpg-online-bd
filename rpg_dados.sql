/* =============================================================
   Projeto: Jogo de RPG Online
   Avaliacao 3 - Manipulacao de dados (DML)
   SGBD: Microsoft SQL Server (T-SQL)
   Autor: Romulo Delalibera Junior

   Observacao: execute antes o script rpg_online.sql
   (Avaliacao 2), que cria o banco e as tabelas.
   ============================================================= */

USE RpgOnlineDB;
GO

/* =============================================================
   1. INSERCAO DE DADOS (INSERT)
   A ordem respeita as chaves estrangeiras:
   primeiro as tabelas independentes, depois as que referenciam.
   O Id nao e informado pois a coluna usa IDENTITY (auto).
   ============================================================= */

-- ---------- USUARIOS ----------
INSERT INTO USUARIOS (Email, Senha) VALUES
 ('romulo@rpgonline.com', 'senha123')      -- UsuarioId = 1
,('ana@rpgonline.com',    'ana2024')       -- UsuarioId = 2
,('carlos@rpgonline.com', 'carlos@456');   -- UsuarioId = 3
GO

-- ---------- CLASSES ----------
INSERT INTO CLASSES (Nome, Descricao) VALUES
 ('Guerreiro', 'Especialista em combate corpo a corpo e alta resistencia')  -- ClasseId = 1
,('Mago',      'Conjurador de magias arcanas de grande poder')              -- ClasseId = 2
,('Arqueiro',  'Mestre em ataques a distancia com arco e flecha')           -- ClasseId = 3
,('Clerigo',   'Curandeiro que apoia o grupo com magias divinas')           -- ClasseId = 4
,('Ladino',    'Agil e furtivo, especialista em ataques surpresa');         -- ClasseId = 5
GO

-- ---------- HABILIDADES ----------
INSERT INTO HABILIDADES (Nome) VALUES
 ('Golpe Poderoso')    -- HabilidadeId = 1
,('Bola de Fogo')      -- HabilidadeId = 2
,('Flecha Certeira')   -- HabilidadeId = 3
,('Cura')              -- HabilidadeId = 4
,('Furtividade')       -- HabilidadeId = 5
,('Escudo Arcano')     -- HabilidadeId = 6
,('Investida');        -- HabilidadeId = 7
GO

-- ---------- PERSONAGENS ----------
-- Cada personagem pertence a um usuario e a uma classe.
INSERT INTO PERSONAGENS (NomePersonagem, UsuarioId, ClasseId) VALUES
 ('Thorin',    1, 1)   -- jogador romulo, Guerreiro
,('Gandril',   1, 2)   -- jogador romulo, Mago
,('Lyra',      2, 3)   -- jogadora ana, Arqueiro
,('Seraphina', 2, 4)   -- jogadora ana, Clerigo
,('Sombra',    3, 5);  -- jogador carlos, Ladino
GO

-- ---------- CLASSES_HABILIDADES ----------
-- Tabela associativa: define quais habilidades cada classe possui.
INSERT INTO CLASSES_HABILIDADES (ClasseId, HabilidadeId) VALUES
 (1, 1)   -- Guerreiro -> Golpe Poderoso
,(1, 7)   -- Guerreiro -> Investida
,(2, 2)   -- Mago -> Bola de Fogo
,(2, 6)   -- Mago -> Escudo Arcano
,(3, 3)   -- Arqueiro -> Flecha Certeira
,(4, 4)   -- Clerigo -> Cura
,(4, 6)   -- Clerigo -> Escudo Arcano
,(5, 5)   -- Ladino -> Furtividade
,(5, 1);  -- Ladino -> Golpe Poderoso
GO

/* =============================================================
   2. CONSULTAS DE VERIFICACAO (SELECT)
   Nao alteram dados. Servem para conferir o que foi inserido.
   ============================================================= */

-- Todos os registros de cada tabela
SELECT * FROM USUARIOS;
SELECT * FROM CLASSES;
SELECT * FROM HABILIDADES;
SELECT * FROM PERSONAGENS;
SELECT * FROM CLASSES_HABILIDADES;
GO

-- Consulta com filtro (WHERE): personagens de um usuario especifico
SELECT NomePersonagem, UsuarioId, ClasseId
FROM PERSONAGENS
WHERE UsuarioId = 1;
GO

/* =============================================================
   3. EXEMPLOS DE ATUALIZACAO E EXCLUSAO (UPDATE / DELETE)
   -------------------------------------------------------------
   Estao comentados de proposito: o objetivo desta avaliacao e
   inserir os dados. Remova os comentarios (--) para testar
   cada comando individualmente, se desejar.
   ============================================================= */

-- Atualizar a senha de um usuario (UPDATE)
-- UPDATE USUARIOS SET Senha = 'novaSenha789' WHERE UsuarioId = 2;

-- Conferir a atualizacao
-- SELECT UsuarioId, Email, Senha FROM USUARIOS WHERE UsuarioId = 2;

-- Remover uma habilidade de uma classe (DELETE na tabela associativa)
-- DELETE FROM CLASSES_HABILIDADES WHERE ClasseId = 5 AND HabilidadeId = 1;

-- Conferir a exclusao
-- SELECT * FROM CLASSES_HABILIDADES WHERE ClasseId = 5;
GO
