CREATE TRIGGER EstudanteERASMUSI
         AFTER INSERT
            ON EstudanteNormal
      FOR EACH ROW
BEGIN
    SELECT CASE WHEN (
                   SELECT EXISTS (
                              SELECT *
                                FROM EstudanteERASMUS
                               WHERE idEstudante = NEW.idEstudante
                          )
               )
           THEN RAISE(ABORT, "O estudante inserido é EstudanteERASMUS!") END;
END;

CREATE TRIGGER EstudanteERASMUSU
         AFTER UPDATE
            ON EstudanteNormal
      FOR EACH ROW
BEGIN
    SELECT CASE WHEN (
                   SELECT EXISTS (
                              SELECT *
                                FROM EstudanteERASMUS
                               WHERE idEstudante = NEW.idEstudante
                          )
               )
           THEN RAISE(ABORT, "O estudante inserido é EstudanteERASMUS!") END;
END;
