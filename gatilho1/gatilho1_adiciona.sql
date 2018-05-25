CREATE TRIGGER updateMediaU
         AFTER UPDATE
            ON Classificacao
      FOR EACH ROW
BEGIN
    UPDATE Estudante
       SET media = (
            SELECT sum(nota * creditos)/sum(creditos) FROM classificacao
                NATURAL JOIN OcorrenciaUC
                NATURAL JOIN UC
                WHERE idestudante = NEW.idEstudante AND nota>9.5
        )
     WHERE idEstudante = NEW.idEstudante;
END;


CREATE TRIGGER updateMediaI
         AFTER INSERT
            ON Classificacao
      FOR EACH ROW
BEGIN
    UPDATE Estudante
       SET media = (
            SELECT sum(nota * creditos)/sum(creditos) FROM classificacao
                NATURAL JOIN OcorrenciaUC
                NATURAL JOIN UC
                WHERE idestudante = NEW.idEstudante AND nota>9.5
        )
     WHERE idEstudante = NEW.idEstudante;
END;


CREATE TRIGGER updateMediaD
         AFTER DELETE
            ON Classificacao
      FOR EACH ROW
BEGIN
    UPDATE Estudante
       SET media = (
            SELECT sum(nota * creditos)/sum(creditos) FROM classificacao
                NATURAL JOIN OcorrenciaUC
                NATURAL JOIN UC
                WHERE idestudante = OLD.idEstudante AND nota>9.5
        )
     WHERE idEstudante = OLD.idEstudante;
END;
