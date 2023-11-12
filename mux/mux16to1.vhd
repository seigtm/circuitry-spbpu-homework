-- Multiplexer 16 -> 1.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux16to1 IS
    PORT (
        xd : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        dEN : IN STD_LOGIC;
        ad : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        qd : OUT STD_LOGIC);
END mux16to1;

ARCHITECTURE behav OF mux16to1 IS

    COMPONENT mux4to1
        PORT (
            x : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            a : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            en : IN STD_LOGIC;
            q : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL qs : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
    u1 : mux4to1
    PORT MAP(xd(15 DOWNTO 12), ad(1 DOWNTO 0), dEN, qs(3));
    u2 : mux4to1
    PORT MAP(xd(11 DOWNTO 8), ad(1 DOWNTO 0), dEN, qs(2));
    u3 : mux4to1
    PORT MAP(xd(7 DOWNTO 4), ad(1 DOWNTO 0), dEN, qs(1));
    u4 : mux4to1
    PORT MAP(xd(3 DOWNTO 0), ad(1 DOWNTO 0), dEN, qs(0));
    u5 : mux4to1
    PORT MAP(qs(3 DOWNTO 0), ad(3 DOWNTO 2), dEN, qd);
END behav;

CONFIGURATION con OF mux16to1 IS
    FOR behav
        FOR u1, u2, u3, u4, u5 : mux4to1
            USE ENTITY work.mux4to1 (behavior);
        END FOR;
    END FOR;
END con;