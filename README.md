# Atividade em grupo - Projeto Integrador II

### Faculdade Alpha
### Professor: Rafael Marinho dos Anjos

### Equipe:

| Alunos |
|--------|
| Douglas Inacio Silva Barbosa |
| Eric Albuquerque de Santana |
| Arthur Cesar França do Nascimento |
| Hugo William da Silva Muniz |
| Bruno Michel da Silva |

## Introdução

Descrever todo o projeto, o que será desenvolvido e qual a finalidade.

## Banco de dados

- [Código de criação do BD](./data/codigo_criacao_banco.sql)
<br><br><br><br>

## TABELA DO BANCO:

- Tabela Autor:

| Coluna        | Tipo    | Descrição                     |
|---------------|---------|-------------------------------|
| AutorID       | int     | Identificador do autor (PK)   |
| Nome          | varchar | Nome do autor                 |
| Nacionalidade | varchar | Nacionalidade do autor        |

<br><br>

- Tabela Editora:

| Coluna      | Tipo    | Descrição                           |
|-------------|---------|-------------------------------------|
| EditoraID   | int     | Identificador da editora (PK)       |
| Nome        | varchar | Nome da editora                     |
| Cidade      | varchar | Cidade da editora                   |
| AnoFundacao | int     | Ano de fundação da editora          |

<br><br>

- Tabela Livro:

| Coluna        | Tipo    | Descrição                                   |
|---------------|---------|---------------------------------------------|
| LivroID       | int     | Identificador do livro (PK)                 |
| Titulo        | varchar | Título do livro                             |
| ISBN          | varchar | Código ISBN do livro (único)                |
| AnoPublicacao | int     | Ano de publicação                           |
| EditoraID     | int     | Chave estrangeira para a editora (FK)       |
| Genero        | varchar | Gênero do livro                             |

<br><br>

- Tabela LivroAutor:

| Coluna   | Tipo | Descrição                                   |
|----------|------|---------------------------------------------|
| LivroID  | int  | Chave estrangeira para o livro (PK, FK)     |
| AutorID  | int  | Chave estrangeira para o autor (PK, FK)     |

<br><br>

- Tabela Usuário:

| Coluna    | Tipo    | Descrição                          |
|-----------|---------|------------------------------------|
| UsuarioID | int     | Identificador do usuário (PK)      |
| Nome      | varchar | Nome do usuário                    |
| Email     | varchar | Email do usuário (único)           |
| Telefone  | varchar | Telefone do usuário                |
| Endereco  | text    | Endereço completo do usuário       |

<br><br>

- Tabela Emprestimo:

| Coluna                | Tipo | Descrição                                     |
|------------------------|------|-----------------------------------------------|
| EmprestimoID           | int  | Identificador do empréstimo (PK)              |
| LivroID                | int  | Chave estrangeira para o livro (FK)           |
| UsuarioID              | int  | Chave estrangeira para o usuário (FK)         |
| DataEmprestimo         | date | Data do empréstimo                            |
| DataDevolucaoPrevista  | date | Data prevista para devolução                  |
| DataDevolucaoEfetiva   | date | Data real da devolução                        |
| Status                 | enum | Estado do empréstimo (ativo, devolvido, atrasado) |