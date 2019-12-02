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
select p.nome as 'nome'
from playlist p inner join faixasNaPlaylist fp inner join faixa f on f.codfaixa = fp.codfaixaplaylist on p.codplaylist = fp.codplaylist
where not exists (select f1.codfaixa from faixa f1, faixasNaPlaylist fp1, compositor c, compostaPor cp where f1.codtipocomposicao != 0 and fp1.codplaylist = p.codplaylist
                and fp1.codfaixaplaylist = f1.codfaixa and f1.codtipocomposicao != 0 and cp.codcompositor = c.codcompositor
                and cp.codfaixacompositor = f1.codfaixa and c.codperiodomusical != 0)
group by p.nome