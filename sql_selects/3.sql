.mode		columns
.headers	on
.nullvalue	NULL

SELECT *
FROM OcorrenciaUC
    NATURAL JOIN Estudante
    NATURAL JOIN Aula
WHERE idOcorrenciaUC == 44
GROUP BY idEstudante
ORDER BY diaSemana, hora ASC;