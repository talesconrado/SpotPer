USE spotper
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