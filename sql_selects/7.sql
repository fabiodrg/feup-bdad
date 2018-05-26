SELECT nomeUC, count(*) as n FROM DocenteUCs
NATURAL JOIN UC
NATURAL JOIN OcorrenciaUC
WHERE anoLetivo = 2016
GROUP BY idUC
order by n desc
limit 10