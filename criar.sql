PRAGMA foreign_keys = ON;
/* Delete tables if they already exist */
drop table if exists Estudante;
drop table if exists EstudanteERASMUS;
drop table if exists EstudanteEE;
drop table if exists EstudanteNormal;
drop table if exists Docente;
drop table if exists Cargo;
drop table if exists UC;
drop table if exists OcorrenciaUC;
drop table if exists Curso;
drop table if exists TipoCurso;
drop table if exists Departamento;
drop table if exists Edificio;
drop table if exists Sala;
drop table if exists TipoSala;
drop table if exists Aula;
drop table if exists TipoAula;
drop table if exists Classificacao;
drop table if exists Gabinete;
drop table if exists DocenteUCs;
drop table if exists Frequencia;

CREATE TABLE Estudante (
    idEstudante INTEGER PRIMARY KEY,
    numero INTEGER UNIQUE NOT NULL,
    nome TEXT NOT NULL,
    dataNascimento DATE NOT NULL,
    anoInscricao INTEGER NOT NULL DEFAULT 2017,
    media REAL DEFAULT 0,
    mediaDeEntrada REAL,
    CONSTRAINT InvalidGrade CHECK(mediaDeEntrada >= 9.5),
    CONSTRAINT NotLegalAge CHECK (anoInscricao - strftime('%Y', dataNascimento) >= 18)
);

CREATE TABLE EstudanteERASMUS(
    idEstudante INTEGER PRIMARY KEY REFERENCES Estudante NOT NULL,
    paisOrigem TEXT
);

CREATE TABLE EstudanteEE(
    idEstudante INTEGER PRIMARY KEY REFERENCES Estudante NOT NULL
);

CREATE TABLE EstudanteNormal(
    idEstudante INTEGER PRIMARY KEY REFERENCES Estudante NOT NULL
);

CREATE TABLE Docente(
    idDocente INTEGER PRIMARY KEY,
    numero INTEGER UNIQUE NOT NULL,
    nome TEXT NOT NULL,
    dataDeNascimento DATE,
    idCargo REFERENCES Cargo NOT NULL,
    idDepartamento REFERENCES Departamento NOT NULL
);

CREATE TABLE Cargo(
    idCargo INTEGER PRIMARY KEY,
    nomeCargo TEXT UNIQUE NOT NULL
);

CREATE TABLE UC(
    idUC INTEGER PRIMARY KEY,
    nomeUC TEXT NOT NULL,
    acronimo TEXT NOT NULL,
    creditos REAL NOT NULL , -- > 0
    semestre INTEGER NOT NULL, -- 1 || 2
    ano INTEGER,
    idCurso REFERENCES Curso NOT NULL,
    -- constraints
    UNIQUE(acronimo, idCurso),
    CONSTRAINT InvalidECTS CHECK(creditos > 0),
    CONSTRAINT InvalidSemester CHECK(semestre == 1 OR semestre == 2) --todo == or =
    
);

CREATE TABLE OcorrenciaUC(
    idOcorrenciaUC INTEGER PRIMARY KEY,
    anoLetivo INTEGER NOT NULL,
    idUC REFERENCES UC NOT NULL
);

CREATE TABLE Curso(
    idCurso INTEGER PRIMARY KEY,
    sigla TEXT NOT NULL,
    nomeCurso TEXT NOT NULL,
    duracao INTEGER CHECK (duracao > 0),
    idTipoCurso REFERENCES TipoCurso NOT NULL,
    idDepartamento REFERENCES Departamento NOT NULL
);

CREATE TABLE TipoCurso(
    idTipoCurso INTEGER PRIMARY KEY,
    nomeTipoCurso TEXT UNIQUE NOT NULL
);

CREATE TABLE Departamento(
    idDepartamento INTEGER PRIMARY KEY,
    nomeDepartamento TEXT UNIQUE NOT NULL
);

CREATE TABLE Edificio(
    idEdificio INTEGER PRIMARY KEY,
    nomeEdificio TEXT NOT NULL,
    sigla TEXT UNIQUE NOT NULL,
    idDepartamento REFERENCES Departamento NOT NULL
);

CREATE TABLE Sala(
    idSala INTEGER PRIMARY KEY,
    numero INTEGER NOT NULL,
    idTipoSala REFERENCES TipoSala NOT NULL,
    idEdificio REFERENCES Edificio NOT NULL,
    UNIQUE(numero, idEdificio)
);

CREATE TABLE TipoSala(
    idTipoSala INTEGER PRIMARY KEY,
    nomeTipoSala TEXT NOT NULL
);

CREATE TABLE Aula(
    idAula INTEGER PRIMARY KEY,
    diaSemana INTEGER CHECK(diaSemana >= 0 AND diaSemana <= 5),
    hora TIME,
    duracao TIME,
    idTipoAula REFERENCES TipoAula NOT NULL,
    idSala REFERENCES Sala NOT NULL,
    idOcorrenciaUC REFERENCES OcorrenciaUC NOT NULL,
    idDocente REFERENCES Docente NOT NULL
);

CREATE TABLE TipoAula(
    idTipoAula INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE Classificacao(
    idEstudante REFERENCES Estudante,
    idOcorrenciaUC REFERENCES OcorrenciaUC,
    nota REAL CHECK(nota >= 0 AND nota <= 20),
    UNIQUE (idEstudante, idOcorrenciaUC)
);

CREATE TABLE Gabinete(
    idDocente REFERENCES Docente,
    idSala REFERENCES Sala
);

CREATE TABLE DocenteUCs(
    idUC REFERENCES UC,
    idDocente REFERENCES Docente
);

CREATE TABLE Frequencia(
    idEstudante REFERENCES Estudante,
    idOcorrenciaUC REFERENCES OcorrenciaUC,
    faltas INTEGER NOT NULL CHECK(faltas > 0),
    UNIQUE (idEstudante, idOcorrenciaUC)
);
