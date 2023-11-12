-- Multiplexer 64 -> 1.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux64to1 IS
    PORT (
        xc : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
        cEN : IN STD_LOGIC;
        ac : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
        qc : OUT STD_LOGIC);
END mux64to1;

ARCHITECTURE behavior OF mux64to1 IS

    COMPONENT mux4to1
        PORT (
            x : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            a : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            en : IN STD_LOGIC;
            q : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT mux16to1
        PORT (
            xd : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            dEN : IN STD_LOGIC;
            ad : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            qd : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL qs : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
    u1 : mux16to1
    PORT MAP(xc(63 DOWNTO 48), cEN, ac(3 DOWNTO 0), qs(3));
    u2 : mux16to1
    PORT MAP(xc(47 DOWNTO 32), cEN, ac(3 DOWNTO 0), qs(2));
    u3 : mux16to1
    PORT MAP(xc(31 DOWNTO 16), cEN, ac(3 DOWNTO 0), qs(1));
    u4 : mux16to1
    PORT MAP(xc(15 DOWNTO 0), cEN, ac(3 DOWNTO 0), qs(0));
    u5 : mux4to1
    PORT MAP(qs(3 DOWNTO 0), ac(5 DOWNTO 4), cEN, qc);
END behavior;

CONFIGURATION con OF mux64to1 IS
    FOR behavior
        FOR u1, u2, u3, u4 : mux16to1
            USE ENTITY work.mux16to1(behavior);
        END FOR;
        FOR u5 : mux4to1
            USE ENTITY work.mux4to1(behavior);
        END FOR;
    END FOR;
END con;
