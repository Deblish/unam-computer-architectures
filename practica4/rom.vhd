library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

ENTITY practica4 IS
	PORT(
		addr : IN std_logic_vector(2 DOWNTO 0); --estado presente, 3bits
		prueba : OUT std_logic_vector(1 DOWNTO 0); --va a multiplexorEntradas
		ligafalsa : OUT std_logic_vector(2 DOWNTO 0); --va a multiplexorSelectorLigas
		ligaverdadera : OUT std_logic_vector(2 DOWNTO 0); --va a multiplexorSelectorLigas
		salidafalsa : OUT std_logic_vector(4 DOWNTO 0); --va a multiplexorSalidas
		salidaverdadera : OUT std_logic_vector(4 DOWNTO 0) --va a multiplexorSalidas
	);
END practica4;

ARCHITECTURE behavioral OF practica4 IS
	TYPE mem_rom IS ARRAY(0 TO 7) OF std_logic_vector(17 DOWNTO 0); --memoria/matriz/ROM 
	SIGNAL data_out : mem_rom; --declara data_out del tipo memoria rom
	--SIGNAL prueba : std_logic_vector(1 DOWNTO 0); 
BEGIN
	data_out(0) <= "000010011100011000";
	data_out(1) <= "110101001000111001";
	data_out(2) <= "000110111100011000";
	data_out(3) <= "011011101010000100";
	data_out(4) <= "000010100001001010";
	data_out(5) <= "000110110100001000";
	data_out(6) <= "101010101100111011";
	
	PROCESS(addr) BEGIN
		prueba <= data_out(conv_integer(addr))(17 DOWNTO 16);
		ligafalsa <= data_out(conv_integer(addr))(15 DOWNTO 13);
		ligaverdadera <= data_out(conv_integer(addr))(12 DOWNTO 10);
		salidafalsa <= data_out(conv_integer(addr))(9 DOWNTO 5);
		salidaverdadera <= data_out(conv_integer(addr))(4 DOWNTO 0);
		--salidas <= data_out(conv_integer(addr))(5 DOWNTO 0); 
	END PROCESS;
END ARCHITECTURE behavioral;
	