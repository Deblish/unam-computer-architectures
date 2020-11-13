--Multiplexor 2 a 1, multiplexorPreregistro
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplexorPreregistro is
    port (
        salida : out std_logic_vector(2 downto 0); --solo debe salir una
        carga, n : in std_logic_vector(2 downto 0); --carga y estadoPresente aka N
        incrementa : in std_logic --viene de Logica
    ); --incrementa solo me dira si cargo o incremento (estado presente + 1, aka N+1)
end entity;

architecture arch of multiplexorPreregistro is

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSel : std_logic;
     signal nmasuno : std_logic_vector (2 downto 0);  

begin
    
    auxSel <= incrementa; 
    --auxSel (incrementa) = 0, 1
     
     nmasuno <= std_logic_vector(unsigned(n) + 1);

    --La selección de salida..
    salida <= carga when auxSel = '0' else
        nmasuno when auxSel = '1';
end architecture;