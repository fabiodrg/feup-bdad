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
    id INTEGER PRIMARY KEY,
    numero INTEGER UNIQUE NOT NULL,
    nome TEXT NOT NULL,
    dataNascimento DATE,
    anoInscricao INTEGER NOT NULL DEFAULT 2017,
    media REAL DEFAULT 0,
    mediaDeEntrada REAL CHECK(mediaDeEntrada >= 9.5)
);

CREATE TABLE EstudanteERASMUS(
    id INTEGER PRIMARY KEY REFERENCES Estudante,
    paisOrigem TEXT
);

CREATE TABLE EstudanteEE(
    id INTEGER PRIMARY KEY REFERENCES Estudante
);

CREATE TABLE EstudanteNormal(
    id INTEGER PRIMARY KEY REFERENCES Estudante
);

CREATE TABLE Docente(
    id INTEGER PRIMARY KEY,
    numero INTEGER UNIQUE NOT NULL,
    nome TEXT NOT NULL,
    dataDeNascimento DATE,
    cargo REFERENCES Cargo NOT NULL,
    dept REFERENCES Departamento NOT NULL
);

CREATE TABLE Cargo(
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE UC(
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    acronimo TEXT NOT NULL,
    creditos REAL NOT NULL CHECK(creditos > 0) ,
    semestre INTEGER NOT NULL CHECK(semestre == 1 OR semestre == 2), /*1 ou 2*/
    ano INTEGER, /* TODO depende do tipo de curso */
    curso REFERENCES Curso NOT NULL
);

CREATE TABLE OcorrenciaUC(
    id INTEGER PRIMARY KEY,
    anoLetivo INTEGER NOT NULL,
    uc REFERENCES UC NOT NULL
);

CREATE TABLE Curso(
    id INTEGER PRIMARY KEY,
    sigla TEXT NOT NULL,
    nome TEXT NOT NULL,
    duracao INTEGER CHECK (duracao > 0),
    tipo REFERENCES TipoCurso NOT NULL,
    dept REFERENCES Departamento NOT NULL
);

CREATE TABLE TipoCurso(
    id INTEGER PRIMARY KEY,
    nome TEXT UNIQUE NOT NULL
);

CREATE TABLE Departamento(
    id INTEGER PRIMARY KEY,
    nome TEXT UNIQUE NOT NULL
);

CREATE TABLE Edificio(
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    sigla TEXT UNIQUE NOT NULL,
    dept REFERENCES Departamento NOT NULL
);

CREATE TABLE Sala(
    id INTEGER PRIMARY KEY,
    numero INTEGER UNIQUE NOT NULL CHECK(numero > 0),
    tipo REFERENCES TipoSala NOT NULL,
    edificio REFERENCES Edificio NOT NULL
);

CREATE TABLE TipoSala(
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE Aula(
    id INTEGER PRIMARY KEY,
    diaSemana INTEGER CHECK(diaSemana >= 0 AND diaSemana <= 5),
    hora TIME,
    duracao TIME,
    tipo REFERENCES TipoAula NOT NULL,
    sala REFERENCES Sala NOT NULL,
    ocorrenciaUC REFERENCES OcorrenciaUC NOT NULL,
    docente REFERENCES Docente NOT NULL
);

CREATE TABLE TipoAula(
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE Classificacao(
    estudanteID REFERENCES Estudante,
    oucID REFERENCES OcorrenciaUC,
    nota REAL CHECK(nota >= 0 AND nota <= 20)
);

CREATE TABLE Gabinete(
    docenteID REFERENCES Docente,
    salaID REFERENCES Sala
);

CREATE TABLE DocenteUCs(
    ucID REFERENCES UC,
    docID REFERENCES Docente
);

CREATE TABLE Frequencia(
    estudanteId REFERENCES Estudante,
    oucId REFERENCES OcorrenciaUC,
    faltas INTEGER NOT NULL CHECK(faltas > 0)
);