library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

--entra ESTADO PRESENTE o DIRECCION [6] --necesitas un registro que te junte ESTADO SIGUIENTE+ENTRADAS y saque el ESTADO PRESENTE
--sale LIGA+SALIDAS [9], LIGA[3], SALIDAS[6]

ENTITY practicaM IS
	PORT(
		addr : IN std_logic_vector(5 DOWNTO 0); --0:5 incluye el estado presente + entradas x,y,z
		--data : OUT std_logic_vector(8 DOWNTO 0); --6:14 incluye la liga y las salidas s0-s5
		salidas : OUT std_logic_vector(5 DOWNTO 0);
		liga : OUT std_logic_vector(2 DOWNTO 0)
	);
END practicaM;

ARCHITECTURE behavioral OF practicaM IS
	TYPE mem_rom IS ARRAY(0 TO 63) OF std_logic_vector(8 DOWNTO 0); --memoria/matriz/ROM 64x15
	SIGNAL data_out : mem_rom; --declara data_out del tipo memoria rom
BEGIN
	--llenamos matriz
	data_out(0) <= "001110010";
	data_out(1) <= "001110010";
	data_out(2) <= "001110010";
	data_out(3) <= "001110010";
	data_out(4) <= "010111000";
	data_out(5) <= "010111000";
	data_out(6) <= "010111000";
	data_out(7) <= "010111000";
	data_out(8) <= "011000100";
	data_out(9) <= "011000100";
	data_out(10) <= "011000100";
	data_out(11) <= "011000100";
	data_out(12) <= "011000100";
	data_out(13) <= "011000100";
	data_out(14) <= "011000100";
	data_out(15) <= "011000100";
	data_out(16) <= "100100001";
	data_out(17) <= "100100001";
	data_out(18) <= "010100001";
	data_out(19) <= "010100001";
	data_out(20) <= "100100001";
	data_out(21) <= "100100001";
	data_out(22) <= "010100001";
	data_out(23) <= "010100001";
	data_out(24) <= "001000101";
	data_out(25) <= "001010101";
	data_out(26) <= "001000101";
	data_out(27) <= "001010101";
	data_out(28) <= "001000101";
	data_out(29) <= "001010101";
	data_out(30) <= "001000101";
	data_out(31) <= "001010101";
	data_out(32) <= "000000010";
	data_out(33) <= "000000010";
	data_out(34) <= "000000010";
	data_out(35) <= "000000010";
	data_out(36) <= "000000010";
	data_out(37) <= "000000010";
	data_out(38) <= "000000010";
	data_out(39) <= "000000010";
	data_out(40) <= "000111111";
	data_out(41) <= "000111111";
	data_out(42) <= "000111111";
	data_out(43) <= "000111111";
	data_out(44) <= "000111111";
	data_out(45) <= "000111111";
	data_out(46) <= "000111111";
	data_out(47) <= "000111111";
	data_out(48) <= "000111111";
	data_out(49) <= "000111111";
	data_out(50) <= "000111111";
	data_out(51) <= "000111111";
	data_out(52) <= "000111111";
	data_out(53) <= "000111111";
	data_out(54) <= "000111111";
	data_out(55) <= "000111111";
	data_out(56) <= "000111111";
	data_out(57) <= "000111111";
	data_out(58) <= "000111111";
	data_out(59) <= "000111111";
	data_out(60) <= "000111111";
	data_out(61) <= "000111111";
	data_out(62) <= "000111111";
	data_out(63) <= "000111111";

	PROCESS(addr) BEGIN
		--data <= data_out(conv_integer(addr)); --casteo de address a unsigned, despues a entero, y despues se saca el valor en la posicion [address] de la matriz data_out
		liga <= data_out(conv_integer(addr))(8 DOWNTO 6); --lo mismo pero solo guardamos los ultimos 3 que corresponden a liga
		salidas <= data_out(conv_integer(addr))(5 DOWNTO 0); --lo mismo pero solo guardamos los primeros 5 que corresponden a las salidas
		--salidas <= data_out(conv_integer(unsigned(addr)))(5 DOWNTO 0);
	END PROCESS;
END ARCHITECTURE behavioral;