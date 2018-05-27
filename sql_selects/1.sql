.mode	    columns
.headers	on
.nullvalue	NULL

SELECT numeroSala AS "No. Sala"
FROM Sala AS s1
WHERE s1.idSala NOT IN (
    SELECT idSala
    FROM Sala
    NATURAL JOIN Aula
    WHERE diaSemana == 0 AND strftime('%H', hora) == '10'
    ORDER BY idSala
);