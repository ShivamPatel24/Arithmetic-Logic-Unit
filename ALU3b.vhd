LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ALU3b IS
	PORT(A,B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Clock : in STD_LOGIC;
   OP : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	student_id : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	neg : OUT STD_LOGIC;
	R1  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	R2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ALU3b;

ARCHITECTURE Behaviour OF ALU3b IS
	SIGNAL result : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN
	PROCESS(Clock, OP)
	BEGIN
	
--if(rising_edge(Clock)) then 
case student_id IS
WHEN "0000" =>
result <= "00001000";
neg<= '0';

WHEN "0001" =>
result <= "00011000";
neg<= '0';

WHEN "0010" =>
result <= "00001000";
neg<= '0';

WHEN "0011" =>
result <= "00011000";
neg<= '0';

WHEN "0100" =>
result <= "00001000";
neg<= '0';

WHEN "0101" =>
result <=  "00011000";
neg<= '0';

WHEN "0110" =>
result <= "00001000";
neg<= '0';

WHEN "0111" =>
result <=  "00011000";
neg<= '0';

WHEN "1000" =>
result <= "00001000";
neg<= '0';

WHEN "1001" =>
result <=  "00011000";
neg<= '0';

WHEN OTHERS =>
	result <= "11111000";
END CASE;
--end if;
END PROCESS;

R1 <= Result(7 DOWNTO 4);
R2 <= Result(3 DOWNTO 0);

END Behaviour;