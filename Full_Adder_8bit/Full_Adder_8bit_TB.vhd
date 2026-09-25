LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Full_Adder_8bit_TB IS
END Full_Adder_8bit_TB;
 
ARCHITECTURE behavior OF Full_Adder_8bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Full_Adder_8bit
    PORT(
         A    : IN  std_logic_vector(7 downto 0);
         B    : IN  std_logic_vector(7 downto 0);
         Cin  : IN  std_logic;
         Sum  : OUT std_logic_vector(7 downto 0);
         Cout : OUT std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal A   : std_logic_vector(7 downto 0) := (others => '0');
   signal B   : std_logic_vector(7 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

   --Outputs
   signal Sum  : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
  
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder_8bit PORT MAP (
          A    => A,
          B    => B,
          Cin  => Cin,
          Sum  => Sum,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold initial state for 100 ns (Removed the clock wait since this is combinational logic)
      wait for 100 ns;	

      -- Test Case 1: 0 + 0 + 0 = 0
      A <= "00000000"; B <= "00000000"; Cin <= '0';
      wait for 20 ns;
      
      -- Test Case 2: 170 + 85 = 255 (All bits high without overflow)
      A <= "10101010"; B <= "01010101"; Cin <= '0';
      wait for 20 ns;
      
      -- Test Case 3: 255 + 1 = 256 (Sum = 0, Cout = 1)
      A <= "11111111"; B <= "00000001"; Cin <= '0';
      wait for 20 ns;
      
      -- Test Case 4: 255 + 0 + Cin = 256 (Sum = 0, Cout = 1)
      A <= "11111111"; B <= "00000000"; Cin <= '1';
      wait for 20 ns;
      
      -- Test Case 5: 255 + 255 + 1 = 511 (Sum = 255, Cout = 1)
      A <= "11111111"; B <= "11111111"; Cin <= '1';
      wait for 20 ns;
      
      -- Test Case 6: 15 + 15 = 30 (00001111 + 00001111 = 00011110)
      A <= "00001111"; B <= "00001111"; Cin <= '0';
      wait for 20 ns;

      -- Stop execution
      wait;
   end process;

END;