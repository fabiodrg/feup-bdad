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
    numero INTEGER UNIQUE NOT NULL, /*UK NN*/
    nome TEXT,
    dataNascimento DATE,
    anoInscricao INTEGER NOT NULL DEFAULT 2018,
    media INTEGER,
    mediaDeEntrada INTEGER
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
    numero INTEGER,
    nome TEXT,
    dataDeNascimento DATE,
    cargo REFERENCES Cargo,
    dept REFERENCES Departamento
);

CREATE TABLE Cargo(
    id INTEGER PRIMARY KEY,
    nome TEXT
);

CREATE TABLE UC(
    id INTEGER PRIMARY KEY,
    nome TEXT,
    acronimo TEXT,
    creditos REAL,
    semestre INTEGER, /*1 ou 2*/
    ano INTEGER, /* depende do tipo de curso */
    curso REFERENCES Curso
);

CREATE TABLE OcorrenciaUC(
    id INTEGER PRIMARY KEY,
    anoLetivo INTEGER,
    uc REFERENCES UC
);

CREATE TABLE Curso(
    id INTEGER PRIMARY KEY,
    sigla TEXT,
    nome TEXT,
    tipo REFERENCES TipoCurso,
    dept REFERENCES Departamento
);

CREATE TABLE TipoCurso(
    id INTEGER PRIMARY KEY,
    nome TEXT
);

CREATE TABLE Departamento(
    id INTEGER PRIMARY KEY,
    nome TEXT
);

CREATE TABLE Edificio(
    id INTEGER PRIMARY KEY,
    nome TEXT,
    sigla TEXT,
    dept REFERENCES Departamento
);

CREATE TABLE Sala(
    id INTEGER PRIMARY KEY,
    numero INTEGER,
    tipo REFERENCES TipoSala,
    edificio REFERENCES Edificio
);

CREATE TABLE TipoSala(
    id INTEGER PRIMARY KEY,
    nome TEXT
);

CREATE TABLE Aula(
    id INTEGER PRIMARY KEY,
    diaSemana INTEGER, /* 0 -> segunda, ...*/
    hora TIME,
    duracao TIME,
    tipo REFERENCES TipoAula,
    sala REFERENCES Sala,
    ocorrenciaUC REFERENCES OcorrenciaUC,
    docente REFERENCES Docente
);

CREATE TABLE TipoAula(
    id INTEGER PRIMARY KEY,
    nome TEXT
);

CREATE TABLE Classificacao(
    estudanteID REFERENCES Estudante,
    oucID REFERENCES OcorrenciaUC,
    nota REAL /* 0 a 20 */
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
    faltas INTEGER
);