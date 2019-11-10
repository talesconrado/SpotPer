USE spotper;

INSERT INTO periodoMusical VALUES (
    0,
    'Período Barroco',
    'A música barroca caracteriza-se pelo uso de complexos contrapontos tonais e pelo uso de uma linha contínua de baixo. Os inícios da forma sonata foram estabelecidos na canzona, bem como uma noção mais formal de tema e variações. As tonalidades maior e menor também tomaram forma como meio de administrar a dissonância e o cromatismo na música.',
    '1600-1-1',
    '1750-12-31'
);

INSERT INTO periodoMusical VALUES (
    1,
    'Período Clássico',
    'O período clássico estabeleceu muitas das normas de composição, apresentação e estilo do gênero. Foi durante este período que o piano se tornou o principal instrumento de teclado. As forças básicas necessárias para uma orquestra tornaram-se razoavelmente padronizadas. A música de câmara cresceu e passou a abranger grupos com 8 ou até 10 músicos, em serenatas.',
    '1751-1-1',
    '1820-12-31'
)

INSERT INTO periodoMusical VALUES (
    2,
    'Período Romântico',
    'A música do período romântico caracterizou-se por uma atenção cada vez maior a uma linha melódica extensa, assim como elementos expressivos e emotivos, paralelando o Romantismo nas outras formas de arte. As formas musicais começaram a se distanciar dos moldes usados na era clássica, e surgem peças em forma livre como noturnos, fantasias e prelúdios, ao mesmo tempo em que as ideias preconcebidas a respeito da exposição e do desenvolvimento destes temas passaram a ser minimizadas ou mesmo ignoradas.',
    '1801-1-1',
    '1910-1-1'
)

INSERT INTO periodoMusical VALUES (
    3,
    'Período Moderno',
    'O modernismo marcou um período no qual diversos compositores rejeitaram determinados valores do período da prática comum, tais como a tonalidade, a melodia, a instrumentação e a estrutura tradicionais.',
    '1905-1-1',
    '1985-12-31'
)

INSERT INTO periodoMusical VALUES (
    4,
    'Período Contemporâneo',
    'Descreve a música composta no fim do século XX até os dias de hoje e incluí a música eletrônica de vanguarda, música eletroacústica, a música concreta francesa, neo romantismo, minimalismo, entre outros.',
    '1985-1-1',
    '2020-1-1'
)

INSERT INTO compositor VALUES (
    0,
    'Wolfgang Amadeus Mozart',
    '1756-1-27',
    '1791-12-5',
    'Salzburgo',
    'Áustria',
    1
)

INSERT INTO compositor VALUES (
    1,
    'Johann Sebastian Bach',
    '1685-3-21',
    '1750-7-28',
    'Eisenach',
    'Alemanha',
    0
)

INSERT INTO compositor VALUES (
    2,
    'Ludwig van Beethoven',
    '1770-12-17',
    '1827-3-26',
    'Bonn',
    'Alemanha',
    2
)

INSERT INTO compositor VALUES (
    3,
    'Piotr Ilitch Tchaikovski',
    '1840-4-7',
    '1893-11-6',
    'Vótkinsk',
    'Rússia',
    2
)

INSERT INTO endereco VALUES (
    930,
    60130240,
    'Brasil',
    'Ceará',
    'Fortaleza',
    'Avenidade Pontes Vieira'
)

INSERT INTO endereco VALUES (
    1095,
    60040531,
    'Brasil',
    'Ceará',
    'Fortaleza',
    'Avenida 13 de maio'
)

INSERT INTO gravadora(codgravadora, nome, numero, cep) VALUES (
    0,
    'Warner Gravadora',
    930,
    60130240
)

INSERT INTO gravadora(codgravadora, nome, numero, cep) VALUES (
    1,
    'Sony Gravadora',
    1095,
    60040531
)

-- Mozart albuns
-- https://open.spotify.com/album/4l0dRfhz6FZSrEOlnfNq3h
-- https://open.spotify.com/album/4yywO9RIlL1NsT9AVOG7r0
-- https://open.spotify.com/album/47SN5fe97gGEblJqL32WKe

-- Beethoven
-- https://open.spotify.com/album/5XOT8KiKHy405Z5Uf5VwVj
-- https://open.spotify.com/album/4nKCPoaxAFanMFSzFeVreP

-- Sebastian Bach
-- https://open.spotify.com/album/2OKj6FEtRuIDHz5PHv0MIR
-- https://open.spotify.com/album/5vuP6ZGg27ezfIIl7nUccS

-- Tchaikovski
-- https://open.spotify.com/playlist/5ixwqCCuS60iFLIUdCp9kg

-- SELECT * FROM album

SET DATEFORMAT ymd;

-- MOZART
INSERT INTO album(codalbum, descricao, dtgravacao, dtcompra, tipocompra, prcompra, codgravadora) VALUES (
    0,
    'Mozart: Violin Concert',
    '1950-4-22',
    '2006-5-1',
    'CD',
    '150.00',
    0
)

INSERT INTO album VALUES (
    1,
    'Mozart: Complete Piano Sonata, Vol. 2',
    '1990-12-1',
    '2012-7-15',
    'Download',
    '50.00',
    0
)

INSERT INTO album VALUES (
    2,
    'Relaxing Mozart',
    '1970-2-1',
    '2001-1-1',
    'Vinil',
    '325.00',
    0
)

-- BEETHOVEN

INSERT INTO album VALUES (
    3,
    'Beethoven: Sonatas Nos. 1-6',
    '1978-9-19',
    '2003-6-3',
    'CD',
    '325.00',
    0
)

INSERT INTO album VALUES (
    4,
    'Relaxing with Beethoven',
    '1988-10-23',
    '2017-6-4',
    'Vinil',
    '283.99',
    1
)

-- SEBASTIAN BACH

INSERT INTO album VALUES (
    5,
    'Bach: Partitas for Keyboard',
    '1958-5-23',
    '2013-6-12',
    'Vinil',
    '283.99',
    1
)

INSERT INTO album VALUES (
    6,
    'Paul Tortelier Plays Bach',
    '1998-10-23',
    '2015-3-23',
    'CD',
    '75.00',
    1
)

-- TCHAIKOVSKI

INSERT INTO album VALUES (
    7,
    'Tchaikovski: Greatest music',
    '2002-11-3',
    '2013-4-5',
    'Download',
    '42.00',
    0
)

INSERT INTO telefone VALUES (
    32112233,
    85,
    55,
    0
)

INSERT INTO telefone VALUES (
    32112332,
    85,
    55,
    0
)

INSERT INTO telefone VALUES (
    32726688,
    85,
    55,
    1
)

INSERT INTO telefone VALUES (
    32728899,
    85,
    55,
    1
)