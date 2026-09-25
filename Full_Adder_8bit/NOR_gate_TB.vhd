LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY NOR_gate_TB IS
END NOR_gate_TB;
 
ARCHITECTURE behavior OF NOR_gate_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT NOR_gate
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Y : OUT std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

   --Outputs
   signal Y : std_logic;
  
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: NOR_gate PORT MAP (
          A => A,
          B => B,
          Y => Y
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold initial state for 100 ns
      wait for 100 ns;	

      -- Apply stimulus (all possible 2-input combinations)
      A <= '0'; B <= '0';
      wait for 20 ns;
      
      A <= '0'; B <= '1';
      wait for 20 ns;
      
      A <= '1'; B <= '0';
      wait for 20 ns;
      
      A <= '1'; B <= '1';
      wait for 20 ns;

      -- Stop execution
      wait;
   end process;

END;