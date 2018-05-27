.mode	      columns
.headers	  on
.nullvalue	NULL

SELECT 
CASE
 WHEN diaSemana = 0 THEN 'Domingo'
 WHEN diaSemana = 1 THEN 'Segunda'
 WHEN diaSemana = 2 THEN 'Terça'
 WHEN diaSemana = 3 THEN 'Quarta'
 WHEN diaSemana = 4 THEN 'Quinta'
 WHEN diaSemana = 5 THEN 'Sexta'
 WHEN diaSemana = 6 THEN 'Sábado'
 END dSemana, hora, acronimo, nomeUC, idEdificio, numeroSala, idDocente
  FROM Aula
NATURAL JOIN Docente
NATURAL JOIN OcorrenciaUC
NATURAL JOIN UC
NaTURAL JOIN Sala
WHERE anoLetivo = 2017 AND idDocente = 21;