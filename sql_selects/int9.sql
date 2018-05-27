.mode		columns
.headers	on
.nullvalue	NULL


SELECT anoInscricao, avg(mediaDeEntrada) FROM Estudante
GROUP BY anoInscricao