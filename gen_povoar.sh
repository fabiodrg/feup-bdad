touch povoar.sql
echo "PRAGMA foreign_keys = ON;" > povoar.sql
cat Estudante.sql EstudanteERASMUS.sql EstudanteEE.sql EstudanteNormal.sql >> povoar.sql
