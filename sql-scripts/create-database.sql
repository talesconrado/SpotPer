-- Remove "--" if you want delete spotper database
--DROP DATABASE spotper;

-- Remove "--" if database spotper doesn't exist
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
GO
--Remove "--" if database spotper has not been selected
USE spotper;

CREATE TABLE endereco (
    numero INT NOT NULL,
    cep INT NOT NULL,
    pais VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    rua VARCHAR(150) NOT NULL,

    CONSTRAINT pk_codendereco PRIMARY KEY (numero, cep)
) ON spotper_fg01;

CREATE TABLE gravadora (
    codgravadora INT NOT NULL,
    nome VARCHAR(200) NOT NULL,
    homepage VARCHAR(300),

    numero INT,
    cep INT,

    CONSTRAINT pk_codgravadora PRIMARY KEY(codgravadora),
    CONSTRAINT fk_codendereco FOREIGN KEY(numero, cep)
        REFERENCES endereco(numero, cep) ON UPDATE CASCADE ON DELETE NO ACTION,
) ON spotper_fg01;

CREATE TABLE telefone (
    num INT NOT NULL,
    ddd INT NOT NULL,
    ddi INT,

    codgravadora INT NOT NULL,

    CONSTRAINT pk_codtelefone PRIMARY KEY(ddd, num),
    CONSTRAINT fk_telgravadora FOREIGN KEY(codgravadora)
        REFERENCES gravadora(codgravadora) ON UPDATE CASCADE ON DELETE CASCADE
) ON spotper_fg01;

CREATE TABLE album (
    codalbum INT NOT NULL,
    descricao VARCHAR(200) NOT NULL UNIQUE,
    dtgravacao DATETIME NOT NULL,
    dtcompra DATETIME NOT NULL,
    tipocompra VARCHAR(50),
    prcompra DEC(11, 2) NOT NULL,

    codgravadora INT NOT NULL,

    CONSTRAINT chk_dtcompra CHECK (dtcompra >= '2000-01-01'),
    CONSTRAINT chk_tipocompra CHECK (tipocompra = 'física' or tipocompra = 'download'),

    CONSTRAINT pk_codalbum PRIMARY KEY(codalbum),
    CONSTRAINT fk_codgravadora FOREIGN KEY(codgravadora) 
        REFERENCES gravadora(codgravadora) ON UPDATE CASCADE ON DELETE NO ACTION
) ON spotper_fg01;

CREATE TABLE tipoComposicao(
    cod INT NOT NULL,
    descricao VARCHAR(200) NOT NULL UNIQUE,

    CONSTRAINT pk_codtipocomposicao PRIMARY KEY(cod)
) ON spotper_fg01;

CREATE TABLE faixa (
    codfaixa INT NOT NULL,
    descricao VARCHAR(200) NOT NULL UNIQUE,
    numfaixa INT NOT NULL,
    tipogravacao VARCHAR(5),
    -- tempoexecucao in minute
    tempo TIME NOT NULL,

    codalbum INT NOT NULL,
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
    codperiodomusical INT NOT NULL,
    nome VARCHAR(30) NOT NULL UNIQUE,
    descricao VARCHAR(600) NOT NULL,
    dtinicio DATE,
    dtfim DATE,

    CONSTRAINT pk_codperiodomusical PRIMARY KEY(codperiodomusical)
) ON spotper_fg01;

CREATE TABLE compositor (
    codcompositor INT NOT NULL,
    nome VARCHAR(200) NOT NULL UNIQUE,
    dtnascimento DATE,
    dtmorte DATE,
    cidade VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,

    codperiodomusical INT NOT NULL,

    CONSTRAINT pk_codcompositor PRIMARY KEY(codcompositor),
    CONSTRAINT fk_codperiodomusical FOREIGN KEY(codperiodomusical)
        REFERENCES periodoMusical(codperiodomusical) ON UPDATE CASCADE ON DELETE NO ACTION
) ON spotper_fg01;

CREATE TABLE interprete (
    codinterprete INT NOT NULL,
    nome VARCHAR(200) NOT NULL,
    tipo VARCHAR(20) NOT NULL,

    CONSTRAINT pk_codinterprete PRIMARY KEY(codinterprete)
) ON spotper_fg01;

-- without tempototal column
CREATE TABLE playlist (
    codplaylist INT NOT NULL,
    nome VARCHAR(200) NOT NULL UNIQUE,
    dtnascimento DATETIME NOT NULL,

    CONSTRAINT fk_codplaylist PRIMARY KEY(codplaylist)
) ON spotper_fg02;

CREATE TABLE faixasNaPlaylist (
    codplaylist INT,
    codfaixaplaylist INT,
    contadorfaixatocada INT,
    dtultimaveztocada DATETIME

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
GO

-- Here are only the triggers, so we've put this "GO" before those statements

CREATE TRIGGER faixa_TR_tamanhoalbum ON faixa
AFTER INSERT, UPDATE
AS
IF EXISTS (
           SELECT f.codalbum FROM faixa f, inserted i 
           WHERE i.codalbum = f.codalbum 
           GROUP BY f.codalbum 
           HAVING COUNT(f.codalbum) > 64
          )
BEGIN
ROLLBACK TRANSACTION;
RETURN 
END;
GO

CREATE TRIGGER album_TR_prcompra ON album
AFTER INSERT, UPDATE
AS
IF EXISTS (
           SELECT i.prcompra FROM inserted i 
           GROUP BY i.prcompra
           HAVING i.prcompra > 3 * (SELECT AVG(a.prcompra) FROM album a, faixa f WHERE f.codalbum = a.codalbum
                                    AND (f.tipogravacao NOT IN ('ADD')))
          )
BEGIN
ROLLBACK TRANSACTION;
RETURN 
END;
GO

CREATE TRIGGER faixa_TR_barrocoDDD ON compostaPor
AFTER INSERT, UPDATE
AS
IF EXISTS (
           SELECT i.codfaixacompositor FROM inserted i, faixa f, periodoMusical p, compositor c
           WHERE i.codcompositor = c.codcompositor
           AND c.codperiodomusical = p.codperiodomusical AND i.codfaixacompositor = f.codfaixa 
           AND f.tipogravacao = 'ADD'
           AND p.codperiodomusical = 0
          )
BEGIN
ROLLBACK TRANSACTION;
RETURN 
END;
GO

--Function that receives as a parameter the name of a compositor and returns a table with his/hers album's
CREATE FUNCTION lista_de_albuns (
    @nome_compositor VARCHAR(200)
)
RETURNS TABLE
AS
RETURN
    SELECT 
        a.codalbum,
        a.descricao
    FROM
        album a,
        compostaPor cp,
        faixa f,
        compositor c
    WHERE
        c.nome = @nome_compositor AND
        c.codcompositor = cp.codcompositor AND
        cp.codfaixacompositor = f.codfaixa AND
        f.codalbum = a.codalbum
GO