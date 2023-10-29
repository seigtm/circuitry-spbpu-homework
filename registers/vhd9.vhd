LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY vhd9 IS
    PORT (
        x1, x2, x3, x4, read, write, reset : IN STD_LOGIC;
        q1, q2, q3, q4 : INOUT STD_LOGIC);
END vhd9;

ARCHITECTURE behavior OF vhd9 IS
    SIGNAL i1, i2, i3, i4 : STD_LOGIC;
BEGIN
    PROCESS (x1, write, reset, read)
    BEGIN
        IF reset = '0' THEN
            i1 <= '0';
        ELSIF reset = '1' THEN
            IF (write = '1') THEN
                i1 <= x1;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (x2, write, reset, read)
    BEGIN
        IF reset = '0' THEN
            i2 <= '0';
        ELSIF reset = '1' THEN
            IF write = '1' THEN
                i2 <= x2;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (x3, write, reset, read)
    BEGIN
        IF reset = '0' THEN
            i3 <= '0';
        ELSIF reset = '1' THEN
            IF write = '1' THEN
                i3 <= x3;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (x4, write, reset, read)
    BEGIN
        IF reset = '0' THEN
            i4 <= '0';
        ELSIF reset = '1' THEN
            IF write = '1' THEN
                i4 <= x4;
            END IF;
        END IF;
    END PROCESS;

    q1 <= i1 AND read;
    q2 <= i2 AND read;
    q3 <= i3 AND read;
    q4 <= i4 AND read;

END behavior;