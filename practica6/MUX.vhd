--Multiplexor 2 a 1, MUX 
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX is
    port (
        salida : out std_logic_vector(3 downto 0); --solo debe salir una
        n : in std_logic_vector(3 downto 0); --estadoPresente aka N
        carga : in std_logic_vector(3 downto 0); --la liga que viene de la logica interna, en la practica6 viene como D
        selector : in std_logic --viene de Logica
    ); --selector solo me dira si cargo o incremento (por ahora solo sale N, despues lo incrementas)
end entity;

architecture arch of MUX is

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSel : std_logic;
    --signal nsenal : std_logic_vector (3 downto 0);  

begin
    
    auxSel <= selector; --auxSel (selector) = 0, 1
    nsenal <= n;

    --La selección de salida..
    salida <= carga when auxSel = '1' else
        n when auxSel = '0';
end architecture;