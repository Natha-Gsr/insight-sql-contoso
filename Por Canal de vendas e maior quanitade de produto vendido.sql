--Por Canal de vendas e maior quanitade de produto vendido
SELECT
    DimChannel.ChannelName,
    COUNT(FactSales.SalesKey) AS "Vendas por canal"
FROM DimChannel
INNER JOIN FactSales
    ON DimChannel.ChannelKey = FactSales.channelKey
GROUP BY 
    DimChannel.ChannelName



SELECT TOP (1)
    DimChannel.ChannelName,
    DimProduct.ProductName,
    SUM(SalesQuantity) AS 'Maior Quantidade vendida'
FROM FactSales
LEFT JOIN DimProduct
    ON FactSales.ProductKey = DimProduct.ProductKey
INNER JOIN DimChannel
    ON FactSales.channelKey = DimChannel.channelKey
GROUP BY 
    DimProduct.ProductName, 
    DimChannel.ChannelName
ORDER BY 
    SUM(FactSales.SalesQuantity) DESC
