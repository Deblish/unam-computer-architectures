--3 multiplexores: entradas, ligas, salidas

--Multiplexor 4 a 1, multiplexorEntradas
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexorEntradas is
    port (
        entrada : out std_logic; --de todas las entradas solo debe salir una
        W,X,Y,Z : in std_logic; --todas las entradas
        prueba : in std_logic_vector(1 downto 0) --viene de la memoria
    ); --prueba solo me dira cual de las cuatro entradas es la que se necesita ahora,
       --independientemente de si su valor es positivo o negativo, la necesitamos 
       --para saber cual es la liga/salida correspondiente (la falsa o la verdadera?)
end entity;

architecture arch of multiplexorEntradas is

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSelVect : std_logic_vector (1 downto 0);

begin
    
    auxSelVect(1) <= prueba(1); 
    auxSelVect(0) <= prueba(0);
    --auxSelVect (prueba) = 00, 01, 10, 11

    -- La selección de entrada a poner en la salida..
    entrada <= W when auxSelVect = "00" else
        X when auxSelVect = "01" else
        Y when auxSelVect = "10" else
        Z when auxSelVect = "11";
end architecture;