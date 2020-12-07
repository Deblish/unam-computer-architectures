--Multiplexor 2 a 1, multiplexorSalidas
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexorSalidas is
    port (
        salida : out std_logic_vector(5 downto 0); --solo debe salir una
        salidacarga, salidaincrementa : in std_logic_vector(5 downto 0); --ambas las salidas
        carga : in std_logic --resultado del XNOR entre Q y VF
    ); --carga solo me dira cual de las dos salidas es la que corresponde
end entity;

architecture arch of multiplexorSalidas is

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSel : std_logic;

begin
    
    auxSel <= carga; 
    --auxSel (carga) = 0, 1

    --La selección de liga a poner en la salida..
    salida <= salidacarga when auxSel = '1' else
        salidaincrementa when auxSel = '0';
end architecture;