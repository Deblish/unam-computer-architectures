--Multiplexor 2 a 1, multiplexorSalidas
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexorSalidas is
    port (
        salida : out std_logic_vector(3 downto 0); --solo debe salir una
        salidacarga, salidaincrementa : in std_logic_vector(3 downto 0); --ambas las salidas
        incrementa : in std_logic --resultado del XOR entre Q y VF
    ); --incrementa solo me dira cual de las dos salidas es la que corresponde
end entity;

architecture arch of multiplexorSalidas is

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSel : std_logic;

begin
    
    auxSel <= incrementa; 
    --auxSel (incrementa) = 0, 1

    --La selección de liga a poner en la salida..
    salida <= salidacarga when auxSel = '0' else
        salidaincrementa when auxSel = '1';
end architecture;