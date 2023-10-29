LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY jk IS
    PORT (
        j, k : IN STD_LOGIC;
        q, qi : INOUT STD_LOGIC);
END jk;

ARCHITECTURE behav OF jk IS
    SIGNAL q_sig, f : STD_LOGIC;
BEGIN
    PROCESS (q_sig, f) BEGIN
        IF (k = '0'AND j = '0') THEN
            f <= '1';
        ELSIF (k = '1' AND j = '1') THEN
            IF (f = '1') THEN
                q_sig <= NOT q;
                f <= '0';
            END IF;
        ELSE
            IF (k = '1') THEN
                q_sig <= '0';
                f <= '0';
            ELSE
                q_sig <= '1';
                f <= '0';
            END IF;
        END IF;
    END PROCESS;

    q <= q_sig;
    qi <= NOT q_sig;
END behav;