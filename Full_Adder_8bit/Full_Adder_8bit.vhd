library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_8bit is
    Port ( 
        A    : in  STD_LOGIC_VECTOR (7 downto 0);
        B    : in  STD_LOGIC_VECTOR (7 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR (7 downto 0);
        Cout : out STD_LOGIC
    );
end Full_Adder_8bit;

architecture Structural of Full_Adder_8bit is

    -- Declare the 1-bit Full Adder component
    COMPONENT Full_Adder
    PORT(
         A    : IN  std_logic;
         B    : IN  std_logic;
         Cin  : IN  std_logic;
         Sum  : OUT std_logic;
         Cout : OUT std_logic
        );
    END COMPONENT;

    -- Internal signals to carry the bit over to the next adder (Ripple Carry)
    signal c1, c2, c3, c4, c5, c6, c7 : std_logic;

begin

    -- Instantiate 8 Full Adders and chain the carry signals
    
    FA0: Full_Adder PORT MAP (
          A    => A(0),
          B    => B(0),
          Cin  => Cin,
          Sum  => Sum(0),
          Cout => c1
        );

    FA1: Full_Adder PORT MAP (
          A    => A(1),
          B    => B(1),
          Cin  => c1,
          Sum  => Sum(1),
          Cout => c2
        );

    FA2: Full_Adder PORT MAP (
          A    => A(2),
          B    => B(2),
          Cin  => c2,
          Sum  => Sum(2),
          Cout => c3
        );

    FA3: Full_Adder PORT MAP (
          A    => A(3),
          B    => B(3),
          Cin  => c3,
          Sum  => Sum(3),
          Cout => c4
        );

    FA4: Full_Adder PORT MAP (
          A    => A(4),
          B    => B(4),
          Cin  => c4,
          Sum  => Sum(4),
          Cout => c5
        );

    FA5: Full_Adder PORT MAP (
          A    => A(5),
          B    => B(5),
          Cin  => c5,
          Sum  => Sum(5),
          Cout => c6
        );

    FA6: Full_Adder PORT MAP (
          A    => A(6),
          B    => B(6),
          Cin  => c6,
          Sum  => Sum(6),
          Cout => c7
        );

    FA7: Full_Adder PORT MAP (
          A    => A(7),
          B    => B(7),
          Cin  => c7,
          Sum  => Sum(7),
          Cout => Cout
        );

end Structural;