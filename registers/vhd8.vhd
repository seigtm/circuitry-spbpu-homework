LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY vhd8 IS
    PORT (
        d, c1, c2, r : IN STD_LOGIC;
        q1, q2, q3 : INOUT STD_LOGIC;
        q4 : OUT STD_LOGIC);
END vhd8;

ARCHITECTURE behav OF vhd8 IS
BEGIN
    PROCESS (r, c1, c2, d)
    BEGIN
        IF r = '1' THEN
            IF c1 = '1' THEN
                q1 <= d;
                q3 <= q2;
            END IF;

            IF c2 = '1' THEN
                q2 <= q1;
                q4 <= q3;
            END IF;
        ELSIF r = '0' THEN
            q1 <= '0';
            q2 <= '0';
            q3 <= '0';
            q4 <= '0';
        END IF;
    END PROCESS;
END behav;