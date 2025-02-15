-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_DDR_Read_Controller.vhd
-- Created: 2021-01-25 07:03:54
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_DDR_Read_Controller
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/Preprocessing Window/Direct 
-- Memory Access/DDR Read Controlle
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_src_DDR_Read_Controller IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        length_in                         :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        address                           :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        start                             :   IN    std_logic;
        rd_aready                         :   IN    std_logic;
        rd_dvalid                         :   IN    std_logic;
        valid_out                         :   OUT   std_logic;
        count_out                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        ready_out                         :   OUT   std_logic;
        rd_addr                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        rd_len                            :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        rd_avalid                         :   OUT   std_logic
        );
END SpectrumAnalyser_src_DDR_Read_Controller;


ARCHITECTURE rtl OF SpectrumAnalyser_src_DDR_Read_Controller IS

  -- Signals
  SIGNAL length_in_unsigned               : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL address_unsigned                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_out_tmp                    : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL rd_addr_tmp                      : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL rd_len_tmp                       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL burst_stop                       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL burst_count                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL rstate                           : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL burst_stop_next                  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL burst_count_next                 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL rstate_next                      : unsigned(3 DOWNTO 0);  -- ufix4

BEGIN
  length_in_unsigned <= unsigned(length_in);

  address_unsigned <= unsigned(address);

  slib_spectrum_analyser_c5_DDR_Read_Controller_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      burst_stop <= to_unsigned(16#0000#, 16);
      burst_count <= to_unsigned(16#0000#, 16);
      rstate <= to_unsigned(16#0#, 4);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        burst_stop <= burst_stop_next;
        burst_count <= burst_count_next;
        rstate <= rstate_next;
      END IF;
    END IF;
  END PROCESS slib_spectrum_analyser_c5_DDR_Read_Controller_process;

  slib_spectrum_analyser_c5_DDR_Read_Controller_output : PROCESS (address_unsigned, burst_count, burst_stop, length_in_unsigned, rd_aready,
       rd_dvalid, rstate, start)
    VARIABLE burst_count_temp : unsigned(15 DOWNTO 0);
    VARIABLE add_temp : unsigned(16 DOWNTO 0);
  BEGIN
    add_temp := to_unsigned(16#00000#, 17);
    burst_count_temp := burst_count;
    burst_stop_next <= burst_stop;
    rstate_next <= rstate;
    -- Create persistent variables (registers)
    -- State Memory Encoding
    -- Read control state machine
    CASE rstate IS
      WHEN "0001" =>
        -- output to AXI4 Master
        rd_addr_tmp <= address_unsigned;
        rd_len_tmp <= to_unsigned(16#0000#, 16);
        rd_avalid <= '0';
        -- output to DUT
        valid_out <= '0';
        ready_out <= '1';
        count_out_tmp <= to_unsigned(16#0000#, 16);
        -- State vars
        burst_count_temp := to_unsigned(16#0000#, 16);
        IF length_in_unsigned(31 DOWNTO 16) /= X"0000" THEN 
          burst_stop_next <= X"FFFF";
        ELSE 
          burst_stop_next <= length_in_unsigned(15 DOWNTO 0);
        END IF;
        IF (rd_aready AND start) = '1' THEN 
          rstate_next <= to_unsigned(16#2#, 4);
        END IF;
      WHEN "0010" =>
        -- output to AXI4 Master
        rd_addr_tmp <= address_unsigned;
        rd_len_tmp <= burst_stop;
        rd_avalid <= '1';
        -- output to DUT
        valid_out <= '0';
        count_out_tmp <= to_unsigned(16#0000#, 16);
        ready_out <= '0';
        rstate_next <= to_unsigned(16#4#, 4);
      WHEN "0100" =>
        -- output to AXI4 Master
        rd_addr_tmp <= address_unsigned;
        rd_len_tmp <= burst_stop;
        rd_avalid <= '0';
        -- output to DUT
        valid_out <= rd_dvalid;
        count_out_tmp <= burst_count;
        ready_out <= '0';
        -- State vars
        IF rd_dvalid = '1' THEN 
          add_temp := resize(burst_count, 17) + to_unsigned(16#00001#, 17);
          IF add_temp(16) /= '0' THEN 
            burst_count_temp := X"FFFF";
          ELSE 
            burst_count_temp := add_temp(15 DOWNTO 0);
          END IF;
        END IF;
        IF burst_count_temp = burst_stop THEN 
          rstate_next <= to_unsigned(16#1#, 4);
        ELSE 
          rstate_next <= to_unsigned(16#4#, 4);
        END IF;
      WHEN OTHERS => 
        -- output to AXI4 Master
        rd_addr_tmp <= to_unsigned(16#00000000#, 32);
        rd_len_tmp <= to_unsigned(16#0000#, 16);
        rd_avalid <= '0';
        -- output to DUT
        valid_out <= '0';
        count_out_tmp <= to_unsigned(16#0000#, 16);
        ready_out <= '0';
        rstate_next <= to_unsigned(16#1#, 4);
    END CASE;
    burst_count_next <= burst_count_temp;
  END PROCESS slib_spectrum_analyser_c5_DDR_Read_Controller_output;


  count_out <= std_logic_vector(count_out_tmp);

  rd_addr <= std_logic_vector(rd_addr_tmp);

  rd_len <= std_logic_vector(rd_len_tmp);

END rtl;

