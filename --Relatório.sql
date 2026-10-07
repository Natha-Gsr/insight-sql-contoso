-- Funcionários que recebem acima da média salarial

WITH Salario AS (
    SELECT
        EmployeeKey,
        FirstName + ' ' + LastName AS NomeCompleto,
        BaseRate * VacationHours AS SomaSalarios
    FROM DimEmployee
    WHERE EndDate IS NULL
)
SELECT 
    NomeCompleto,
    ROUND(SomaSalarios, 2) AS SalarioTotal
FROM Salario
WHERE ROUND(SomaSalarios, 2) > (SELECT ROUND(AVG(SomaSalarios), 2) FROM Salario);

