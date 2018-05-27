.mode		columns
.headers	on
.nullvalue	NULL

-- same UC, different grades
--insert into Classificacao values(218, 173, 15);
--insert into Classificacao values(218, 685, 5);

SELECT idUC, ano, semestre, nomeUC, anoLetivo, nota
FROM (SELECT max(nota), idUC, ano, semestre, nomeUC, anoLetivo, nota
FROM Estudante NATURAL JOIN Classificacao NATURAL JOIN OcorrenciaUC NATURAL JOIN UC
WHERE idEstudante = 218
GROUP BY idUC)
ORDER BY ano, semestre, nomeUC;