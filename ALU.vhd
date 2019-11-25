LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ALU IS
	PORT(A,B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Clock : in STD_LOGIC;
	OP : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	neg : OUT STD_LOGIC;
	R1  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	R2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ALU;

ARCHITECTURE Behaviour OF ALU IS
	SIGNAL result : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN
	PROCESS(Clock, OP)
	BEGIN
	
--if(rising_edge(Clock)) then 
		CASE OP IS 
		
WHEN "1000000000000000" =>
	result<= A + B;
	neg<= '0';
	
WHEN "0100000000000000" =>
	IF (B(7 DOWNTO 0 )> A (7 DOWNTO 0)) THEN 
	neg<='1';
	result <= not ((A) - (B)) +1;

	ELSE
	neg<='0';
	result <= (A) - (B);
	END IF;

WHEN "0010000000000000" =>
	result<= not(A);
	neg<= '0';

WHEN "0001000000000000" =>
	result<=  A nand B;
	neg<= '0';
	
WHEN "0000100000000000" =>
	result<=  A nor B;
	neg<= '0';

WHEN "0000010000000000" =>
	result<= (A and B);
	neg<= '0';

WHEN "0000001000000000" =>
	result<=  (A xor B);
	neg<= '0';
WHEN "0000000100000000" =>
	result<= (A or B);
	neg<= '0';
WHEN "0000000010000000" =>
	result<= A xnor B;
	neg<= '0';
WHEN OTHERS =>
	result <= "11111111";
END CASE; 
--end if;
END PROCESS;

R1 <= Result(7 DOWNTO 4);
R2 <= Result(3 DOWNTO 0);

END Behaviour;