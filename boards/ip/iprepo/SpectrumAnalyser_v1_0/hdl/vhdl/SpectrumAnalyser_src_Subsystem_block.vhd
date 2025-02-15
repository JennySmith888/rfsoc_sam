-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_Subsystem_block.vhd
-- Created: 2021-01-25 07:03:55
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_Subsystem_block
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Deserializer Real/Subsyste
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_src_Subsystem_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Set                               :   IN    std_logic;
        Reset_1                           :   IN    std_logic;
        Latch                             :   OUT   std_logic
        );
END SpectrumAnalyser_src_Subsystem_block;


ARCHITECTURE rtl OF SpectrumAnalyser_src_Subsystem_block IS

  -- Signals
  SIGNAL Unit_Delay_Resettable_Synchronous_iv : std_logic;
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL Multiport_Switch_out1            : std_logic;
  SIGNAL Unit_Delay_Resettable_Synchronous_toDel : std_logic;
  SIGNAL Unit_Delay_Resettable_Synchronous_out1 : std_logic;

BEGIN
  Unit_Delay_Resettable_Synchronous_iv <= '0';

  Constant_out1 <= '1';

  
  Unit_Delay_Resettable_Synchronous_toDel <= Multiport_Switch_out1 WHEN Reset_1 = '0' ELSE
      Unit_Delay_Resettable_Synchronous_iv;

  Unit_Delay_Resettable_Synchronous_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Resettable_Synchronous_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Resettable_Synchronous_out1 <= Unit_Delay_Resettable_Synchronous_toDel;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Resettable_Synchronous_lowered_process;


  
  Multiport_Switch_out1 <= Unit_Delay_Resettable_Synchronous_out1 WHEN Set = '0' ELSE
      Constant_out1;

  Latch <= Multiport_Switch_out1;

END rtl;

