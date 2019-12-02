USE spotper
GO
--Function that receives as a parameter the name of a compositor and returns a table with his/hers album's
DROP FUNCTION IF EXISTS lista_de_albuns
GO

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
        c.nome LIKE '%' + @nome_compositor + '%' AND
        c.codcompositor = cp.codcompositor AND
        cp.codfaixacompositor = f.codfaixa AND
        f.codalbum = a.codalbum
GO

SELECT * from lista_de_albuns('Dvo')