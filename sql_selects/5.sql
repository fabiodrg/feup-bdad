.mode		columns
.headers	on
.nullvalue	NULL
SELECT nomeUC AS "Nome UC",
	anoLetivo AS "Ano Letivo",
    avg(nota) AS Media, 
    sum(CASE WHEN nota < 9.5 THEN 1 ELSE 0 END) AS "Numero Reprovacoes",
    sum(CASE WHEN nota >= 9.5 THEN 1 ELSE 0 END) AS "Numero Aprovacoes" 
FROM Classificacao
NATURAL JOIN Estudante
NATURAL JOIN OcorrenciaUC
NATURAL JOIN UC
WHERE idOcorrenciaUC == 452;