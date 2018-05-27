.mode		columns
.headers	on
.nullvalue	NULL

SELECT idUC, ano, semestre, nomeUC, anoLetivo, nota
FROM Estudante NATURAL JOIN Classificacao NATURAL JOIN OcorrenciaUC NATURAL JOIN UC
WHERE idEstudante = 218
ORDER BY ano, semestre, nomeUC;