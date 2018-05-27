filename=povoar.sql
echo -n "Concatenating... "
echo "PRAGMA foreign_keys = ON;" > $filename
cat Data/Estudante.sql >> $filename
cat Data/EstudanteNormal.sql >> $filename
cat Data/EstudanteERASMUS.sql >> $filename
cat Data/EstudanteEE.sql >> $filename
cat Data/Cargo.sql >> $filename
cat Data/TipoCurso.sql >> $filename
cat Data/Departamento.sql >> $filename
cat Data/Edificio.sql >> $filename
cat Data/TipoSala.sql >> $filename
cat Data/TipoAula.sql >> $filename
cat Data/Docente.sql >> $filename
cat Data/Sala.sql >> $filename
cat Data/Curso.sql >> $filename
cat Data/UC.sql >> $filename
cat Data/OcorrenciaUC.sql >> $filename
cat Data/Aula.sql >> $filename
cat Data/Classificacao.sql >> $filename
cat Data/DocenteUCs.sql >> $filename
cat Data/Gabinete.sql >> $filename
cat Data/Frequencia.sql >> $filename
echo "Done."