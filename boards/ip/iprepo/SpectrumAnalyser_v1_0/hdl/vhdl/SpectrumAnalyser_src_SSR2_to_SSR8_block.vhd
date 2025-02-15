-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_SSR2_to_SSR8_block.vhd
-- Created: 2021-01-25 07:03:55
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_SSR2_to_SSR8_block
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Serializer Real/SSR2 to SSR
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.SpectrumAnalyser_src_Spectrum_Analyser_pkg.ALL;

ENTITY SpectrumAnalyser_src_SSR2_to_SSR8_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Data_In                           :   IN    vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
        Index                             :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        Valid_In                          :   IN    std_logic;
        Data_Out                          :   OUT   vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
        Valid_Out                         :   OUT   std_logic
        );
END SpectrumAnalyser_src_SSR2_to_SSR8_block;


ARCHITECTURE rtl OF SpectrumAnalyser_src_SSR2_to_SSR8_block IS

  -- Signals
  SIGNAL Data_In_unsigned                 : vector_of_std_logic_vector16(0 TO 7);  -- ufix16 [8]
  SIGNAL Index_unsigned                   : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Compare_To_Constant8_out1        : std_logic;
  SIGNAL AND_out1                         : std_logic;
  SIGNAL Selector12_out1                  : vector_of_std_logic_vector16(0 TO 1);  -- ufix16 [2]
  SIGNAL Selector12_out1_1                : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Unit_Delay_Enabled_Synchronous_ectrl : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Compare_To_Constant9_out1        : std_logic;
  SIGNAL AND1_out1                        : std_logic;
  SIGNAL Selector9_out1                   : vector_of_std_logic_vector16(0 TO 1);  -- ufix16 [2]
  SIGNAL Selector9_out1_1                 : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Unit_Delay_Enabled_Synchronous1_out1 : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Unit_Delay_Enabled_Synchronous1_ectrl : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Compare_To_Constant10_out1       : std_logic;
  SIGNAL AND2_out1                        : std_logic;
  SIGNAL Selector10_out1                  : vector_of_std_logic_vector16(0 TO 1);  -- ufix16 [2]
  SIGNAL Selector10_out1_1                : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Unit_Delay_Enabled_Synchronous2_out1 : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Unit_Delay_Enabled_Synchronous2_ectrl : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Compare_To_Constant11_out1       : std_logic;
  SIGNAL AND3_out1                        : std_logic;
  SIGNAL Selector11_out1                  : vector_of_std_logic_vector16(0 TO 1);  -- ufix16 [2]
  SIGNAL Selector11_out1_1                : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Unit_Delay_Enabled_Synchronous3_out1 : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Unit_Delay_Enabled_Synchronous3_ectrl : vector_of_unsigned16(0 TO 1);  -- uint16 [2]
  SIGNAL Vector_Concatenate_out1          : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL Delay_out1                       : std_logic;

