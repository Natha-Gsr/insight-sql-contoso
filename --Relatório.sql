--Relatório
SELECT
    DimChannel.ChannelName,
   ROUND( SUM(FactSales.SalesAmount),2 ) AS 'Soma dos valores'
FROM FactSales
INNER JOIN DimChannel
    ON FactSales.channelKey = DimChannel.ChannelKey
GROUP BY DimChannel.ChannelName 
    HAVING ROUND (SUM(SalesAmount),2) > 
        (SELECT AVG(SalesAmount) FROM FactSales)