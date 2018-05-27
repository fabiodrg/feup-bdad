.mode		columns
.headers	on
.nullvalue  NULL

SELECT DISTINCT idDocente, idDepartamento as deptDocente, E.idDepartamento as deptSala FROM Docente
NATURAL JOIN Gabinete
NATURAL JOIN Sala
LEFT JOIN Edificio E ON Sala.idEdificio = E.idEdificio
WHERE E.idDepartamento <> Docente.idDepartamento