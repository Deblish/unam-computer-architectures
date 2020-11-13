--Multiplexor 4 a 1, multiplexorEntradas
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexorEntradas is
    port (
        Q : out std_logic; --de todas las entradas solo debe salir una
        W,X,V,Z,aux : in std_logic; --todas las entradas
        prueba : in std_logic_vector(2 downto 0) --viene de la memoria
    ); --prueba solo me dira cual de las cinco entradas es la que se necesita ahora,
       --independientemente de si su valor es positivo o negativo, la necesitamos 
       --para decidir (junto con VF) si se incrementamos o cargamos
end entity;

architecture arch of multiplexorEntradas is

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSelVect : std_logic_vector (2 downto 0);

begin
    
    auxSelVect(2) <= prueba(2);
    auxSelVect(1) <= prueba(1); 
    auxSelVect(0) <= prueba(0);
    --auxSelVect (prueba) = 000, 001, 010, 011, 100

    -- Entrada a poner en la salida..
    Q <= aux when auxSelVect = "100" else 
        W when auxSelVect = "011" else
        X when auxSelVect = "001" else
        V when auxSelVect = "000" else
        Z when auxSelVect = "010";
end architecture;