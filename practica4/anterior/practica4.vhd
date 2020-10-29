ibrary ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

--entra ESTADO PRESENTE o DIRECCION [6] --necesitas un registro que te junte ESTADO SIGUIENTE+ENTRADAS y saque el ESTADO PRESENTE
--sale LIGA+SALIDAS [9], LIGA[3], SALIDAS[6]

ENTITY practica4 IS
	PORT(
		addr : IN std_logic_vector(2 DOWNTO 0); --0:5 incluye el estado presente + entradas x,y,z
		data : OUT std_logic_vector(17 DOWNTO 0); 
		salidas : OUT std_logic_vector(4 DOWNTO 0);-- 
		ligas : OUT std_logic_vector(5 DOWNTO 0)
		
	);
END practica4;

ARCHITECTURE behavioral OF practica4 IS
	TYPE mem_rom IS ARRAY(0 TO 7) OF std_logic_vector(17 DOWNTO 0); --memoria/matriz/ROM 
	SIGNAL data_out : mem_rom; --declara data_out del tipo memoria rom
BEGIN
	data_out(0) <= "000010011100011000";
	data_out(1) <= "110101001000111001";
	data_out(2) <= "000110111100011000";
	data_out(3) <= "011011101010010100";
	data_out(4) <= "000010100001001010";
	data_out(5) <= "000110110100001000";
	data_out(6) <= "101010101100111011";
	
	
	PROCESS(addr) BEGIN
		data <= data_out(conv_integer(addr)); --casteo de address a unsigned, despues a entero, y despues se saca el valor en la posicion [address] de la matriz data_out
		ligas <= data_out(conv_integer(addr))(8 DOWNTO 6); --lo mismo pero solo guardamos los ultimos 3 que corresponden a liga
		salidas <= data_out(conv_integer(addr))(5 DOWNTO 0); --lo mismo pero solo guardamos los primeros 5 que corresponden a las salidas
		--salidas <= data_out(conv_integer(unsigned(addr)))(5 DOWNTO 0);
	END PROCESS;
END ARCHITECTURE behavioral;
	