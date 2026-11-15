# Jogo de RPG Online — Banco de Dados

Script de criação do banco de dados de um jogo de RPG online, desenvolvido na
**Avaliação 2** do curso de desenvolvimento full-stack (SENAI).

A atividade consiste em implementar, em linguagem de definição de dados (DDL),
a estrutura apresentada no diagrama entidade-relacionamento do projeto.

## Tecnologia

- **SGBD:** Microsoft SQL Server
- **Linguagem:** T-SQL (DDL)
- **Arquivo:** `rpg_online.sql`

## Como executar

1. Abra o SQL Server Management Studio (SSMS) e conecte-se ao servidor.
2. Abra o arquivo `rpg_online.sql`.
3. Execute o script. Ele cria o banco `RpgOnlineDB` e, em seguida, as tabelas.

## Estrutura das tabelas

| Tabela | Descrição |
|--------|-----------|
| `USUARIOS` | Contas de acesso dos jogadores (email e senha). |
| `CLASSES` | Classes disponíveis para os personagens (nome e descrição). |
| `HABILIDADES` | Habilidades existentes no jogo. |
| `PERSONAGENS` | Personagens criados pelos usuários, cada um ligado a um usuário e a uma classe. |
| `CLASSES_HABILIDADES` | Tabela associativa que liga classes às suas habilidades. |

## Relacionamentos

- **USUARIOS 1:N PERSONAGENS** — um usuário possui vários personagens.
- **CLASSES 1:N PERSONAGENS** — um personagem pertence a uma classe.
- **CLASSES N:N HABILIDADES** — resolvido pela tabela `CLASSES_HABILIDADES`,
  cuja chave primária é composta por `ClasseId` + `HabilidadeId`.

## Autor

Rômulo Delalíbera Júnior — [github.com/a4techvisual](https://github.com/a4techvisual)
