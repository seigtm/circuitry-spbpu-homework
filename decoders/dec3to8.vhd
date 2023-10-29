LIBRARY ieee;
USE IEEE.std_logic_1164.ALL;

ENTITY dec3to8 IS
    PORT (
        a : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        en : IN STD_LOGIC;
        q : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END dec3to8;

ARCHITECTURE behav OF dec3to8 IS
BEGIN
    PROCESS (a)
    BEGIN
        IF (en = '0') THEN
            q <= "00000000";
        ELSIF (en = '1') THEN
            CASE a IS
                WHEN "000" => q <= "00000001";
                WHEN "001" => q <= "00000010";
                WHEN "010" => q <= "00000100";
                WHEN "011" => q <= "00001000";
                WHEN "100" => q <= "00010000";
                WHEN "101" => q <= "00100000";
                WHEN "110" => q <= "01000000";
                WHEN "111" => q <= "10000000";
                WHEN OTHERS => q <= "00000000";
            END CASE;
        END IF;
    END PROCESS;
END behav;