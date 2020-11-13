library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

ENTITY practica5 IS
	PORT(
		addr : IN std_logic_vector(2 DOWNTO 0); --estado presente
		prueba : OUT std_logic_vector(2 DOWNTO 0); --va a multiplexorEntradas
		VF : OUT std_logic; --va a un XOR
		liga : OUT std_logic_vector(2 DOWNTO 0); --va a multiplexorPreregistro
		salidacarga : OUT std_logic_vector(3 DOWNTO 0); --va a multiplexorSalidas
		salidaincrementa : OUT std_logic_vector(3 DOWNTO 0) --va a multiplexorSalidas
	);
END practica5;

ARCHITECTURE behavioral OF practica5 IS
	TYPE mem_rom IS ARRAY(0 TO 7) OF std_logic_vector(17 DOWNTO 0); --memoria/matriz/ROM 
	SIGNAL data_out : mem_rom; --declara data_out del tipo memoria rom
	--SIGNAL prueba : std_logic_vector(1 DOWNTO 0); 
BEGIN
	data_out(0) <= "000000111011001010";
	data_out(1) <= "001001011100011101";
	data_out(2) <= "010010010111110101";
	data_out(3) <= "011100010010101010";
	data_out(4) <= "100011101011111111";
	data_out(5) <= "101100101111011101";
	data_out(6) <= "110100110010101010";
	data_out(7) <= "111100100100000000";
	
	PROCESS(addr) BEGIN
		prueba <= data_out(conv_integer(addr))(17 DOWNTO 15);
		prueba <= data_out(conv_integer(addr))(14 DOWNTO 12);
		vf <= data_out(conv_integer(addr))(11); --11
		liga <= data_out(conv_integer(addr))(10 DOWNTO 8);
		salidafalsa <= data_out(conv_integer(addr))(7 DOWNTO 4);
		salidaverdadera <= data_out(conv_integer(addr))(3 DOWNTO 0);
	END PROCESS;
END ARCHITECTURE behavioral;
	