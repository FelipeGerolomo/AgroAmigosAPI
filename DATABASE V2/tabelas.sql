CREATE TABLE AUX_COTACOES (
    COD_PRODUTO INT NULL,
    DC_PRODUTO varchar(255) NOT NULL,
    DC_PRECO varchar(255) NOT NULL,
    DC_UNIDADE varchar(255) NOT NULL,
    DT_DATA datetime NOT NULL,
    CONSTRAINT PK_AUX_COTACOES primary key(DC_PRODUTO, DT_DATA)
);

CREATE TABLE COTACOES (
    COD_PRODUTO INT NULL,
    DC_PRODUTO varchar(255) NOT NULL,
    DC_PRECO varchar(255) NOT NULL,
    DC_UNIDADE varchar(255) NOT NULL,
    DT_DATA datetime NOT NULL,
    CONSTRAINT PK_COTACOES primary key(DC_PRODUTO, DT_DATA)
);

CREATE TABLE PRODUTOS (
    COD_PRODUTO INT NOT NULL,
    NM_PRODUTO varchar(255) NOT NULL,
    CONSTRAINT PK_PRODUTOS primary key(COD_PRODUTO, NM_PRODUTO)
);


CREATE TABLE IF NOT EXISTS user (
  ID_USER int(11) NOT NULL auto_increment,
  EMAIL varchar(200) NOT NULL,
  SENHA varchar(40) NOT NULL,
  NOME varchar(250) NOT NULL,
  UF varchar(250) NOT NULL,
  CIDADE varchar(100) NOT NULL,
  TELEFONE varchar(100) NOT NULL,
  CONSTRAINT PK_USER primary key(ID_USER, EMAIL)
);

CREATE TABLE user_config (
    COD_USER INT NOT NULL,
    COD_PRODUTO INT NOT NULL,
    CONSTRAINT PK_PRODUTOS primary key(COD_USER, COD_PRODUTO)
);

select * from aux_cotacoes;

select * from cotacoes as c1 where DT_DATA = (select max(DT_DATA) from cotacoes as c2);



select * from user;

select * from user_config where COD_USER = 2;
select * from produtos;








truncate aux_cotacoes;
INSERT INTO AUX_COTACOES (DC_PRODUTO,DC_PRECO,DC_UNIDADE,DT_DATA) VALUES ('Café Robusta', 'R$ 333,79', 'sc de 60kg', '2018-11-09');

