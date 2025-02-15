-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_Convert_Data.vhd
-- Created: 2021-01-25 07:03:52
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_Convert_Data
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/Convert 
-- Dat
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_src_Convert_Data IS
  PORT( Valid_Real                        :   IN    std_logic;
        Valid_Imag                        :   IN    std_logic;
        Data_Real                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        Data_Imag                         :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        Data_Out_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        Data_Out_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        Valid                             :   OUT   std_logic
        );
END SpectrumAnalyser_src_Convert_Data;


ARCHITECTURE rtl OF SpectrumAnalyser_src_Convert_Data IS

  -- Signals
  SIGNAL Data_Real_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Data_Type_Conversion_out1        : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Data_Imag_unsigned               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Data_Type_Conversion1_out1       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL AND_out1                         : std_logic;

BEGIN
  Data_Real_unsigned <= unsigned(Data_Real);

  Data_Type_Conversion_out1 <= signed(Data_Real_unsigned);

  Data_Out_re <= std_logic_vector(Data_Type_Conversion_out1);

  Data_Imag_unsigned <= unsigned(Data_Imag);

  Data_Type_Conversion1_out1 <= signed(Data_Imag_unsigned);

  Data_Out_im <= std_logic_vector(Data_Type_Conversion1_out1);

  AND_out1 <= Valid_Real AND Valid_Imag;

  Valid <= AND_out1;

END rtl;

