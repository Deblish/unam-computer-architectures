library ieee;
use ieee.std_logic_1164.all;

entity p2 is 
	port(
		clk: in std_logic; 
		reset:in std_logic; 
		e: in std_logic_vector(1 downto 0);
		s: out std_logic_vector(1 downto 0)
	);
end p2;

architecture arquitectura of p2 is
	--definimos estados
	type estado is (A, B, C, D); --hay cuatro estados
	signal estado_presente, estado_siguiente: estado; --actual y siguiente son del tipo estado, puedes definirlo como vector 0,1
		begin
			process(e, estado_presente) 
				begin
					s<="00";
					case estado_presente is --en lugar de dos puntos puedes poner is
		            	when A => --cuando estado presente sea "00" 
		            		s<="11";
		            		estado_siguiente <= B;
		            	when B => --cuando estado presente sea "01" 
		            		s <= "01";
		            		if (e="00") then estado_siguiente <= C;	
		            		elsif (e="01") then estado_siguiente <= A;
		            		else
		            			estado_siguiente <= B;
		            		end if;
		            	when C => --cuando estado presente sea "10" 
		            		s<="10";
		            		estado_siguiente <= D;
		            	when D => --cuando estado presente sea "11" 
		            		s <= "00";
		            		if (e="01") then estado_siguiente <= C;	
		            		elsif (e="11") then estado_siguiente <= A;
		            		else
		            			estado_siguiente <= D;
		            		end if;
					end case; 
			end process;

			process(clk, reset) 
				begin
					if (reset ='1') then 
						estado_presente <= A;
					elsif rising_edge(clk) then
						estado_presente <= estado_siguiente;
					end if; 
			end process;
end arquitectura;