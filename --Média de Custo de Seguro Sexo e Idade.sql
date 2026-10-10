--Média de Custo de Seguro Sexo e Idade
SELECT
COUNT(*) AS 'Contagem de pessoas',
sex AS 'Sexo',
age AS 'Idade',
ROUND (AVG(charges),2) AS 'Média de seguro por pessoas'
FROM medical_insurance
GROUP BY sex, age
ORDER BY age DESC

--pra Qual sexo é mais caro Homem ou Mulher ?
SELECT
SUM(charges) AS 'SOMA',
sex AS ' Sexo'
FROM medical_insurance
GROUP BY sex


--Aqui eu fiz uma pequena atualização no nome dos sexo pra português
UPDATE medical_insurance
SET sex = 'Masculino'
WHERE sex = 'male'

UPDATE medical_insurance
SET sex = 'Feminino'
WHERE sex = 'female'

--uma tabela de seguro de vidas que eu achei no Kaggles e achei interresante trázer algumas curiosidades
