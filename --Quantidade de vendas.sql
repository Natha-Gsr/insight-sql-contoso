--Quantidade de vendas
SELECT 
    DimCustomer.FirstName,
    COUNT(FactOnlineSales.OnlineSalesKey) AS 'Quantidade de vendas'
FROM FactOnlineSales
INNER JOIN DimCustomer
    ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
        WHERE FirstName IS NOT NULL
                GROUP BY FirstName
                    HAVING COUNT( OnlineSalesKey) > (
    SELECT AVG(CAST(MediaVendas.TotalVendas AS DECIMAL(10,2)))
    FROM (
        SELECT 
            CustomerKey, 
            COUNT( OnlineSalesKey) AS TotalVendas
        FROM FactOnlineSales
        GROUP BY CustomerKey
    ) AS MediaVendas 
)
ORDER BY COUNT(OnlineSalesKey) DESC