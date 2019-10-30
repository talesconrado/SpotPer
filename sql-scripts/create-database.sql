-- Remove "--" if database spotper doesn't exist
-- CREATE DATABASE spotper;

-- Remove "--" if database spotper has not been selected
-- USE spotper;

CREATE TABLE endereco (
    numero INT,
    cep INT,
    pais VARCHAR(50),
    estado VARCHAR(50),
    cidade VARCHAR(50),
    rua VARCHAR(150),

    CONSTRAINT pk_codendereco PRIMARY KEY (numero, cep)
);

CREATE TABLE gravadora (
    codgravadora INT,
    nome VARCHAR(200),
    homepage VARCHAR(300),

    numero INT,
    cep INT,

    CONSTRAINT pk_codgravadora PRIMARY KEY(codgravadora),
    CONSTRAINT fk_codendereco FOREIGN KEY(numero, cep)
        REFERENCES endereco(numero, cep) ON UPDATE CASCADE ON DELETE NO ACTION,
);

CREATE TABLE telefone (
    num INT,
    ddd INT,
    ddi INT,

    codgravadora INT,

    CONSTRAINT pk_codtelefone PRIMARY KEY(ddd, num),
    CONSTRAINT fk_telgravadora FOREIGN KEY(codgravadora)
        REFERENCES gravadora(codgravadora) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE album (
    codalbum INT,
    descricao VARCHAR(200),
    dtgravacao DATETIME,
    dtcompra DATETIME CHECK (dtcompra >= '2000-01-01'),
    tipocompra VARCHAR(50),
    prcompra DEC(11, 2),

    codgravadora INT,

    CONSTRAINT pk_codalbum PRIMARY KEY(codalbum),
    CONSTRAINT fk_codgravadora FOREIGN KEY(codgravadora) 
        REFERENCES gravadora(codgravadora) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE tipoComposicao(
    cod INT,
    descricao VARCHAR(200),

    CONSTRAINT pk_codtipocomposicao PRIMARY KEY(cod)
);

CREATE TABLE faixa (
    codfaixa INT,
    descricao VARCHAR(200),
    numfaixa INT,
    tipogravacao VARCHAR(5) CHECK (tipogravacao = 'ADD' or tipogravacao = 'DDD'),
    -- tempoexecucao in minute
    tempo DEC(8, 2),

    codalbum INT,
    codtipocomposicao INT,

    CONSTRAINT pk_codfaixa PRIMARY KEY(codfaixa),
    CONSTRAINT fk_codalbum FOREIGN KEY(codalbum)
        REFERENCES album(codalbum),
    CONSTRAINT fk_codtipocomposicao FOREIGN KEY(codtipocomposicao)
        REFERENCES tipoComposicao(cod)
);

CREATE TABLE periodoMusical (
    codperiodomusical INT,
    descricao VARCHAR(200),
    dtinicio DATE,
    dtfim DATE,

    CONSTRAINT pk_codperiodomusical PRIMARY KEY(codperiodomusical)
);

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
);

CREATE TABLE interprete (
    codinterprete INT,
    nome VARCHAR(200),
    tipo VARCHAR(20),

    CONSTRAINT pk_codinterprete PRIMARY KEY(codinterprete)
);

-- without tempototal column
CREATE TABLE playlist (
    codplaylist INT,
    nome VARCHAR(200),
    dtnascimento DATETIME,

    CONSTRAINT fk_codplaylist PRIMARY KEY(codplaylist)
);

CREATE TABLE faixasNaPlaylist (
    codplaylist INT,
    codfaixaplaylist INT,

    CONSTRAINT fk_fnpcodplaylist FOREIGN KEY(codplaylist)
        REFERENCES playlist(codplaylist) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_codfaixaplaylist FOREIGN KEY(codfaixaplaylist)
        REFERENCES faixa(codfaixa) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE interpretadoPor (
    codinterprete INT,
    codfaixainterprete INT,

    CONSTRAINT fk_codinterprete FOREIGN KEY(codinterprete)
        REFERENCES interprete(codinterprete) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_codfaixainterprete FOREIGN KEY(codfaixainterprete)
        REFERENCES faixa(codfaixa) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE compostaPor (
    codcompositor INT,
    codfaixacompositor INT,

    CONSTRAINT fk_codcompositor FOREIGN KEY(codcompositor)
        REFERENCES compositor(codcompositor) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT fk_codfaixacompositor FOREIGN KEY(codfaixacompositor)
        REFERENCES faixa(codfaixa) ON UPDATE CASCADE ON DELETE CASCADE
);
