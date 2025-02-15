-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_Vector_to_SSR_block.vhd
-- Created: 2021-01-25 07:03:55
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_Vector_to_SSR_block
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Serializer Real/Vector to SS
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.SpectrumAnalyser_src_Spectrum_Analyser_pkg.ALL;

ENTITY SpectrumAnalyser_src_Vector_to_SSR_block IS
  PORT( Vector                            :   IN    vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
        SSR                               :   OUT   std_logic_vector(127 DOWNTO 0)  -- ufix128
        );
END SpectrumAnalyser_src_Vector_to_SSR_block;


ARCHITECTURE rtl OF SpectrumAnalyser_src_Vector_to_SSR_block IS

  -- Signals
  SIGNAL Vector_unsigned                  : vector_of_std_logic_vector16(0 TO 7);  -- ufix16 [8]
  SIGNAL Vector_7                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Vector_6                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Vector_5                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Vector_4                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Vector_3                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Vector_2                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Vector_1                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Vector_0                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Bit_Concat_out1                  : unsigned(127 DOWNTO 0);  -- ufix128

BEGIN
  Vector_unsigned <= Vector;

  Vector_7 <= unsigned(Vector_unsigned(7));

  Vector_6 <= unsigned(Vector_unsigned(6));

  Vector_5 <= unsigned(Vector_unsigned(5));

  Vector_4 <= unsigned(Vector_unsigned(4));

  Vector_3 <= unsigned(Vector_unsigned(3));

  Vector_2 <= unsigned(Vector_unsigned(2));

  Vector_1 <= unsigned(Vector_unsigned(1));

  Vector_0 <= unsigned(Vector_unsigned(0));

  Bit_Concat_out1 <= Vector_7 & Vector_6 & Vector_5 & Vector_4 & Vector_3 & Vector_2 & Vector_1 & Vector_0;

  SSR <= std_logic_vector(Bit_Concat_out1);

END rtl;

