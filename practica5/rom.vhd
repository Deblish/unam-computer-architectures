library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

ENTITY practica5 IS
	PORT(
		addr : IN std_logic_vector(2 DOWNTO 0); --estado presente
		prueba : OUT std_logic_vector(2 DOWNTO 0); --va a multiplexorEntradas
		VF : OUT std_logic; --va a un XOR
		liga : OUT std_logic_vector(2 DOWNTO 0); --va a multiplexorPreregistro
		salidaincrementa : OUT std_logic_vector(3 DOWNTO 0); --va a multiplexorSalidas
		salidacarga : OUT std_logic_vector(3 DOWNTO 0) --va a multiplexorSalidas
	);
END practica5;

ARCHITECTURE behavioral OF practica5 IS
	TYPE mem_rom IS ARRAY(0 TO 7) OF std_logic_vector(14 DOWNTO 0); --memoria/matriz/ROM 
	SIGNAL data_out : mem_rom; --declara data_out del tipo memoria rom
	--SIGNAL prueba : std_logic_vector(1 DOWNTO 0); 
BEGIN
	data_out(0) <= "000111011001010";
	data_out(1) <= "001011100011101";
	data_out(2) <= "010010111110101";
	data_out(3) <= "100010010101010";
	data_out(4) <= "011101011111111";
	data_out(5) <= "100101111011101";
	data_out(6) <= "100110010101010";
	data_out(7) <= "100100100000000";
	
	PROCESS(addr) BEGIN
		prueba <= data_out(conv_integer(addr))(14 DOWNTO 12);
		vf <= data_out(conv_integer(addr))(11);
		liga <= data_out(conv_integer(addr))(10 DOWNTO 8);
		salidaincrementa <= data_out(conv_integer(addr))(7 DOWNTO 4);
		salidacarga <= data_out(conv_integer(addr))(3 DOWNTO 0);
	END PROCESS;
END ARCHITECTURE behavioral;
	