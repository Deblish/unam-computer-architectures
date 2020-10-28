library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.ALL

--entra ESTADO PRESENTE o DIRECCION [6] --necesitas un registro que te junte ESTADO SIGUIENTE+ENTRADAS y saque el ESTADO PRESENTE
--sale LIGA+SALIDAS [9],

ENTITY rom IS
	PORT(
		addr : IN std_logic_vector(5 DOWNTO 0); --0:5 incluye el estado presente + entradas x,y,z
		data : OUT std_logic_vector(8 DOWNTO 0); --6:14 incluye la liga y las salidas s0-s5
		salidas : OUT std_logic_vector(5 DOWNTO 0);
		liga : OUT std_logic_vector(2 DOWNTO 0);
	);
END rom;

ARCHITECTURE behavioral OF rom IS
	TYPE mem_rom IS ARRAY(0 TO 63) OF std_logic_vector(8 DOWNTO 0); --memoria/matriz/ROM 64x15
	SIGNAL data_out : mem_rom; --declara data_out del tipo memoria rom
BEGIN
	--llenamos matriz
	data_out(0) <= "000000000";
	data_out(1) <= "000000001";
	data_out(0) <= "000000000";
	data_out(1) <= "000000001";
	data_out(2) <= "000000010";
	data_out(3) <= "000000011";
	data_out(4) <= "000000100";
	data_out(5) <= "000000101";
	data_out(6) <= "000000110";
	data_out(7) <= "000000111";
	data_out(8) <= "000001000";
	data_out(9) <= "000001001";
	data_out(10) <= "000001010";
	data_out(11) <= "000001011";
	data_out(12) <= "000001100";
	data_out(13) <= "000001101";
	data_out(14) <= "000001110";
	data_out(15) <= "000001111";
	data_out(16) <= "000010000";
	data_out(17) <= "000010001";
	data_out(18) <= "000010010";
	data_out(19) <= "000010011";
	data_out(20) <= "000010100";
	data_out(21) <= "000010101";
	data_out(22) <= "000010110";
	data_out(23) <= "000010111";
	data_out(24) <= "000011000";
	data_out(25) <= "000011001";
	data_out(26) <= "000011010";
	data_out(27) <= "000011011";
	data_out(28) <= "000011100";
	data_out(29) <= "000011101";
	data_out(30) <= "000011110";
	data_out(31) <= "000011111";
	data_out(32) <= "000100000";
	data_out(33) <= "000100001";
	data_out(34) <= "000100010";
	data_out(35) <= "000100011";
	data_out(36) <= "000100100";
	data_out(37) <= "000100101";
	data_out(38) <= "000100110";
	data_out(39) <= "000100111";
	data_out(40) <= "000101000";
	data_out(41) <= "000101001";
	data_out(42) <= "000101010";
	data_out(43) <= "000101011";
	data_out(44) <= "000101100";
	data_out(45) <= "000101101";
	data_out(46) <= "000101110";
	data_out(47) <= "000101111";
	data_out(48) <= "000110000";
	data_out(49) <= "000110001";
	data_out(50) <= "000110010";
	data_out(51) <= "000110011";
	data_out(52) <= "000110100";
	data_out(53) <= "000110101";
	data_out(54) <= "000110110";
	data_out(55) <= "000110111";
	data_out(56) <= "000111000";
	data_out(57) <= "000111001";
	data_out(58) <= "000111010";
	data_out(59) <= "000111011";
	data_out(60) <= "000111100";
	data_out(61) <= "000111101";
	data_out(62) <= "000111110";
	data_out(63) <= "000111111";

	PROCESS(addr) BEGIN
		data <= data_out(conv_integer(unsigned(addr))); --casteo de address de unsigned a data
		salidas <= data_out(conv_integer(unsigned(addr)))(5 DOWNTO 0); --separamos de una vez
		entradas <= data_out(conv_integer(unsigned(addr)))(8 DOWNTO 6); --igual
	END PROCESS;
END ARCHITECTURE behavioral;







