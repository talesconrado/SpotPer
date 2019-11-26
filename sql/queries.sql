USE spotper

--Mostrar albuns com prcompra maior que a média de prcompra.
SELECT a.codalbum as 'Álbum', a.prcompra as 'Preço' FROM album a
GROUP BY a.codalbum, a.prcompra
HAVING a.prcompra > (SELECT AVG(a2.prcompra) FROM album a2)


--Listar nome da gravadora com maior número de playlists que possuem pelo menos
--uma faixa composta pelo compositor Dvorack.

SELECT g.nome, COUNT(DISTINCT(p.codplaylist)) FROM gravadora g, playlist p, faixasNaPlaylist fp, faixa f, compostaPor cp, compositor c, album a
WHERE p.codplaylist = fp.codplaylist AND fp.codfaixaplaylist = f.codfaixa AND cp.codfaixacompositor = f.codfaixa
AND cp.codcompositor = 4 AND f.codalbum = a.codalbum AND a.codgravadora = g.codgravadora
GROUP BY g.nome
HAVING COUNT(DISTINCT(p.codplaylist)) = (SELECT MAX(a.cnt)
                                            FROM (SELECT COUNT(DISTINCT(p.codplaylist)) AS cnt
                                            FROM gravadora g, playlist p, faixasNaPlaylist fp, faixa f, compostaPor cp, compositor c, album a
                                            WHERE p.codplaylist = fp.codplaylist AND fp.codfaixaplaylist = f.codfaixa 
                                            AND cp.codfaixacompositor = f.codfaixa
                                            AND cp.codcompositor = 4 AND f.codalbum = a.codalbum AND a.codgravadora = g.codgravadora
                                            GROUP BY g.nome) AS a)



--Listar nome do compositor com maior número de faixas nas playlists existentes.
SELECT c.nome, COUNT(f.codfaixa) 
FROM compositor c, faixa f, compostaPor cp, faixasNaPlaylist fp
WHERE c.codcompositor = cp.codcompositor AND cp.codfaixacompositor = f.codfaixa
AND fp.codfaixaplaylist = f.codfaixa
GROUP BY c.nome
HAVING COUNT(f.codfaixa) = (SELECT MAX(A.CNT) 
                                FROM (SELECT COUNT(f.codfaixa) AS CNT FROM   
                                compositor c, faixa f, compostaPor cp, faixasNaPlaylist fp
                                WHERE c.codcompositor = cp.codcompositor AND cp.codfaixacompositor = f.codfaixa
                                AND fp.codfaixaplaylist = f.codfaixa
                                GROUP BY c.nome) AS A) 




--Listar playlists, cujas faixas (todas) têm tipo de composição “Concerto” e período “Barroco”.
SELECT p.nome as 'Nome' 
FROM playlist p
WHERE p.codplaylist = ALL ( SELECT p1.codplaylist FROM playlist p1,faixasNaPlaylist fp, compositor c, compostaPor cp, faixa f 
WHERE p1.codplaylist = fp.codplaylist AND fp.codfaixaplaylist = f.codfaixa AND f.codtipocomposicao = 0
AND cp.codfaixacompositor = f.codfaixa AND cp.codcompositor = c.codcompositor AND c.codperiodomusical = 0)
