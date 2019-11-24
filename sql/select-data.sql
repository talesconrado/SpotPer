SELECT * FROM compositor;

SELECT * FROM album;

SELECT * FROM endereco

SELECT * FROM periodoMusical

SELECT * FROM telefone

SELECT * FROM tipoComposicao

SELECT descricao FROM faixa WHERE descricao='Violin Concerto No.4 in D, K.218: 2. Andante cantabile'

SELECT * FROM album;

SELECT * FROM faixa;

SELECT MAX(codfaixa) FROM faixa;

SELECT * FROM compostaPor;

SELECT f.codfaixa, f.descricao, f.tipogravacao, f.tempo, c.nome AS 'compositor', tc.descricao AS 'tipo'
FROM faixa f, compositor c, compostaPor cp, tipoComposicao tc 
WHERE f.codfaixa = cp.codfaixacompositor AND c.codcompositor = cp.codcompositor AND c.nome LIKE 'Wo%' AND f.codtipocomposicao = tc.cod

SELECT f.codfaixa, f.descricao, f.tipogravacao, f.tempo, c.nome, tc.descricao 
FROM faixa f, tipoComposicao tc, compositor c, compostaPor
WHERE f.codtipocomposicao = tc.cod AND tc.descricao = 'ópera' AND f.codfaixa = compostaPor.codfaixacompositor AND c.codcompositor = compostaPor.codcompositor

SELECT pl.codplaylist, f.codfaixa, f.descricao AS 'musica', f.tipogravacao, f.tempo, f.codalbum, c.codcompositor,
c.nome AS 'compositor', tc.descricao AS 'periodo musical'
FROM playlist pl, faixasNaPlaylist fnp, faixa f, compostaPor cp, compositor c, tipoComposicao tc
WHERE pl.codplaylist = fnp.codplaylist AND fnp.codfaixaplaylist = f.codfaixa AND f.codfaixa = cp.codfaixacompositor
AND cp.codcompositor = c.codcompositor AND f.codtipocomposicao = tc.cod;

-- 60933cc2-132c-4fa6-8efb-b07e9fdd7985
-- f5f48044-bce8-4c46-8912-c27f7069bf55

SELECT f.codfaixa, f.descricao AS 'musica', f.tipogravacao, f.tempo, f.codalbum, c.codcompositor,
c.nome AS 'compositor', tc.descricao AS 'periodoMusical'
FROM playlist pl, faixasNaPlaylist fnp, faixa f, compostaPor cp, compositor c, tipoComposicao tc
WHERE pl.codplaylist = fnp.codplaylist AND fnp.codfaixaplaylist = f.codfaixa AND f.codfaixa = cp.codfaixacompositor
AND cp.codcompositor = c.codcompositor AND f.codtipocomposicao = tc.cod
-- AND pl.codplaylist = '60933CC2-132C-4FA6-8EFB-B07E9FDD7985';

SELECT SUM(CONVERT(DEC(11, 2), DATEDIFF(second, '00:00:00', f.tempo)/60.0))
FROM playlist pl, faixasNaPlaylist fnp, faixa f
WHERE pl.codplaylist = fnp.codplaylist AND fnp.codfaixaplaylist = f.codfaixa

SELECT * FROM gravadora;
SELECT * FROM album;
SELECT COUNT(*) FROM faixa

SELECT * FROM faixa f, album a, gravadora g 
WHERE f.codalbum = a.codalbum AND a.codgravadora = g.codgravadora AND g.nome LIKE 'Warner%';

SELECT f.codfaixa, f.descricao, f.tipogravacao, f.tempo, a.descricao AS 'album', g.nome AS 'gravadora' 
FROM faixa f, album a, gravadora g 
WHERE f.codalbum = a.codalbum AND a.codgravadora = g.codgravadora AND g.nome LIKE 'Sony%';

SELECT * FROM album WHERE prcompra BETWEEN 100 AND 325;
INSERT INTO playlist VALUES(NEWID(), 'random 1', CURRENT_TIMESTAMP);
INSERT INTO playlist VALUES(NEWID(), 'random 2', CURRENT_TIMESTAMP);
INSERT INTO playlist VALUES(NEWID(), 'random 3', CURRENT_TIMESTAMP);

SELECT * FROM playlist;
SELECT * FROM faixasNaPlaylist WHERE codplaylist = '60933cc2-132c-4fa6-8efb-b07e9fdd7985';


SELECT * FROM faixa

INSERT INTO faixasNaPlaylist VALUES ('60933cc2-132c-4fa6-8efb-b07e9fdd7985', 2)
INSERT INTO faixasNaPlaylist VALUES ('60933cc2-132c-4fa6-8efb-b07e9fdd7985', 10)
INSERT INTO faixasNaPlaylist VALUES ('60933cc2-132c-4fa6-8efb-b07e9fdd7985', 11)
INSERT INTO faixasNaPlaylist VALUES ('60933cc2-132c-4fa6-8efb-b07e9fdd7985', 12)
INSERT INTO faixasNaPlaylist VALUES ('f5f48044-bce8-4c46-8912-c27f7069bf55', 70)
INSERT INTO faixasNaPlaylist VALUES ('f5f48044-bce8-4c46-8912-c27f7069bf55', 90)
INSERT INTO faixasNaPlaylist VALUES ('f5f48044-bce8-4c46-8912-c27f7069bf55', 120)
INSERT INTO faixasNaPlaylist VALUES ('f5f48044-bce8-4c46-8912-c27f7069bf55', 167)

SELECT codfaixa, f.descricao, tempo, a.codalbum, tc.cod, a.descricao, tc.descricao
FROM playlist p, faixasNaPlaylist fnp, faixa f, album a, tipoComposicao tc
WHERE p.codplaylist = fnp.codplaylist AND fnp.codfaixaplaylist = f.codfaixa AND f.codalbum = a.codalbum
AND f.codtipocomposicao = tc.cod;

DELETE FROM playlist WHERE codplaylist = '26074bc7-5744-4b21-87a6-dbf245bbc7a1';