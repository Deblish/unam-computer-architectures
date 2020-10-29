library ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

--entra ESTADO SIGUIENTE+ENTRADAS [6]
--sale ESTADO PRESENTE [6]

ENTITY registro IS
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		entradas : IN std_logic_vector(2 DOWNTO 0);
		liga : IN std_logic_vector(2 DOWNTO 0);
		data_out: OUT std_logic_vector(5 DOWNTO 0) --estado presente
	);
END registro;

ARCHITECTURE behavioral OF registro IS
	SIGNAL internal_value : std_logic_vector(5 DOWNTO 0) := B"000000"; --primer direccion de la memoria en ceros
BEGIN
	PROCESS (clk, reset, entradas, liga) BEGIN
		IF reset = '1' THEN
			internal_value <= B"000000";
		ELSIF rising_edge(clk) THEN
			internal_value <= entradas&liga; --entradas y liga a auxiliar
		END IF;
	END PROCESS;

	PROCESS(internal_value) BEGIN
		data_out <= internal_value; --auxiliar a estado presente
	END PROCESS;
END behavioral;