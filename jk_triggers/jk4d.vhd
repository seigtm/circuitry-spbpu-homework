LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY jk4d IS
    PORT (
        c, r, jk : IN STD_LOGIC;
        q0, q1, q2, q3 : OUT STD_LOGIC);
END jk4d;

ARCHITECTURE behaviour OF jk4d IS
    SIGNAL temp0, temp1, temp2, temp3 : STD_LOGIC;
BEGIN

    PROCESS (c, r, jk)
    BEGIN
        IF (r = '0') THEN
            temp3 <= '0';
            temp2 <= '0';
            temp1 <= '0';
            temp0 <= '0';
        ELSIF (c'event AND c = '1') THEN
            IF (jk = '1') THEN
                IF (temp0 = '0') THEN
                    temp0 <= '1';
                ELSIF (temp1 = '0') THEN
                    temp1 <= '1';
                    temp0 <= '0';
                ELSIF (temp2 = '0') THEN
                    temp2 <= '1';
                    temp1 <= '0';
                    temp0 <= '0';
                ELSIF (temp3 = '0') THEN
                    temp3 <= '1';
                    temp2 <= '0';
                    temp1 <= '0';
                    temp0 <= '0';
                END IF;
            END IF;
        END IF;
    END PROCESS;

    q0 <= temp0;
    q1 <= temp1;
    q2 <= temp2;
    q3 <= temp3;
END behaviour;