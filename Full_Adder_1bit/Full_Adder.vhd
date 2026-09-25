library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( 
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end Full_Adder;

architecture Structural of Full_Adder is

    -- Declare the universal NOR gate component
    COMPONENT NOR_gate
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Y : OUT std_logic
        );
    END COMPONENT;

    -- Intermediate signals for First Half Adder (HA1)
    signal n1, n2, n3, n4, HA1_S : std_logic;
    signal not_A, not_B, HA1_C   : std_logic;

    -- Intermediate signals for Second Half Adder (HA2)
    signal n5, n6, n7, n8        : std_logic;
    signal not_HA1_S, not_Cin, HA2_C : std_logic;

    -- Intermediate signals for Final Cout OR gate
    signal n9 : std_logic;

begin

    -- ==========================================
    -- Half Adder 1 (A, B) -> Sum: HA1_S, Carry: HA1_C
    -- ==========================================
    
    -- XOR Logic for HA1_S
    U1: NOR_gate PORT MAP (A => A, B => B, Y => n1);
    U2: NOR_gate PORT MAP (A => A, B => n1, Y => n2);
    U3: NOR_gate PORT MAP (A => B, B => n1, Y => n3);
    U4: NOR_gate PORT MAP (A => n2, B => n3, Y => n4);         -- XNOR output
    U5: NOR_gate PORT MAP (A => n4, B => n4, Y => HA1_S);      -- XOR output (Inverted XNOR)

    -- AND Logic for HA1_C (NOT_A NOR NOT_B)
    U6: NOR_gate PORT MAP (A => A, B => A, Y => not_A);
    U7: NOR_gate PORT MAP (A => B, B => B, Y => not_B);
    U8: NOR_gate PORT MAP (A => not_A, B => not_B, Y => HA1_C);


    -- ==========================================
    -- Half Adder 2 (HA1_S, Cin) -> Sum: Sum, Carry: HA2_C
    -- ==========================================
    
    -- XOR Logic for Final Sum
    U9:  NOR_gate PORT MAP (A => HA1_S, B => Cin, Y => n5);
    U10: NOR_gate PORT MAP (A => HA1_S, B => n5, Y => n6);
    U11: NOR_gate PORT MAP (A => Cin, B => n5, Y => n7);
    U12: NOR_gate PORT MAP (A => n6, B => n7, Y => n8);        -- XNOR output
    U13: NOR_gate PORT MAP (A => n8, B => n8, Y => Sum);       -- Final Sum (Inverted XNOR)

    -- AND Logic for HA2_C (NOT_HA1_S NOR NOT_Cin)
    U14: NOR_gate PORT MAP (A => HA1_S, B => HA1_S, Y => not_HA1_S);
    U15: NOR_gate PORT MAP (A => Cin, B => Cin, Y => not_Cin);
    U16: NOR_gate PORT MAP (A => not_HA1_S, B => not_Cin, Y => HA2_C);


    -- ==========================================
    -- Final Carry Out (HA1_C OR HA2_C)
    -- ==========================================
    
    -- OR Logic for Cout (NOT(HA1_C NOR HA2_C))
    U17: NOR_gate PORT MAP (A => HA1_C, B => HA2_C, Y => n9);
    U18: NOR_gate PORT MAP (A => n9, B => n9, Y => Cout);

end Structural;