BEGIN
  Data_In_unsigned <= Data_In;

  Index_unsigned <= unsigned(Index);

  
  Compare_To_Constant8_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#0#, 2) ELSE
      '0';

  AND_out1 <= Valid_In AND Compare_To_Constant8_out1;

  Selector12_out1(0) <= Data_In_unsigned(0);
  Selector12_out1(1) <= Data_In_unsigned(1);

  outputgen4: FOR k IN 0 TO 1 GENERATE
    Selector12_out1_1(k) <= unsigned(Selector12_out1(k));
  END GENERATE;

  
  Unit_Delay_Enabled_Synchronous_ectrl(0) <= Unit_Delay_Enabled_Synchronous_out1(0) WHEN AND_out1 = '0' ELSE
      Selector12_out1_1(0);
  
  Unit_Delay_Enabled_Synchronous_ectrl(1) <= Unit_Delay_Enabled_Synchronous_out1(1) WHEN AND_out1 = '0' ELSE
      Selector12_out1_1(1);

  Unit_Delay_Enabled_Synchronous_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous_out1(0) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous_out1(1) <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1(0) <= Unit_Delay_Enabled_Synchronous_ectrl(0);
        Unit_Delay_Enabled_Synchronous_out1(1) <= Unit_Delay_Enabled_Synchronous_ectrl(1);
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_lowered_process;


  
  Compare_To_Constant9_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#1#, 2) ELSE
      '0';

  AND1_out1 <= Valid_In AND Compare_To_Constant9_out1;

  Selector9_out1(0) <= Data_In_unsigned(0);
  Selector9_out1(1) <= Data_In_unsigned(1);

  outputgen3: FOR k IN 0 TO 1 GENERATE
    Selector9_out1_1(k) <= unsigned(Selector9_out1(k));
  END GENERATE;

  
  Unit_Delay_Enabled_Synchronous1_ectrl(0) <= Unit_Delay_Enabled_Synchronous1_out1(0) WHEN AND1_out1 = '0' ELSE
      Selector9_out1_1(0);
  
  Unit_Delay_Enabled_Synchronous1_ectrl(1) <= Unit_Delay_Enabled_Synchronous1_out1(1) WHEN AND1_out1 = '0' ELSE
      Selector9_out1_1(1);

  Unit_Delay_Enabled_Synchronous1_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous1_out1(0) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous1_out1(1) <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous1_out1(0) <= Unit_Delay_Enabled_Synchronous1_ectrl(0);
        Unit_Delay_Enabled_Synchronous1_out1(1) <= Unit_Delay_Enabled_Synchronous1_ectrl(1);
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous1_lowered_process;


  
  Compare_To_Constant10_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#2#, 2) ELSE
      '0';

  AND2_out1 <= Valid_In AND Compare_To_Constant10_out1;

  Selector10_out1(0) <= Data_In_unsigned(0);
  Selector10_out1(1) <= Data_In_unsigned(1);

  outputgen2: FOR k IN 0 TO 1 GENERATE
    Selector10_out1_1(k) <= unsigned(Selector10_out1(k));
  END GENERATE;

  
  Unit_Delay_Enabled_Synchronous2_ectrl(0) <= Unit_Delay_Enabled_Synchronous2_out1(0) WHEN AND2_out1 = '0' ELSE
      Selector10_out1_1(0);
  
  Unit_Delay_Enabled_Synchronous2_ectrl(1) <= Unit_Delay_Enabled_Synchronous2_out1(1) WHEN AND2_out1 = '0' ELSE
      Selector10_out1_1(1);

  Unit_Delay_Enabled_Synchronous2_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous2_out1(0) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous2_out1(1) <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous2_out1(0) <= Unit_Delay_Enabled_Synchronous2_ectrl(0);
        Unit_Delay_Enabled_Synchronous2_out1(1) <= Unit_Delay_Enabled_Synchronous2_ectrl(1);
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous2_lowered_process;


  
  Compare_To_Constant11_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#3#, 2) ELSE
      '0';

  AND3_out1 <= Valid_In AND Compare_To_Constant11_out1;

  Selector11_out1(0) <= Data_In_unsigned(0);
  Selector11_out1(1) <= Data_In_unsigned(1);

  outputgen1: FOR k IN 0 TO 1 GENERATE
    Selector11_out1_1(k) <= unsigned(Selector11_out1(k));
  END GENERATE;

  
  Unit_Delay_Enabled_Synchronous3_ectrl(0) <= Unit_Delay_Enabled_Synchronous3_out1(0) WHEN AND3_out1 = '0' ELSE
      Selector11_out1_1(0);
  
  Unit_Delay_Enabled_Synchronous3_ectrl(1) <= Unit_Delay_Enabled_Synchronous3_out1(1) WHEN AND3_out1 = '0' ELSE
      Selector11_out1_1(1);

  Unit_Delay_Enabled_Synchronous3_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous3_out1(0) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous3_out1(1) <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous3_out1(0) <= Unit_Delay_Enabled_Synchronous3_ectrl(0);
        Unit_Delay_Enabled_Synchronous3_out1(1) <= Unit_Delay_Enabled_Synchronous3_ectrl(1);
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous3_lowered_process;


  Vector_Concatenate_out1(0) <= Unit_Delay_Enabled_Synchronous_out1(0);
  Vector_Concatenate_out1(1) <= Unit_Delay_Enabled_Synchronous_out1(1);
  Vector_Concatenate_out1(2) <= Unit_Delay_Enabled_Synchronous1_out1(0);
  Vector_Concatenate_out1(3) <= Unit_Delay_Enabled_Synchronous1_out1(1);
  Vector_Concatenate_out1(4) <= Unit_Delay_Enabled_Synchronous2_out1(0);
  Vector_Concatenate_out1(5) <= Unit_Delay_Enabled_Synchronous2_out1(1);
  Vector_Concatenate_out1(6) <= Unit_Delay_Enabled_Synchronous3_out1(0);
  Vector_Concatenate_out1(7) <= Unit_Delay_Enabled_Synchronous3_out1(1);

  outputgen: FOR k IN 0 TO 7 GENERATE
    Data_Out(k) <= std_logic_vector(Vector_Concatenate_out1(k));
  END GENERATE;

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay_out1 <= AND3_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Valid_Out <= Delay_out1;

END rtl;

