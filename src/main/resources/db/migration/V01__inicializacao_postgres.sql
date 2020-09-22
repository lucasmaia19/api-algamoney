create sequence categoria_sequence start 1 increment 1;
create sequence lancamento_sequence start 1 increment 1;
create sequence pessoa_sequence start 1 increment 1;
create sequence usuario_sequence start 1 increment 1;

create table categoria (codigo int8 not null, nome varchar(20) not null, primary key (codigo));
create table lancamento (codigo int8 not null, data_pagamento date, data_vencimento date not null, descricao varchar(255) not null, observacao varchar(255), tipo varchar(255) not null, valor numeric(19, 2) not null, codigo_categoria int8 not null, codigo_pessoa int8 not null, primary key (codigo));
create table permissao (codigo int8 not null, descricao varchar(255), primary key (codigo));
create table pessoa (codigo int8 not null, ativo boolean not null, bairro varchar(255), cep varchar(255), cidade varchar(255), complemento varchar(255), estado varchar(255), logradouro varchar(255), numero varchar(255), nome varchar(255) not null, primary key (codigo));
create table usuario (codigo int8 not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (codigo));
create table usuario_permissao (codigo_usuario int8 not null, codigo_permissao int8 not null);

alter table lancamento add constraint FK3oktdfripre9vo4ocu87op55a foreign key (codigo_categoria) references categoria;
alter table lancamento add constraint FK9pqx360616efx77k3w4j297yw foreign key (codigo_pessoa) references pessoa;
alter table usuario_permissao add constraint FK5tjrvuwlx1yp72mrf8t8vj93e foreign key (codigo_permissao) references permissao;
alter table usuario_permissao add constraint FKeogfr4akeqn19xr3wmyx0n8bo foreign key (codigo_usuario) references usuario;

INSERT INTO categoria (codigo, nome) values (nextval('categoria_sequence'), 'Lazer');
INSERT INTO categoria (codigo, nome) values (nextval('categoria_sequence'), 'Alimentação');
INSERT INTO categoria (codigo, nome) values (nextval('categoria_sequence'), 'Supermercado');
INSERT INTO categoria (codigo, nome) values (nextval('categoria_sequence'), 'Farmácia');
INSERT INTO categoria (codigo, nome) values (nextval('categoria_sequence'), 'Outros');

