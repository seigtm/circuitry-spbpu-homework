LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY notand IS
    PORT (
        a : IN STD_LOGIC;
        b : IN STD_LOGIC;
        c : INOUT STD_LOGIC);
END notand;
ARCHITECTURE behavior OF notand IS
BEGIN
    C <= NOT (a AND b);
END behavior;