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

INSERT INTO compositor VALUES (
    4,
    'Antonín Leopold Dvořák',
    '1841-9-8',
    '1904-5-1',
    'Nelahozeves',
    'República Checa',
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

INSERT INTO endereco VALUES (
    2840,
    60025200,
    'Brasil',
    'Ceará',
    'Fortaleza',
    'Rua Leandro Monteiro'
)

INSERT INTO endereco VALUES (
    1700,
    62960000,
    'Brasil',
    'Ceará',
    'Tabuleiro do Norte',
    'Rua Acelino Maia'
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

INSERT INTO gravadora(codgravadora, nome, numero, cep) VALUES (
    2,
    'B-Side Records',
    2840,
    60025200
)

INSERT INTO gravadora(codgravadora, nome, numero, cep) VALUES (
    3,
    'Som Nativo',
    1700,
    62960000
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

-- Dvorak
-- https://open.spotify.com/album/6freWjpwjgoXkdNNotgB52

-- SELECT * FROM album

SET DATEFORMAT ymd;

-- MOZART
INSERT INTO album VALUES (
    0,
    'Mozart: Violin Concert',
    '1950-4-22',
    '2006-5-1',
    'física',
    '150.00',
    0
)

INSERT INTO album VALUES (
    1,
    'Mozart: Complete Piano Sonata, Vol. 2',
    '1990-12-1',
    '2012-7-15',
    'download',
    '50.00',
    0
)

INSERT INTO album VALUES (
    2,
    'Relaxing Mozart',
    '1970-2-1',
    '2001-1-1',
    'física',
    '325.00',
    1
)

-- BEETHOVEN

INSERT INTO album VALUES (
    3,
    'Beethoven: Sonatas Nos. 1-6',
    '1978-9-19',
    '2003-6-3',
    'física',
    '325.00',
    1
)

INSERT INTO album VALUES (
    4,
    'Relaxing with Beethoven',
    '1988-10-23',
    '2017-6-4',
    'física',
    '283.99',
    2
)

-- SEBASTIAN BACH

INSERT INTO album VALUES (
    5,
    'Bach: Partitas for Keyboard',
    '1958-5-23',
    '2013-6-12',
    'física',
    '283.99',
    2
)

INSERT INTO album VALUES (
    6,
    'Paul Tortelier Plays Bach',
    '1998-10-23',
    '2015-3-23',
    'física',
    '75.00',
    3
)

-- TCHAIKOVSKI

INSERT INTO album VALUES (
    7,
    'Tchaikovski: Greatest music',
    '2002-11-3',
    '2013-4-5',
    'download',
    '42.00',
    3
)

-- Dvorak album

INSERT INTO album VALUES (
    8,
    'Rusalka',
    '2013-01-01',
    '2019-02-16',
    'Download',
    68.00,
    1
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

INSERT INTO telefone VALUES (
    32258997,
    85,
    55,
    2
)

INSERT INTO telefone VALUES (
    32243327,
    88,
    55,
    3
)

INSERT INTO tipoComposicao VALUES (
    0,
    'Concerto'
)

INSERT INTO tipoComposicao VALUES (
    1,
    'Sonata'
)

INSERT INTO tipoComposicao VALUES (
    2,
    'Serenata'
)

INSERT INTO tipoComposicao VALUES (
    3,
    'Ópera'
)

INSERT INTO tipoComposicao VALUES (
    4,
    'Sinfonia'
)

INSERT INTO interprete(codinterprete, nome, tipo) VALUES (
    0,
    'Orquestra Sinfônica da Universidade Federal do Ceará',
    'Orquestra'
)


INSERT INTO interprete(codinterprete, nome, tipo) VALUES (
    1,
    'Trio Cordas Vivas',
    'Trio'
)


INSERT INTO interprete(codinterprete, nome, tipo) VALUES (
    2,
    'Quarteto Sereneta',
    'Quarteto'
)


INSERT INTO interprete(codinterprete, nome, tipo) VALUES (
    3,
    'Orquestra Sinfônica Brasileira',
    'Orquestra'
)


INSERT INTO interprete(codinterprete, nome, tipo) VALUES (
    4,
    'Quarteto La Noche',
    'Quarteto'
)



INSERT INTO compostaPor VALUES (0, 0)
INSERT INTO compostaPor VALUES (0, 1)
INSERT INTO compostaPor VALUES (0, 2)
INSERT INTO compostaPor VALUES (0, 3)
INSERT INTO compostaPor VALUES (0, 4)
INSERT INTO compostaPor VALUES (0, 5)
INSERT INTO compostaPor VALUES (0, 6)
INSERT INTO compostaPor VALUES (0, 7)
INSERT INTO compostaPor VALUES (0, 8)
INSERT INTO compostaPor VALUES (0, 9)
INSERT INTO compostaPor VALUES (0, 10)
INSERT INTO compostaPor VALUES (0, 11)
INSERT INTO compostaPor VALUES (0, 12)
INSERT INTO compostaPor VALUES (0, 13)
INSERT INTO compostaPor VALUES (0, 14)

INSERT INTO compostaPor VALUES (0, 15)
INSERT INTO compostaPor VALUES (0, 16)
INSERT INTO compostaPor VALUES (0, 17)
INSERT INTO compostaPor VALUES (0, 18)
INSERT INTO compostaPor VALUES (0, 19)
INSERT INTO compostaPor VALUES (0, 20)
INSERT INTO compostaPor VALUES (0, 21)
INSERT INTO compostaPor VALUES (0, 22)
INSERT INTO compostaPor VALUES (0, 23)
INSERT INTO compostaPor VALUES (0, 24)
INSERT INTO compostaPor VALUES (0, 25)
INSERT INTO compostaPor VALUES (0, 26)

INSERT INTO compostaPor VALUES (0, 27)
INSERT INTO compostaPor VALUES (0, 28)
INSERT INTO compostaPor VALUES (0, 29)
INSERT INTO compostaPor VALUES (0, 30)
INSERT INTO compostaPor VALUES (0, 31)
INSERT INTO compostaPor VALUES (0, 32)
INSERT INTO compostaPor VALUES (0, 33)
INSERT INTO compostaPor VALUES (0, 34)
INSERT INTO compostaPor VALUES (0, 35)
INSERT INTO compostaPor VALUES (0, 36)
INSERT INTO compostaPor VALUES (0, 37)
INSERT INTO compostaPor VALUES (0, 38)
INSERT INTO compostaPor VALUES (0, 39)
INSERT INTO compostaPor VALUES (0, 40)
INSERT INTO compostaPor VALUES (0, 41)
INSERT INTO compostaPor VALUES (0, 42)
INSERT INTO compostaPor VALUES (0, 43)
INSERT INTO compostaPor VALUES (0, 44)
INSERT INTO compostaPor VALUES (0, 45)
INSERT INTO compostaPor VALUES (0, 46)

INSERT INTO compostaPor VALUES (2, 47)
INSERT INTO compostaPor VALUES (2, 48)
INSERT INTO compostaPor VALUES (2, 49)
INSERT INTO compostaPor VALUES (2, 50)
INSERT INTO compostaPor VALUES (2, 51)
INSERT INTO compostaPor VALUES (2, 52)
INSERT INTO compostaPor VALUES (2, 53)
INSERT INTO compostaPor VALUES (2, 54)
INSERT INTO compostaPor VALUES (2, 55)
INSERT INTO compostaPor VALUES (2, 56)
INSERT INTO compostaPor VALUES (2, 57)
INSERT INTO compostaPor VALUES (2, 58)
INSERT INTO compostaPor VALUES (2, 59)
INSERT INTO compostaPor VALUES (2, 60)
INSERT INTO compostaPor VALUES (2, 61)
INSERT INTO compostaPor VALUES (2, 62)
INSERT INTO compostaPor VALUES (2, 63)
INSERT INTO compostaPor VALUES (2, 64)
INSERT INTO compostaPor VALUES (2, 65)
INSERT INTO compostaPor VALUES (2, 66)
INSERT INTO compostaPor VALUES (2, 67)
INSERT INTO compostaPor VALUES (2, 68)

INSERT INTO compostaPor VALUES (2, 69)
INSERT INTO compostaPor VALUES (2, 70)
INSERT INTO compostaPor VALUES (2, 71)
INSERT INTO compostaPor VALUES (2, 72)
INSERT INTO compostaPor VALUES (2, 73)
INSERT INTO compostaPor VALUES (2, 74)
INSERT INTO compostaPor VALUES (2, 75)
INSERT INTO compostaPor VALUES (2, 76)
INSERT INTO compostaPor VALUES (2, 77)
INSERT INTO compostaPor VALUES (2, 78)
INSERT INTO compostaPor VALUES (2, 79)
INSERT INTO compostaPor VALUES (2, 80)
INSERT INTO compostaPor VALUES (2, 81)
INSERT INTO compostaPor VALUES (2, 82)
INSERT INTO compostaPor VALUES (2, 83)
INSERT INTO compostaPor VALUES (2, 84)
INSERT INTO compostaPor VALUES (2, 85)
INSERT INTO compostaPor VALUES (2, 86)
INSERT INTO compostaPor VALUES (2, 87)
INSERT INTO compostaPor VALUES (2, 88)
INSERT INTO compostaPor VALUES (2, 89)
INSERT INTO compostaPor VALUES (2, 90)
INSERT INTO compostaPor VALUES (2, 91)
INSERT INTO compostaPor VALUES (2, 92)
INSERT INTO compostaPor VALUES (2, 93)
INSERT INTO compostaPor VALUES (2, 94)
INSERT INTO compostaPor VALUES (2, 95)
INSERT INTO compostaPor VALUES (2, 96)
INSERT INTO compostaPor VALUES (2, 97)
INSERT INTO compostaPor VALUES (2, 98)

INSERT INTO compostaPor VALUES (1, 99)
INSERT INTO compostaPor VALUES (1, 100)
INSERT INTO compostaPor VALUES (1, 101)
INSERT INTO compostaPor VALUES (1, 102)
INSERT INTO compostaPor VALUES (1, 103)
INSERT INTO compostaPor VALUES (1, 104)
INSERT INTO compostaPor VALUES (1, 105)
INSERT INTO compostaPor VALUES (1, 106)
INSERT INTO compostaPor VALUES (1, 107)
INSERT INTO compostaPor VALUES (1, 108)
INSERT INTO compostaPor VALUES (1, 109)
INSERT INTO compostaPor VALUES (1, 110)
INSERT INTO compostaPor VALUES (1, 111)
INSERT INTO compostaPor VALUES (1, 112)
INSERT INTO compostaPor VALUES (1, 113)
INSERT INTO compostaPor VALUES (1, 114)
INSERT INTO compostaPor VALUES (1, 115)
INSERT INTO compostaPor VALUES (1, 116)
INSERT INTO compostaPor VALUES (1, 117)
INSERT INTO compostaPor VALUES (1, 118)
INSERT INTO compostaPor VALUES (1, 119)
INSERT INTO compostaPor VALUES (1, 120)
INSERT INTO compostaPor VALUES (1, 121)
INSERT INTO compostaPor VALUES (1, 122)
INSERT INTO compostaPor VALUES (1, 123)
INSERT INTO compostaPor VALUES (1, 124)
INSERT INTO compostaPor VALUES (1, 125)
INSERT INTO compostaPor VALUES (1, 126)
INSERT INTO compostaPor VALUES (1, 127)
INSERT INTO compostaPor VALUES (1, 128)
INSERT INTO compostaPor VALUES (1, 129)
INSERT INTO compostaPor VALUES (1, 130)
INSERT INTO compostaPor VALUES (1, 131)
INSERT INTO compostaPor VALUES (1, 132)
INSERT INTO compostaPor VALUES (1, 133)
INSERT INTO compostaPor VALUES (1, 134)
INSERT INTO compostaPor VALUES (1, 135)
INSERT INTO compostaPor VALUES (1, 136)
INSERT INTO compostaPor VALUES (1, 137)
INSERT INTO compostaPor VALUES (1, 138)

INSERT INTO compostaPor VALUES (1, 139)
INSERT INTO compostaPor VALUES (1, 140)
INSERT INTO compostaPor VALUES (1, 141)
INSERT INTO compostaPor VALUES (1, 142)
INSERT INTO compostaPor VALUES (1, 143)
INSERT INTO compostaPor VALUES (1, 144)
INSERT INTO compostaPor VALUES (1, 145)
INSERT INTO compostaPor VALUES (1, 146)
INSERT INTO compostaPor VALUES (1, 147)
INSERT INTO compostaPor VALUES (1, 148)
INSERT INTO compostaPor VALUES (1, 149)
INSERT INTO compostaPor VALUES (1, 150)
INSERT INTO compostaPor VALUES (1, 151)
INSERT INTO compostaPor VALUES (1, 152)
INSERT INTO compostaPor VALUES (1, 153)
INSERT INTO compostaPor VALUES (1, 154)
INSERT INTO compostaPor VALUES (1, 155)
INSERT INTO compostaPor VALUES (1, 156)
INSERT INTO compostaPor VALUES (1, 157)
INSERT INTO compostaPor VALUES (1, 158)
INSERT INTO compostaPor VALUES (1, 159)
INSERT INTO compostaPor VALUES (1, 160)
INSERT INTO compostaPor VALUES (1, 161)
INSERT INTO compostaPor VALUES (1, 162)
INSERT INTO compostaPor VALUES (1, 163)

INSERT INTO compostaPor VALUES (3, 164)
INSERT INTO compostaPor VALUES (3, 165)
INSERT INTO compostaPor VALUES (3, 166)
INSERT INTO compostaPor VALUES (3, 167)
INSERT INTO compostaPor VALUES (3, 168)
INSERT INTO compostaPor VALUES (3, 169)

INSERT INTO compostaPor VALUES (4, 170)
INSERT INTO compostaPor VALUES (4, 171)
INSERT INTO compostaPor VALUES (4, 172)
INSERT INTO compostaPor VALUES (4, 173)
INSERT INTO compostaPor VALUES (4, 174)
INSERT INTO compostaPor VALUES (4, 175)
INSERT INTO compostaPor VALUES (4, 176)
INSERT INTO compostaPor VALUES (4, 177)





INSERT INTO interpretadoPor VALUES (0, 0)
INSERT INTO interpretadoPor VALUES (0, 1)
INSERT INTO interpretadoPor VALUES (0, 2)
INSERT INTO interpretadoPor VALUES (0, 3)
INSERT INTO interpretadoPor VALUES (0, 4)
INSERT INTO interpretadoPor VALUES (0, 5)
INSERT INTO interpretadoPor VALUES (0, 6)
INSERT INTO interpretadoPor VALUES (0, 7)
INSERT INTO interpretadoPor VALUES (0, 8)
INSERT INTO interpretadoPor VALUES (0, 9)
INSERT INTO interpretadoPor VALUES (0, 10)
INSERT INTO interpretadoPor VALUES (0, 11)
INSERT INTO interpretadoPor VALUES (0, 12)
INSERT INTO interpretadoPor VALUES (0, 13)
INSERT INTO interpretadoPor VALUES (0, 14)

INSERT INTO interpretadoPor VALUES (0, 15)
INSERT INTO interpretadoPor VALUES (0, 16)
INSERT INTO interpretadoPor VALUES (0, 17)
INSERT INTO interpretadoPor VALUES (0, 18)
INSERT INTO interpretadoPor VALUES (0, 19)
INSERT INTO interpretadoPor VALUES (0, 20)
INSERT INTO interpretadoPor VALUES (0, 21)
INSERT INTO interpretadoPor VALUES (0, 22)
INSERT INTO interpretadoPor VALUES (0, 23)
INSERT INTO interpretadoPor VALUES (0, 24)
INSERT INTO interpretadoPor VALUES (0, 25)
INSERT INTO interpretadoPor VALUES (0, 26)

INSERT INTO interpretadoPor VALUES (1, 27)
INSERT INTO interpretadoPor VALUES (1, 28)
INSERT INTO interpretadoPor VALUES (1, 29)
INSERT INTO interpretadoPor VALUES (1, 30)
INSERT INTO interpretadoPor VALUES (1, 31)
INSERT INTO interpretadoPor VALUES (1, 32)
INSERT INTO interpretadoPor VALUES (1, 33)
INSERT INTO interpretadoPor VALUES (1, 34)
INSERT INTO interpretadoPor VALUES (1, 35)
INSERT INTO interpretadoPor VALUES (1, 36)
INSERT INTO interpretadoPor VALUES (1, 37)
INSERT INTO interpretadoPor VALUES (1, 38)
INSERT INTO interpretadoPor VALUES (1, 39)
INSERT INTO interpretadoPor VALUES (1, 40)
INSERT INTO interpretadoPor VALUES (1, 41)
INSERT INTO interpretadoPor VALUES (1, 42)
INSERT INTO interpretadoPor VALUES (1, 43)
INSERT INTO interpretadoPor VALUES (1, 44)
INSERT INTO interpretadoPor VALUES (1, 45)
INSERT INTO interpretadoPor VALUES (1, 46)

INSERT INTO interpretadoPor VALUES (2, 47)
INSERT INTO interpretadoPor VALUES (2, 48)
INSERT INTO interpretadoPor VALUES (2, 49)
INSERT INTO interpretadoPor VALUES (2, 50)
INSERT INTO interpretadoPor VALUES (2, 51)
INSERT INTO interpretadoPor VALUES (2, 52)
INSERT INTO interpretadoPor VALUES (2, 53)
INSERT INTO interpretadoPor VALUES (2, 54)
INSERT INTO interpretadoPor VALUES (2, 55)
INSERT INTO interpretadoPor VALUES (2, 56)
INSERT INTO interpretadoPor VALUES (2, 57)
INSERT INTO interpretadoPor VALUES (2, 58)
INSERT INTO interpretadoPor VALUES (2, 59)
INSERT INTO interpretadoPor VALUES (2, 60)
INSERT INTO interpretadoPor VALUES (2, 61)
INSERT INTO interpretadoPor VALUES (2, 62)
INSERT INTO interpretadoPor VALUES (2, 63)
INSERT INTO interpretadoPor VALUES (2, 64)
INSERT INTO interpretadoPor VALUES (2, 65)
INSERT INTO interpretadoPor VALUES (2, 66)
INSERT INTO interpretadoPor VALUES (2, 67)
INSERT INTO interpretadoPor VALUES (2, 68)

INSERT INTO interpretadoPor VALUES (2, 69)
INSERT INTO interpretadoPor VALUES (2, 70)
INSERT INTO interpretadoPor VALUES (2, 71)
INSERT INTO interpretadoPor VALUES (2, 72)
INSERT INTO interpretadoPor VALUES (2, 73)
INSERT INTO interpretadoPor VALUES (2, 74)
INSERT INTO interpretadoPor VALUES (2, 75)
INSERT INTO interpretadoPor VALUES (2, 76)
INSERT INTO interpretadoPor VALUES (2, 77)
INSERT INTO interpretadoPor VALUES (2, 78)
INSERT INTO interpretadoPor VALUES (2, 79)
INSERT INTO interpretadoPor VALUES (2, 80)
INSERT INTO interpretadoPor VALUES (2, 81)
INSERT INTO interpretadoPor VALUES (2, 82)
INSERT INTO interpretadoPor VALUES (2, 83)
INSERT INTO interpretadoPor VALUES (2, 84)
INSERT INTO interpretadoPor VALUES (2, 85)
INSERT INTO interpretadoPor VALUES (2, 86)
INSERT INTO interpretadoPor VALUES (2, 87)
INSERT INTO interpretadoPor VALUES (2, 88)
INSERT INTO interpretadoPor VALUES (2, 89)
INSERT INTO interpretadoPor VALUES (2, 90)
INSERT INTO interpretadoPor VALUES (2, 91)
INSERT INTO interpretadoPor VALUES (2, 92)
INSERT INTO interpretadoPor VALUES (2, 93)
INSERT INTO interpretadoPor VALUES (2, 94)
INSERT INTO interpretadoPor VALUES (2, 95)
INSERT INTO interpretadoPor VALUES (2, 96)
INSERT INTO interpretadoPor VALUES (2, 97)
INSERT INTO interpretadoPor VALUES (2, 98)

INSERT INTO interpretadoPor VALUES (3, 99)
INSERT INTO interpretadoPor VALUES (3, 100)
INSERT INTO interpretadoPor VALUES (3, 101)
INSERT INTO interpretadoPor VALUES (3, 102)
INSERT INTO interpretadoPor VALUES (3, 103)
INSERT INTO interpretadoPor VALUES (3, 104)
INSERT INTO interpretadoPor VALUES (3, 105)
INSERT INTO interpretadoPor VALUES (3, 106)
INSERT INTO interpretadoPor VALUES (3, 107)
INSERT INTO interpretadoPor VALUES (3, 108)
INSERT INTO interpretadoPor VALUES (3, 109)
INSERT INTO interpretadoPor VALUES (3, 110)
INSERT INTO interpretadoPor VALUES (3, 111)
INSERT INTO interpretadoPor VALUES (3, 112)
INSERT INTO interpretadoPor VALUES (3, 113)
INSERT INTO interpretadoPor VALUES (3, 114)
INSERT INTO interpretadoPor VALUES (3, 115)
INSERT INTO interpretadoPor VALUES (3, 116)
INSERT INTO interpretadoPor VALUES (3, 117)
INSERT INTO interpretadoPor VALUES (3, 118)
INSERT INTO interpretadoPor VALUES (3, 119)
INSERT INTO interpretadoPor VALUES (3, 120)
INSERT INTO interpretadoPor VALUES (3, 121)
INSERT INTO interpretadoPor VALUES (3, 122)
INSERT INTO interpretadoPor VALUES (3, 123)
INSERT INTO interpretadoPor VALUES (3, 124)
INSERT INTO interpretadoPor VALUES (3, 125)
INSERT INTO interpretadoPor VALUES (3, 126)
INSERT INTO interpretadoPor VALUES (3, 127)
INSERT INTO interpretadoPor VALUES (3, 128)
INSERT INTO interpretadoPor VALUES (3, 129)
INSERT INTO interpretadoPor VALUES (3, 130)
INSERT INTO interpretadoPor VALUES (3, 131)
INSERT INTO interpretadoPor VALUES (3, 132)
INSERT INTO interpretadoPor VALUES (3, 133)
INSERT INTO interpretadoPor VALUES (3, 134)
INSERT INTO interpretadoPor VALUES (3, 135)
INSERT INTO interpretadoPor VALUES (3, 136)
INSERT INTO interpretadoPor VALUES (3, 137)
INSERT INTO interpretadoPor VALUES (3, 138)

INSERT INTO interpretadoPor VALUES (0, 139)
INSERT INTO interpretadoPor VALUES (0, 140)
INSERT INTO interpretadoPor VALUES (0, 141)
INSERT INTO interpretadoPor VALUES (0, 142)
INSERT INTO interpretadoPor VALUES (0, 143)
INSERT INTO interpretadoPor VALUES (0, 144)
INSERT INTO interpretadoPor VALUES (0, 145)
INSERT INTO interpretadoPor VALUES (0, 146)
INSERT INTO interpretadoPor VALUES (0, 147)
INSERT INTO interpretadoPor VALUES (0, 148)
INSERT INTO interpretadoPor VALUES (0, 149)
INSERT INTO interpretadoPor VALUES (0, 150)
INSERT INTO interpretadoPor VALUES (0, 151)
INSERT INTO interpretadoPor VALUES (0, 152)
INSERT INTO interpretadoPor VALUES (0, 153)
INSERT INTO interpretadoPor VALUES (0, 154)
INSERT INTO interpretadoPor VALUES (0, 155)
INSERT INTO interpretadoPor VALUES (0, 156)
INSERT INTO interpretadoPor VALUES (0, 157)
INSERT INTO interpretadoPor VALUES (0, 158)
INSERT INTO interpretadoPor VALUES (0, 159)
INSERT INTO interpretadoPor VALUES (0, 160)
INSERT INTO interpretadoPor VALUES (0, 161)
INSERT INTO interpretadoPor VALUES (0, 162)
INSERT INTO interpretadoPor VALUES (0, 163)

INSERT INTO interpretadoPor VALUES (3, 164)
INSERT INTO interpretadoPor VALUES (3, 165)
INSERT INTO interpretadoPor VALUES (3, 166)
INSERT INTO interpretadoPor VALUES (3, 167)
INSERT INTO interpretadoPor VALUES (3, 168)
INSERT INTO interpretadoPor VALUES (3, 169)

INSERT INTO interpretadoPor VALUES (4, 170)
INSERT INTO interpretadoPor VALUES (4, 171)
INSERT INTO interpretadoPor VALUES (4, 172)
INSERT INTO interpretadoPor VALUES (4, 173)
INSERT INTO interpretadoPor VALUES (4, 174)
INSERT INTO interpretadoPor VALUES (4, 175)
INSERT INTO interpretadoPor VALUES (4, 176)
INSERT INTO interpretadoPor VALUES (4, 177)

SELECT COUNT(*) FROM faixa;
