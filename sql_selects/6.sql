SELECT idEdificio,
       ocup,
       (count(1) - ocup) AS livres
FROM SALA
NATURAL JOIN
  (SELECT idEdificio,
          count(*) AS ocup
   FROM
     (SELECT DISTINCT numeroSala,
                      idEdificio
      FROM Gabinete
      NATURAL JOIN SALA)
   GROUP BY idEdificio )
GROUP BY idEdificio
ORDER BY count(1) DESC