--média de Canais
-- média dos Canais que venderam ACIMA do Canal 1

WITH Vendas AS (
    SELECT
        ChannelKey,
        AVG(SalesAmount) AS MediaVendas
    FROM FactSales
    GROUP BY ChannelKey
)
SELECT
    c.ChannelName,
    ROUND(v.MediaVendas, 2) AS MediaVendas,
   ROUND( (SELECT MediaVendas FROM Vendas WHERE channelKey = 1 ),2) AS 'Média do Canal 1'
FROM DimChannel AS c
INNER JOIN Vendas AS v
    ON v.ChannelKey = c.ChannelKey
WHERE v.MediaVendas > (
    SELECT AVG(SalesAmount) 
    FROM FactSales 
    WHERE ChannelKey = 1
);