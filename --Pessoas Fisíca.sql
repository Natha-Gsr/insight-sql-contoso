--Pessoas Fisíca
SELECT TOP(10)
firstName AS 'Nomes',
ROUND(SUM(SalesAmount),2)  AS 'Total de vendas'
FROM FactOnlineSales
INNER JOIN DimCustomer
ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
WHERE DimCustomer.firstName IS NOT NULL
GROUP BY FirstName
ORDER BY ROUND(SUM(SalesAmount),2) DESC

--Empresas
SELECT TOP(10)
CompanyName AS 'Empresas',
ROUND(SUM(SalesAmount),2) AS 'Total de vendas'
FROM FactOnlineSales
INNER JOIN DimCustomer
ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
WHERE DimCustomer.CompanyName IS NOT NULL
GROUP BY CompanyName
ORDER BY ROUND(SUM(SalesAmount),2) DESC