INSERT INTO pessoa (codigo, nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (nextval('pessoa_sequence'), 'João Silva', 'Rua do Abacaxi', '10', null, 'Brasil', '38.400-12', 'Uberlândia', 'MG', true);
INSERT INTO pessoa (codigo, nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (nextval('pessoa_sequence'), 'Maria Rita', 'Rua do Sabiá', '110', 'Apto 101', 'Colina', '11.400-12', 'Ribeirão Preto', 'SP', true);
INSERT INTO pessoa (codigo, nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (nextval('pessoa_sequence'), 'Pedro Santos', 'Rua da Bateria', '23', null, 'Morumbi', '54.212-12', 'Goiânia', 'GO', true);
INSERT INTO pessoa (codigo, nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (nextval('pessoa_sequence'), 'Ricardo Pereira', 'Rua do Motorista', '123', 'Apto 302', 'Aparecida', '38.400-12', 'Salvador', 'BA', true);
INSERT INTO pessoa (codigo, nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (nextval('pessoa_sequence'), 'Josué Mariano', 'Av Rio Branco', '321', null, 'Jardins', '56.400-12', 'Natal', 'RN', true);
INSERT INTO pessoa (codigo, nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (nextval('pessoa_sequence'), 'Pedro Barbosa', 'Av Brasil', '100', null, 'Tubalina', '77.400-12', 'Porto Alegre', 'RS', true);
INSERT INTO pessoa (codigo, nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (nextval('pessoa_sequence'), 'Henrique Medeiros', 'Rua do Sapo', '1120', 'Apto 201', 'Centro', '12.400-12', 'Rio de Janeiro', 'RJ', true);
INSERT INTO pessoa (codigo, nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (nextval('pessoa_sequence'), 'Carlos Santana', 'Rua da Manga', '433', null, 'Centro', '31.400-12', 'Belo Horizonte', 'MG', true);
INSERT INTO pessoa (codigo, nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (nextval('pessoa_sequence'), 'Leonardo Oliveira', 'Rua do Músico', '566', null, 'Segismundo Pereira', '38.400-00', 'Uberlândia', 'MG', true);
INSERT INTO pessoa (codigo, nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (nextval('pessoa_sequence'), 'Isabela Martins', 'Rua da Terra', '1233', 'Apto 10', 'Vigilato', '99.400-12', 'Manaus', 'AM', true);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Salário mensal', '2017-06-10', null, 6500.00, 'Distribuição de lucros', 'RECEITA', 1, 1);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Bahamas', '2017-02-10', '2017-02-10', 100.32, null, 'DESPESA', 2, 2);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Top Club', '2017-06-10', null, 120, null, 'RECEITA', 3, 3);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'CEMIG', '2017-02-10', '2017-02-10', 110.44, 'Geração', 'RECEITA', 3, 4);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'DMAE', '2017-06-10', null, 200.30, null, 'DESPESA', 3, 5);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Extra', '2017-03-10', '2017-03-10', 1010.32, null, 'RECEITA', 4, 6);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Bahamas', '2017-06-10', null, 500, null, 'RECEITA', 1, 7);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Top Club', '2017-03-10', '2017-03-10', 400.32, null, 'DESPESA', 4, 8);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Despachante', '2017-06-10', null, 123.64, 'Multas', 'DESPESA', 3, 9);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Pneus', '2017-04-10', '2017-04-10', 665.33, null, 'RECEITA', 5, 10);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Café', '2017-06-10', null, 8.32, null, 'DESPESA', 1, 5);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Eletrônicos', '2017-04-10', '2017-04-10', 2100.32, null, 'DESPESA', 5, 4);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Instrumentos', '2017-06-10', null, 1040.32, null, 'DESPESA', 4, 3);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Café', '2017-04-10', '2017-04-10', 4.32, null, 'DESPESA', 4, 2);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (nextval('lancamento_sequence'), 'Lanche', '2017-06-10', null, 10.20, null, 'DESPESA', 4, 1);

INSERT INTO usuario (codigo, nome, email, senha) values (1, 'Administrador', 'admin@algamoney.com', '$2a$10$X607ZPhQ4EgGNaYKt3n4SONjIv9zc.VMWdEuhCuba7oLAL5IvcL5.');
INSERT INTO usuario (codigo, nome, email, senha) values (2, 'Maria Silva', 'maria@algamoney.com', '$2a$10$Zc3w6HyuPOPXamaMhh.PQOXvDnEsadztbfi6/RyZWJDzimE8WQjaq');

INSERT INTO permissao (codigo, descricao) values (1, 'ROLE_CADASTRAR_CATEGORIA');
INSERT INTO permissao (codigo, descricao) values (2, 'ROLE_PESQUISAR_CATEGORIA');

INSERT INTO permissao (codigo, descricao) values (3, 'ROLE_CADASTRAR_PESSOA');
INSERT INTO permissao (codigo, descricao) values (4, 'ROLE_REMOVER_PESSOA');
INSERT INTO permissao (codigo, descricao) values (5, 'ROLE_PESQUISAR_PESSOA');

INSERT INTO permissao (codigo, descricao) values (6, 'ROLE_CADASTRAR_LANCAMENTO');
INSERT INTO permissao (codigo, descricao) values (7, 'ROLE_REMOVER_LANCAMENTO');
INSERT INTO permissao (codigo, descricao) values (8, 'ROLE_PESQUISAR_LANCAMENTO');

-- admin
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 1);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 2);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 3);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 4);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 5);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 6);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 7);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 8);

-- maria
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (2, 2);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (2, 5);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (2, 8);
