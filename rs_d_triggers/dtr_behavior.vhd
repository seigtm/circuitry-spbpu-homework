LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dtr_behavior IS
    PORT (
        data : IN STD_LOGIC;
        control : IN STD_LOGIC;
        output : OUT STD_LOGIC;
        output_inv : OUT STD_LOGIC);
END dtr_behavior;

ARCHITECTURE behavior OF dtr_behavior IS
    SIGNAL value : STD_LOGIC;
BEGIN
    PROCESS (data, control) BEGIN
        IF control = '1' THEN
            value <= data;
        ELSE
            value <= value;
        END IF;
    END PROCESS;
    output <= value;
    output_inv <= NOT(value);
END behavior;