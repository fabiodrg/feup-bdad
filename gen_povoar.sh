echo "PRAGMA foreign_keys = ON;" > povoar.sql
cat Data/Estudante.sql >> povoar.sql
cat Data/EstudanteNormal.sql >> povoar.sql
cat Data/EstudanteERASMUS.sql >> povoar.sql
cat Data/EstudanteEE.sql >> povoar.sql
cat Data/Cargo.sql >> povoar.sql
cat Data/TipoCurso.sql >> povoar.sql
cat Data/Departamento.sql >> povoar.sql
cat Data/Edificio.sql >> povoar.sql
cat Data/TipoSala.sql >> povoar.sql
cat Data/TipoAula.sql >> povoar.sql
cat Data/Docente.sql >> povoar.sql
cat Data/Sala.sql >> povoar.sql
cat Data/Curso.sql >> povoar.sql
cat Data/UC.sql >> povoar.sql
cat Data/OcorrenciaUC.sql >> povoar.sql
# OK
cat Data/Aula.sql >> povoar.sql