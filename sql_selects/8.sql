SELECT 
    cast((SELECT count(1) from EstudanteERASMUS) as real)/((SELECT count(1) from Estudante))*100 as percentagemERASMUS, 
    cast((SELECT count(1) from EstudanteEE) as real)/((SELECT count(1) from Estudante))*100 as percentagemEE,
    cast((SELECT count(1) from EstudanteEE NATURAL JOIN EstudanteERASMUS) as real)/((SELECT count(1) from Estudante))*100 as percentagemEEERASMUS