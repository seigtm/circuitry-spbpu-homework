LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY vhdcmp4 IS
    PORT (
        dx : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        dy : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        dai : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        dao : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
END vhdcmp4;

ARCHITECTURE behav OF vhdcmp4 IS

    COMPONENT vhdcmp2
        PORT (
            x : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            y : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            ai : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            ao : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
    END COMPONENT;

    SIGNAL qs : STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN
    u1 : vhdcmp2
    PORT MAP(dx(1 DOWNTO 0), dy(1 DOWNTO 0), dai(2 DOWNTO 0), qs(2 DOWNTO 0));
    u2 : vhdcmp2
    PORT MAP(dx(3 DOWNTO 2), dy(3 DOWNTO 2), qs(2 DOWNTO 0), dao(2 DOWNTO 0));
END behav;

CONFIGURATION con OF vhdcmp4 IS
    FOR behav
        FOR u1, u2 : vhdcmp2
            USE ENTITY work.vhdcmp2(behav);
        END FOR;
    END FOR;
END con;