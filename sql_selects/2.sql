.mode		columns
.headers	on
.nullvalue	NULL

SELECT numeroEstudante, nomeEstudante, media FROM Estudante
ORDER BY media DESC
LIMIT 20;