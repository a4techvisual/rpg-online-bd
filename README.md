# Jogo de RPG Online — Banco de Dados

Banco de dados de um jogo de RPG online, desenvolvido nas avaliações do
curso de desenvolvimento full-stack (SENAI).

A partir do diagrama entidade-relacionamento do projeto, as tabelas foram
criadas em linguagem de definição de dados (DDL) e populadas em linguagem
de manipulação de dados (DML).

## Tecnologia

- **SGBD:** Microsoft SQL Server
- **Linguagem:** T-SQL

## Arquivos

| Arquivo | Conteúdo | Avaliação |
|---------|----------|-----------|
| `rpg_online.sql` | Criação do banco e das tabelas (DDL) | Avaliação 2 |
| `rpg_dados.sql` | Inserção dos dados e consultas (DML/DQL) | Avaliação 3 |

## Como executar

1. Abra o SQL Server Management Studio (SSMS) e conecte-se ao servidor.
2. Execute o `rpg_online.sql` para criar o banco `RpgOnlineDB` e as tabelas.
3. Execute o `rpg_dados.sql` para inserir os dados e rodar as consultas.

> Importante: execute sempre o `rpg_online.sql` **antes** do `rpg_dados.sql`.

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
