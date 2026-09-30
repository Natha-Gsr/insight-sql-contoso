--Maiores vendas

SELECT TOP (10)
DimCustomer.CustomerKey,
DimCustomer.FirstName+' '+ LastName AS 'Nome Dos clientes',
ROUND( SUM(FactOnlineSales.SalesAmount), 2 )AS 'Valor total comprado'
FROM FactOnlineSales
INNER JOIN DimCustomer
ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
WHERE DimCustomer.FirstName IS NOT NULL
GROUP BY DimCustomer.FirstName +' '+ LastName, 
DimCustomer.CustomerKey
ORDER BY ROUND( SUM(SalesAmount), 2 ) DESC

-- As 10 maiores empresas compradoras
SELECT TOP (10)
DimCustomer.CompanyName,
ROUND( SUM(FactOnlineSales.SalesAmount), 2 )AS 'Valor total comprado'
FROM FactOnlineSales
INNER JOIN DimCustomer
ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
WHERE DimCustomer.CompanyName IS NOT NULL
GROUP BY CompanyName
ORDER BY ROUND( SUM(SalesAmount), 2 ) DESC
