LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rstr_behavior IS
    PORT (
        s : IN STD_LOGIC;
        r : IN STD_LOGIC;
        q : OUT STD_LOGIC);
END rstr_behavior;
ARCHITECTURE behav OF rstr_behavior IS
    SIGNAL qs : STD_LOGIC;
BEGIN
    PROCESS (s, r)
    BEGIN
        IF s = '1' THEN
            IF r = '1' THEN
                qs <= qs;
            ELSE
                qs <= '0';
            END IF;
        ELSE
            qs <= '1';
        END IF;
    END PROCESS;
    q <= qs;
END behav;