USE spotper

DROP VIEW IF EXISTS V1
GO

CREATE VIEW V1
    WITH SCHEMABINDING
    AS
    SELECT 
        p.nome, f.codalbum, COUNT_BIG(*) as CNT
    FROM 
        dbo.faixasNaPlaylist fp, dbo.album a, dbo.playlist p, dbo.faixa f
    WHERE 
        fp.codfaixaplaylist = f.codfaixa AND fp.codplaylist = p.codplaylist
        AND f.codalbum = a.codalbum 
    GROUP BY f.codalbum, p.nome

GO

Create unique clustered index I_V1
on dbo.V1 (nome, codalbum)

SELECT * FROM V1
GO

DROP VIEW IF EXISTS V2
GO
CREATE VIEW V2
AS
SELECT nome, COUNT_BIG(*) AS TotalAlbunsDistintos
FROM dbo.V1
GROUP BY nome
GO

SELECT * FROM V2