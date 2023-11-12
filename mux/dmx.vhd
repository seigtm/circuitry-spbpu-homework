-- Demultiplexer 1 -> 4.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dmx IS
    PORT (
        x : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        e : IN STD_LOGIC;
        f : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END dmx;

ARCHITECTURE behavior OF dmx IS
BEGIN
    PROCESS (x)
    BEGIN
        IF (e = '0') THEN
            f <= "0000";
        ELSE
            CASE x IS
                WHEN "00" => f <= "0001";
                WHEN "01" => f <= "0010";
                WHEN "10" => f <= "0100";
                WHEN "11" => f <= "1000";
                WHEN OTHERS => f <= "0000";
            END CASE;
        END IF;
    END PROCESS;
END behavior;