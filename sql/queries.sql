--Mostrar albuns com prcompra maior que a média de prcompra.
SELECT a.codalbum as 'Álbum', a.prcompra as 'Preço' FROM album a
GROUP BY a.codalbum, a.prcompra
HAVING a.prcompra > (SELECT AVG(a2.prcompra) FROM album a2)

SELECT AVG(prcompra) FROM album