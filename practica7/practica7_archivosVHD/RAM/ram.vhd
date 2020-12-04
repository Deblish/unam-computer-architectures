library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ram is
	Port( address : in std_logic_vector(15 downto 0);
			data : inout std_logic_vector(7 downto 0);
			Wn : in std_logic;
			CSn : in std_logic
			);
end ram;

architecture Behavioral of ram is
	type memory is array(0 to 255) of std_logic_vector(7 downto 0);
	signal mem : memory;
	signal data_out : std_logic_vector(7 downto 0) := X"00";
	
	begin
	
	-- Memory Write Block
	MEM_WRITE: process (address, CSn, Wn, data) 
	begin
		mem(0) <= X"C6";
		mem(1) <= X"02";
		mem(2) <= X"86";
		mem(3) <= X"00";
		mem(4) <= X"1B";
		mem(5) <= X"7E";
		mem(6) <= X"00";
		mem(7) <= X"04";
		
		if (CSn = '0' and Wn = '0') then
			mem(conv_integer(unsigned(address))) <= data;
		end if;
	end process;

	TRI_STATE: process (address, CSn, Wn, data_out)
	begin
		if (CSn = '0' and Wn = '1') then
			data <= data_out;
		else 
			data <= (others => 'Z');
		end if;
	end process;
		
 -- Memory Read Block
	MEM_READ: process (address, CSn, Wn, mem) 
	begin
		if (CSn = '0' and Wn = '1') then
			data_out <= mem(conv_integer(unsigned(address)));
		else
			data_out <= (others => '0');
		end if;
	end process;
	
end Behavioral;
