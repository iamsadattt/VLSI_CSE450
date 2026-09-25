LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Full_Adder_TB IS
END Full_Adder_TB;
 
ARCHITECTURE behavior OF Full_Adder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Full_Adder
    PORT(
         A    : IN  std_logic;
         B    : IN  std_logic;
         Cin  : IN  std_logic;
         Sum  : OUT std_logic;
         Cout : OUT std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal A   : std_logic := '0';
   signal B   : std_logic := '0';
   signal Cin : std_logic := '0';

   --Outputs
   signal Sum  : std_logic;
   signal Cout : std_logic;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          A    => A,
          B    => B,
          Cin  => Cin,
          Sum  => Sum,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold initial state for 100 ns.
      wait for 100 ns;	

      -- Apply stimulus (all 8 possible 3-input combinations)
      A <= '0'; B <= '0'; Cin <= '0';
      wait for 20 ns;
      
      A <= '0'; B <= '0'; Cin <= '1';
      wait for 20 ns;
      
      A <= '0'; B <= '1'; Cin <= '0';
      wait for 20 ns;
      
      A <= '0'; B <= '1'; Cin <= '1';
      wait for 20 ns;
      
      A <= '1'; B <= '0'; Cin <= '0';
      wait for 20 ns;
      
      A <= '1'; B <= '0'; Cin <= '1';
      wait for 20 ns;
      
      A <= '1'; B <= '1'; Cin <= '0';
      wait for 20 ns;
      
      A <= '1'; B <= '1'; Cin <= '1';
      wait for 20 ns;

      -- Stop execution
      wait;
   end process;

END;