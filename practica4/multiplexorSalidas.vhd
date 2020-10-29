--3 multiplexores: entradas, ligas, salidas

--Multiplexor 2 a 1, multiplexorSalidas
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexorSalidas is
    port (
        salida : out std_logic_vector(4 downto 0); --solo debe salir una
        salidafalsa, salidaverdadera : in std_logic_vector(4 downto 0); --todas las salidas
        entrada : in std_logic --viene del multiplexorEntradas
    ); --entrada solo me dira cual de las dos salidas es la que corresponde
end entity;

architecture arch of multiplexorSalidas is

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSel : std_logic;

begin
    
    auxSel <= entrada; 
    --auxSel (entrada) = 0, 1

    --La selección de liga a poner en la salida..
    salida <= salidafalsa when auxSel = '0' else
        salidaverdadera when auxSel = '1';
end architecture;