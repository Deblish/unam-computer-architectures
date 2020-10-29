library ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

--entra CLK, RESET, ESTADO SIGUIENTE
--sale ESTADO PRESENTE

ENTITY registro IS
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		liga : IN std_logic_vector(2 DOWNTO 0); --data_in
		estadopresente : OUT std_logic_vector(2 DOWNTO 0) --data_out
	);
END registro;

ARCHITECTURE behavioral OF registro IS
	SIGNAL internal_value : std_logic_vector(2 DOWNTO 0) := B"000"; --ceros
BEGIN
	PROCESS (clk, reset, liga) BEGIN
		IF reset = '1' THEN
			internal_value <= B"000"; --inicias en ceros
		ELSIF rising_edge(clk) THEN
			internal_value <= liga; --liga a auxiliar
		END IF;
	END PROCESS;

	PROCESS(internal_value) BEGIN
		estadopresente <= internal_value; --auxiliar a estado presente
	END PROCESS;
END behavioral;