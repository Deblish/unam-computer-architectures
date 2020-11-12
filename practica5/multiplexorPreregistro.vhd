--Multiplexor 2 a 1, multiplexorPreregistro
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexorPreregistro is
    port (
        salida : out std_logic_vector(2 downto 0); --solo debe salir una
        carga, n : in std_logic_vector(2 downto 0); --carga y estadoPresente aka N
        incrementa : in std_logic --viene de Logica
    ); --incrementa solo me dira si cargo o incremento (estado presente + 1, aka N+1)
end entity;

architecture arch of multiplexorLigas is

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSel : std_logic;

begin
    
    auxSel <= incrementa; 
    --auxSel (incrementa) = 0, 1

    --La selección de salida..
    salida <= carga when auxSel = '0' else
        std_logic_vector(to_unsigned(to_integer(unsigned(n)) + 1, 3)) when auxSel = '1';
end architecture;