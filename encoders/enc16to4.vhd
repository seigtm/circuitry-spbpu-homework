-- 4. Structural priority encoder 16 -> 4 that uses 8->3 encoder entities.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY enc16to4 IS
    PORT (
        input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        enable : IN STD_LOGIC;
        output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        -- Wouble be 0 if and only if either:
        --   1. `input` is all zeroes but `enable` is 1;
        --   2. `input` is any combination but `enable` is 0.
        G : OUT STD_LOGIC);
END enc16to4;

ARCHITECTURE behav OF enc16to4 IS
    COMPONENT enc8to3
        PORT (
            input : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            enable : IN STD_LOGIC;
            output : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            -- Would be 1 if and only if `input` is all zeroes but `enable` is 1.
            EO : INOUT STD_LOGIC;
            -- Wouble be 0 if and only if either:
            --   1. `input` is all zeroes but `enable` is 1;
            --   2. `input` is any combination but `enable` is 0.
            G : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT or2elem
        PORT (
            first : IN STD_LOGIC;
            second : IN STD_LOGIC;
            result : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT not1elem
        PORT (
            value : IN STD_LOGIC;
            result : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL enable_signal : STD_LOGIC;
    SIGNAL output_signal : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL G_signal : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
    -- Encoders 8->3:
    u1 : enc8to3 PORT MAP(input(15 DOWNTO 8), enable, output_signal(5 DOWNTO 3), enable_signal, G_signal(1));
    u2 : enc8to3 PORT MAP(input(7 DOWNTO 0), enable_signal, output_signal(2 DOWNTO 0), OPEN, G_signal(0));

    -- Helpers:
    u3 : or2elem PORT MAP(output_signal(0), output_signal(3), output(0));
    u4 : or2elem PORT MAP(output_signal(1), output_signal(4), output(1));
    u5 : or2elem PORT MAP(output_signal(2), output_signal(5), output(2));
    u6 : or2elem PORT MAP(G_signal(1), G_signal(0), G);
    u7 : not1elem PORT MAP(enable_signal, output(3));
END behav;

CONFIGURATION con OF enc16to4 IS
    FOR behav
        FOR u1, u2 : enc8to3
            USE ENTITY work.enc8to3(behav);
        END FOR;

        FOR u3, u4, u5, u6 : or2elem
            USE ENTITY work.or2elem(behav);
        END FOR;

        FOR u7 : not1elem
            USE ENTITY work.not1elem(behav);
        END FOR;
    END FOR;
END con;