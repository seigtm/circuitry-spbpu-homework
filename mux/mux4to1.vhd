-- Multiplexer 4 -> 1.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4to1 IS
    PORT (
        x : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        a : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        en : IN STD_LOGIC;
        q : OUT STD_LOGIC
    );
END mux4to1;

ARCHITECTURE behavior OF mux4to1 IS
    SIGNAL qs : STD_LOGIC;
BEGIN
    PROCESS (en, a, x)
    BEGIN
        IF (en = '1') THEN
            CASE a IS
                WHEN "00" => qs <= x(0);
                WHEN "01" => qs <= x(1);
                WHEN "10" => qs <= x(2);
                WHEN OTHERS => qs <= x(3);
            END CASE;
        ELSE
            qs <= '0';
        END IF;
    END PROCESS;

    q <= qs;
END behavior;