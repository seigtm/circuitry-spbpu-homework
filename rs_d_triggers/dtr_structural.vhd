LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dtr_structural IS
    PORT (
        data : IN STD_LOGIC;
        control : IN STD_LOGIC;
        output : INOUT STD_LOGIC;
        output_inv : INOUT STD_LOGIC);
END dtr_structural;

ARCHITECTURE behav OF dtr_structural IS
    COMPONENT notand
        PORT (
            a : IN STD_LOGIC;
            b : IN STD_LOGIC;
            c : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT rstr_structural
        PORT (
            s : IN STD_LOGIC;
            r : IN STD_LOGIC;
            q : INOUT STD_LOGIC;
            qb : INOUT STD_LOGIC);
    END COMPONENT;

    SIGNAL SIG_D_INV : STD_LOGIC;
    SIGNAL SIG_CL_INV : STD_LOGIC;

BEGIN
    u0 : rstr_structural
    PORT MAP(SIG_D_INV, SIG_CL_INV, output, output_inv);
    u1 : notand
    PORT MAP(data, control, SIG_D_INV);
    u2 : notand
    PORT MAP(SIG_D_INV, control, SIG_CL_INV);
END behav;

CONFIGURATION con OF dtr_structural IS
    FOR behav
        FOR u1, u2 : notand
            USE ENTITY work.notand(behav);
        END FOR;
        FOR u0 : rstr_structural
            USE ENTITY work.rstr_structural(behav);
        END FOR;
    END FOR;
END con;