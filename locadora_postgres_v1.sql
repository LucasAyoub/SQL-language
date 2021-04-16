CREATE TABLE "generos" (
  "id" int PRIMARY KEY,
  "genero" varchar NOT NULL
);

CREATE TABLE "filmes" (
  "id" int PRIMARY KEY,
  "titulo" varchar NOT NULL,
  "id_genero" int NOT NULL,
  "valor" decimal(8,2) NOT NULL
);

CREATE TABLE "dvds" (
  "id" int PRIMARY KEY,
  "id_filme" int NOT NULL,
  "quantidade" int NOT NULL
);

CREATE TABLE "atores" (
  "id" int PRIMARY KEY,
  "nome" varchar NOT NULL
);

CREATE TABLE "atores_filme" (
  "id" int PRIMARY KEY,
  "id_filme" int NOT NULL,
  "id_ator" int NOT NULL,
  "personagem" varchar NOT NULL
);

CREATE TABLE "clientes" (
  "id" int PRIMARY KEY,
  "nome" varchar NOT NULL,
  "sobrenome" varchar NOT NULL,
  "telefone" varchar NOT NULL,
  "endereco" varchar NOT NULL
);

CREATE TABLE "emprestimos" (
  "id" int PRIMARY KEY,
  "data" datetime NOT NULL,
  "id_cliente" int NOT NULL
);

CREATE TABLE "filmes_emprestimo" (
  "id" int PRIMARY KEY,
  "id_emprestimo" int NOT NULL,
  "id_filme" int NOT NULL
);

CREATE TABLE "devolucoes" (
  "id" int PRIMARY KEY,
  "id_emprestimo" int NOT NULL,
  "data" datetime NOT NULL
);

CREATE TABLE "filmes_devolucao" (
  "id" int PRIMARY KEY,
  "id_devolucao" int NOT NULL,
  "id_filme_imprestimo" int NOT NULL
);

ALTER TABLE "filmes" ADD FOREIGN KEY ("id_genero") REFERENCES "generos" ("id");

ALTER TABLE "dvds" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "atores_filme" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "atores_filme" ADD FOREIGN KEY ("id_ator") REFERENCES "atores" ("id");

ALTER TABLE "emprestimos" ADD FOREIGN KEY ("id_cliente") REFERENCES "clientes" ("id");

ALTER TABLE "filmes_emprestimo" ADD FOREIGN KEY ("id_emprestimo") REFERENCES "emprestimos" ("id");

ALTER TABLE "filmes_emprestimo" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "devolucoes" ADD FOREIGN KEY ("id_emprestimo") REFERENCES "emprestimos" ("id");

ALTER TABLE "filmes_devolucao" ADD FOREIGN KEY ("id_devolucao") REFERENCES "devolucoes" ("id");

ALTER TABLE "filmes_devolucao" ADD FOREIGN KEY ("id_filme_imprestimo") REFERENCES "filmes_emprestimo" ("id");