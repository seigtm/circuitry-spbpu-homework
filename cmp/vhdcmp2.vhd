LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY vhdcmp2 IS
    PORT (
        x : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        y : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        ai : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        ao : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
END vhdcmp2;

ARCHITECTURE arch OF vhdcmp2 IS
BEGIN
    PROCESS (x, ai, y)
    BEGIN
        IF (ai = "000") THEN
            ao <= "000";
        ELSE
            IF (x > y) THEN
                ao <= "100";
            ELSIF (x < y) THEN
                ao <= "001";
            ELSIF (x = y) THEN
                IF (ai = "100") THEN
                    ao <= "100";
                ELSIF (ai = "010") THEN
                    ao <= "010";
                ELSIF (ai = "001") THEN
                    ao <= "001";
                END IF;
            END IF;
        END IF;
    END PROCESS;
END arch;