CREATE TRIGGER updateMediaU
         AFTER UPDATE
            ON Classificacao
      FOR EACH ROW
BEGIN
    UPDATE Estudante
       SET media = (
               SELECT avg(nota) 
                 FROM classificacao
                WHERE idestudante = NEW.idEstudante
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
               SELECT avg(nota) 
                 FROM classificacao
                WHERE idestudante = NEW.idEstudante
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
               SELECT avg(nota) 
                 FROM classificacao
                WHERE idestudante = OLD.idEstudante
           )
     WHERE idEstudante = OLD.idEstudante;
END;
