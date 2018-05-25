CREATE TRIGGER EstudanteNormal
         AFTER INSERT
            ON EstudanteERASMUS
      FOR EACH ROW
BEGIN
    SELECT CASE WHEN (
                   SELECT EXISTS (
                              SELECT *
                                FROM EstudanteNormal
                               WHERE idEstudante = NEW.idEstudante
                          )
               )
           THEN RAISE(ABORT, "O estudante inserido é EstudanteNormal!") END;
END;