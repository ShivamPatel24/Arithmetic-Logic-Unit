LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ALU2b IS
	PORT(A,B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Clock : in STD_LOGIC;
	OP : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	neg : OUT STD_LOGIC;
	R1  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	R2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ALU2b;

ARCHITECTURE Behaviour OF ALU2b IS
	SIGNAL result : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN
	PROCESS(A,B, OP)
	BEGIN
	
--if(rising_edge(Clock)) then 
		CASE OP IS 
		
WHEN "1000000000000000" =>
	result<= A(3 DOWNTO 0) & A(7 DOWNTO 4);
	neg<= '0';
	
WHEN "0100000000000000" =>
	result <= A OR B;
	neg<= '0';
WHEN "0010000000000000" =>
	IF (5 > A (7 DOWNTO 0)) THEN 
	neg<='1';
	result <= not (B-5) +1;
	ELSE
	neg<='0';
	result <= B - 5;
	END IF;
	neg<= '0';

WHEN "0001000000000000" =>
	result<= not(A);
	neg<= '0';
	
WHEN "0000100000000000" =>
	result<=  A(0) &  A(1) & A(2) & A(3) & A(4) & A(5) & A(6) & A(7) ;
	neg<= '0';

WHEN "0000010000000000" =>

	IF (B(7 DOWNTO 0 )> A (7 DOWNTO 0)) THEN 
	result <= B;
	ELSE
	result <= A;
	END IF;
	neg<= '0';

WHEN "0000001000000000" =>

	IF (B(7 DOWNTO 0 )> A (7 DOWNTO 0)) THEN 
	neg<='1';
	result <= not ((A) - (B)) +1;
	ELSE
	neg<='0';
	result <= (A) - (B);
	END IF;
WHEN "0000000100000000" =>
	result<= (A xnor B);
	neg<= '0';
WHEN "0000000010000000" =>
	result<= B(4 DOWNTO 0) & B(7 DOWNTO 5);
	neg<= '0';
WHEN OTHERS =>
	result <= "11111111";
END CASE; 
--end if;
END PROCESS;

R1 <= Result(7 DOWNTO 4);
R2 <= Result(3 DOWNTO 0);

END Behaviour;