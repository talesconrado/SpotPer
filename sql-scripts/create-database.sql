-- Remove "--" if database spotper doesn't exist
-- CREATE DATABASE spotper;
CREATE DATABASE spotper
 ON PRIMARY(
     NAME='spotper',
     FILENAME='/home/talesc/Documents/fbd/db_spotper/spotper.mdf',
     SIZE=5120KB,
     FILEGROWTH=1024KB
 ),
 FILEGROUP spotper_fg01 (
     NAME='spotper_01',
     FILENAME='/home/talesc/Documents/fbd/db_spotper/spotper_01.ndf',
     SIZE=2048KB,
     FILEGROWTH=30%
 ),
 (
     NAME='spotper_02',
     FILENAME='/home/talesc/Documents/fbd/db_spotper/spotper_02.ndf',
     SIZE=2048KB,
     FILEGROWTH=20%
 ),
 FILEGROUP spotper_fg02 (
     NAME='spotper_03',
     FILENAME='/home/talesc/Documents/fbd/db_spotper/spotper_03.ndf',
     SIZE=4096KB,
     MAXSIZE=8192KB,
     FILEGROWTH=15%
 )
 LOG ON (
     NAME='spotper_log',
     FILENAME='/home/talesc/Documents/fbd/db_spotper/spotper_log.ldf',
     SIZE=1024KB,
     FILEGROWTH=10%
 )
--Remove "--" if database spotper has not been selected
USE spotper;

CREATE TABLE endereco (
    numero INT,
    cep INT,
    pais VARCHAR(50),
    estado VARCHAR(50),
    cidade VARCHAR(50),
    rua VARCHAR(150),

    CONSTRAINT pk_codendereco PRIMARY KEY (numero, cep)
) ON spotper_fg01;

CREATE TABLE gravadora (
    codgravadora INT,
    nome VARCHAR(200),
    homepage VARCHAR(300),

    numero INT,
    cep INT,

    CONSTRAINT pk_codgravadora PRIMARY KEY(codgravadora),
    CONSTRAINT fk_codendereco FOREIGN KEY(numero, cep)
        REFERENCES endereco(numero, cep) ON UPDATE CASCADE ON DELETE NO ACTION,
) ON spotper_fg01;

CREATE TABLE telefone (
    num INT,
    ddd INT,
    ddi INT,

    codgravadora INT,

    CONSTRAINT pk_codtelefone PRIMARY KEY(ddd, num),
    CONSTRAINT fk_telgravadora FOREIGN KEY(codgravadora)
        REFERENCES gravadora(codgravadora) ON UPDATE CASCADE ON DELETE CASCADE
) ON spotper_fg01;

CREATE TABLE album (
    codalbum INT,
    descricao VARCHAR(200),
    dtgravacao DATETIME,
    dtcompra DATETIME,
    tipocompra VARCHAR(50),
    prcompra DEC(11, 2),

    codgravadora INT,

    CONSTRAINT chk_dtcompra CHECK (dtcompra >= '2000-01-01'),
    CONSTRAINT chk_tipocompra CHECK (tipocompra = 'fisica' or tipocompra = 'download'),

    CONSTRAINT pk_codalbum PRIMARY KEY(codalbum),
    CONSTRAINT fk_codgravadora FOREIGN KEY(codgravadora) 
        REFERENCES gravadora(codgravadora) ON UPDATE CASCADE ON DELETE NO ACTION
) ON spotper_fg01;

CREATE TABLE tipoComposicao(
    cod INT,
    descricao VARCHAR(200),

    CONSTRAINT pk_codtipocomposicao PRIMARY KEY(cod)
) ON spotper_fg01;

CREATE TABLE faixa (
    codfaixa INT,
    descricao VARCHAR(200),
    numfaixa INT,
    tipogravacao VARCHAR(5),
    -- tempoexecucao in minute
    tempo DEC(8, 2),

    codalbum INT,
    codtipocomposicao INT,

    CONSTRAINT chk_tipogravacao CHECK (tipogravacao = 'ADD' or tipogravacao = 'DDD'),

    CONSTRAINT pk_codfaixa PRIMARY KEY(codfaixa),
    CONSTRAINT fk_codalbum FOREIGN KEY(codalbum)
        REFERENCES album(codalbum) ON DELETE CASCADE,
    CONSTRAINT fk_codtipocomposicao FOREIGN KEY(codtipocomposicao)
        REFERENCES tipoComposicao(cod)
) ON spotper_fg02;

CREATE INDEX faixa_IDX_codalbum ON faixa (codalbum) WITH (fillfactor = 100);
CREATE INDEX faixa_IDX_codtipocomposicao ON faixa (codtipocomposicao) WITH (fillfactor = 100);

CREATE TABLE periodoMusical (
    codperiodomusical INT,
    nome VARCHAR(30) NOT NULL,
    descricao VARCHAR(600),
    dtinicio DATE,
    dtfim DATE,

    CONSTRAINT pk_codperiodomusical PRIMARY KEY(codperiodomusical)
) ON spotper_fg01;

CREATE TABLE compositor (
    codcompositor INT,
    nome VARCHAR(200),
    dtnascimento DATE,
    dtmorte DATE,
    cidade VARCHAR(50),
    pais VARCHAR(50),

    codperiodomusical INT,

    CONSTRAINT pk_codcompositor PRIMARY KEY(codcompositor),
    CONSTRAINT fk_codperiodomusical FOREIGN KEY(codperiodomusical)
        REFERENCES periodoMusical(codperiodomusical) ON UPDATE CASCADE ON DELETE NO ACTION
) ON spotper_fg01;

CREATE TABLE interprete (
    codinterprete INT,
    nome VARCHAR(200),
    tipo VARCHAR(20),

    CONSTRAINT pk_codinterprete PRIMARY KEY(codinterprete)
) ON spotper_fg01;

-- without tempototal column
CREATE TABLE playlist (
    codplaylist INT,
    nome VARCHAR(200),
    dtnascimento DATETIME,

    CONSTRAINT fk_codplaylist PRIMARY KEY(codplaylist)
) ON spotper_fg02;

CREATE TABLE faixasNaPlaylist (
    codplaylist INT,
    codfaixaplaylist INT,

    CONSTRAINT fk_fnpcodplaylist FOREIGN KEY(codplaylist)
        REFERENCES playlist(codplaylist) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_codfaixaplaylist FOREIGN KEY(codfaixaplaylist)
        REFERENCES faixa(codfaixa) ON UPDATE CASCADE ON DELETE CASCADE
) ON spotper_fg02;

CREATE TABLE interpretadoPor (
    codinterprete INT,
    codfaixainterprete INT,

    CONSTRAINT fk_codinterprete FOREIGN KEY(codinterprete)
        REFERENCES interprete(codinterprete) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_codfaixainterprete FOREIGN KEY(codfaixainterprete)
        REFERENCES faixa(codfaixa) ON UPDATE CASCADE ON DELETE CASCADE
) ON spotper_fg01;

CREATE TABLE compostaPor (
    codcompositor INT,
    codfaixacompositor INT,

    CONSTRAINT fk_codcompositor FOREIGN KEY(codcompositor)
        REFERENCES compositor(codcompositor) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT fk_codfaixacompositor FOREIGN KEY(codfaixacompositor)
        REFERENCES faixa(codfaixa) ON UPDATE CASCADE ON DELETE CASCADE
) ON spotper_fg01;
