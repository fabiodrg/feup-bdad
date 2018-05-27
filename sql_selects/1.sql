.mode	    columns
.headers	on
.nullvalue	NULL

SELECT numeroSala AS "No. Sala", nomeTipoSala
FROM Sala NATURAL JOIN TipoSala
WHERE idSala NOT IN (
    SELECT idSala
    FROM Sala
    NATURAL JOIN Aula
    WHERE diaSemana == 0 AND strftime('%H', hora) == '10'
) AND idTipoSala <> 1 AND idTipoSala <> 5
ORDER BY numeroSala;