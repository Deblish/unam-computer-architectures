--3 multiplexores: entradas, ligas, salidas

--Multiplexor 2 a 1, multiplexorLigas
library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexorLigas is
    port (
        liga : out std_logic_vector(2 downto 0); --solo debe salir una
        ligafalsa, ligaverdadera : in std_logic_vector(2 downto 0); --todas las ligas
        entrada : in std_logic --viene del multiplexorEntradas
    ); --entrada solo me dira cual de las dos ligas es la que corresponde
end entity;

architecture arch of multiplexorLigas is

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSel : std_logic;

begin
    
    auxSel <= entrada; 
    --auxSel (entrada) = 0, 1

    --La selección de liga a poner en la salida..
    liga <= ligafalsa when auxSel = '0' else
        ligaverdadera when auxSel = '1';
end architecture;