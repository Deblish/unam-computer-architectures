--N+1
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX is
    port (
        nmasuno : out std_logic_vector(3 downto 0); 
        n : in std_logic_vector(3 downto 0); --estadoPresente
    );
end entity;

architecture arch of MUX is

    signal nmasunosenal : std_logic_vector (3 downto 0);  

begin
    
    nmasunosenal <= std_logic_vector(unsigned(n) + 1);

    --La selección de salida..
    nmasuno <= nmasunosenal;
end architecture;