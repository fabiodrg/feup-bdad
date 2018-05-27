.mode	    columns
.headers	on
.nullvalue	NULL

SELECT nomeEdificio AS "Edificio", numeroSala AS "No. Sala", nomeTipoSala AS "Tipo"
FROM Sala NATURAL JOIN TipoSala NATURAL JOIN Edificio
WHERE idSala NOT IN (
    SELECT idSala
    FROM Sala
    NATURAL JOIN Aula
    WHERE diaSemana == 0 AND strftime('%H', hora) == '10'
) AND idTipoSala <> 1 AND idTipoSala <> 5
ORDER BY nomeEdificio, numeroSala;