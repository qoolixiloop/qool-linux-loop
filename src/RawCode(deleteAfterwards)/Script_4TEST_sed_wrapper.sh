#!/bin/bash

# SED Wrapper test script
# Author: Roland Benz
# Date: 9. Dec. 2018 

TEST() {
  
  # Choose which tests to run
  # set either to "y" or to ""
  # ---------------------------------------------------------------------------
  # Command "a" APPEND:
  local _1_1_a_toAddressRange=""
  local _1_2_a_toRegexRange=""
  local _1_3_a_toAddressRange_oneLine=""
  local _1_4_a_toRegexRange_oneRegex=""

  # Command "i" INSERT:
  local _2_1_i_toAddressRange=""
  local _2_2_i_toRegexRange=""
  local _2_3_i_toAddressRange_oneLine=""
  local _2_4_i_toRegexRange_oneRegex=""
  
  # Command "d" DELETE:
  local _3_1_d_addressRangeANDregexRange=""
  local _3_2_d_addressRange=""
  local _3_3_d_regexRange=""
  local _3_4_d_addressRangeANDregexRange_oneRegex=""
  local _3_5_d_addressRange_oneLine=""
  local _3_6_d_regexRange_oneRegex=""
  
  # Command "=" PRINT LINENUMBERS:
  local _4_1_eq_addressRangeANDregexRange=""
  local _4_2_eq_addressRange=""
  local _4_3_eq_regexRange=""
  local _4_4_eq_addressRangeANDregexRange_oneRegex=""
  local _4_5_eq_addressRange_oneLine=""
  local _4_6_eq_regexRange_oneRegex=""
  
  # Command "p" PRINT LINECONTENT:
  local _5_1_p_rangeANDbuffer_into_file=""
  local _5_2_p_lineANDbuffer_into_file=""
  local _5_3_p_range_into_file=""
  local _5_4_p_line_into_file=""
  
  local _5_5_p_rangeANDbuffer_into_shell=""
  local _5_6_p_lineANDbuffer_into_shell=""
  local _5_7_p_range_into_shell=""
  local _5_8_p_line_into_shell=""
  
  local _5_9_p_rangeANDbuffer_into_variable=""
  local _5_10_p_lineANDbuffer_into_variable=""
  local _5_11_p_range_into_variable=""
  local _5_12_p_line_into_variable=""

  # Command "s" SUBSTITUTE
  local _6_1_s_addressRangeANDregexRange="y"
  local _6_2_s_addressRange="y"
  local _6_3_s_regexRange="y"
  local _6_4_s_addressRangeANDregexRange_oneRegex="y"
  local _6_5_s_addressRange_oneLine="y"
  local _6_6_s_regexRange_oneRegex="y"
  local _6_7_s_noRanges="y"
  # ---------------------------------------------------------------------------

  # Command "a" APPEND:
  if [[ -n "$_1_1_a_toAddressRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "4,7" "" "a" "TEXT" "" ""
  fi
  if [[ -n "$_1_2_a_toRegexRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/,/pattern2/" "a" "TEXT" "" ""
  fi
  if [[ -n "$_1_3_a_toAddressRange_oneLine" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "6" "" "a" "TEXT" "" ""
  fi
  if [[ -n "$_1_4_a_toRegexRange_oneRegex" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/" "a" "TEXT" "" ""
  fi

  # Command "i" INSERT:
  if [[ -n "$_2_1_i_toAddressRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "4,7" "" "i" "TEXT" "" ""
  fi
  if [[ -n "$_2_2_i_toRegexRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/,/pattern2/" "i" "TEXT" "" ""
  fi
  if [[ -n "$_2_3_i_toAddressRange_oneLine" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "4" "" "i" "TEXT" "" ""
  fi
  if [[ -n "$_2_4_i_toRegexRange_oneRegex" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/" "i" "TEXT" "" ""
  fi
  
  # Command "d" DELETE:
  if [[ -n "$_3_1_d_addressRangeANDregexRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "/pattern1/,/pattern2/" "d" "" "" ""
  fi
  if [[ -n "$_3_2_d_addressRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "" "d" "" "" ""
  fi
  if [[ -n "$_3_3_d_regexRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/,/pattern2/" "d" "" "" ""
  fi
  if [[ -n "$_3_4_d_addressRangeANDregexRange_oneRegex" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "/pattern1/" "d" "" "" ""
  fi
  if [[ -n "$_3_5_d_addressRange_oneLine" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2" "" "d" "" "" ""
  fi
  if [[ -n "$_3_6_d_regexRange_oneRegex" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/" "d" "" "" ""
  fi
  
  # Command "=" PRINT LINENUMBERS:
  if [[ -n "$_4_1_eq_addressRangeANDregexRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2,7" "/pattern1/,/pattern2/" "=" "" "" ""
  fi
  if [[ -n "$_4_2_eq_addressRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2,7" "" "=" "" "" ""
  fi
  if [[ -n "$_4_3_eq_regexRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "" "/pattern1/" "=" "" "" ""
  fi
  if [[ -n "$_4_4_eq_addressRangeANDregexRange_oneRegex" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2,7" "/pattern1/" "=" "" "" ""
  fi
  if [[ -n "$_4_5_eq_addressRange_oneLine" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2" "" "=" "" "" ""
  fi
  if [[ -n "$_4_6_eq_regexRange_oneRegex" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "" "/pattern1/" "=" "" "" ""
  fi
  
  # Command "p" PRINT LINECONTENT:
  if [[ -n "$_5_1_p_rangeANDbuffer_into_file" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/" "p" "" "" ""
  fi
  if [[ -n "$_5_2_p_lineANDbuffer_into_file" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2" "" "p" "" "" ""
  fi
  if [[ -n "$_5_3_p_range_into_file" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "" "/pattern1/,/pattern2/" "p" "" "" ""   
  fi
  if [[ -n "$_5_4_p_line_into_file" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2" "" "p" "" "" ""
  fi
  
  if [[ -n "$_5_5_p_rangeANDbuffer_into_shell" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "" \
      "" "" "2,7" "/pattern1/,/pattern2/" "p" "" "" ""
  fi
  if [[ -n "$_5_6_p_lineANDbuffer_into_shell" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "" \
      "" "" "2" "" "p" "" "" ""
  fi
  if [[ -n "$_5_7_p_range_into_shell" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "" \
      "-n" "" "2,7" "/pattern1/" "p" "" "" ""
  fi
  if [[ -n "$_5_8_p_line_into_shell" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "" \
      "-n" "" "2" "" "p" "" "" ""
  fi
  
  if [[ -n "$_5_9_p_rangeANDbuffer_into_variable" ]]; then 
    var_5_9=$(./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "/pattern1/" "p" "" "" "")
    echo "var_5_9::: ${var_5_9}"
  fi
  if [[ -n "$_5_10_p_lineANDbuffer_into_variable" ]]; then 
    var_5_10=$(./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2" "" "p" "" "" "")
    echo "var_5_10::: ${var_5_10[*]}"
  fi
  if [[ -n "$_5_11_p_range_into_variable" ]]; then 
    var_5_11=$(./Script_4_sed_wrapper.sh  "file_r.md" "" \
      "-n" "" "2,7" "" "p" "" "" "")
    echo "var_5_11::: ${var_5_11[*]}"
  fi
  if [[ -n "$_5_12_p_line_into_variable" ]]; then 
    var_5_12=$(./Script_4_sed_wrapper.sh  "file_r.md" "" \
      "-n" "" "2" "" "p" "" "" "")
    echo "var_5_12::: ${var_5_12[*]}"
  fi
 
  # Command "s" SUBSTITUTE
  if [[ -n "$_6_1_s_addressRangeANDregexRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "/pattern1/,/pattern2/" "s" "g" "search1" "replace1"   
  fi
  if [[ -n "$_6_2_s_addressRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "" "s" "g" "search1" "replace1"
  fi
  if [[ -n "$_6_3_s_regexRange" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/,/pattern2/" "s" "g" "search1" "replace1"
  fi
  if [[ -n "$_6_4_s_addressRangeANDregexRange_oneRegex" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "/pattern1/" "s" "g" "search1" "replace1"
  fi
  if [[ -n "$_6_5_s_addressRange_oneLine" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2" "" "s" "g" "search1" "replace1"
  fi
  if [[ -n "$_6_6_s_regexRange_oneRegex" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/" "s" "g" "search1" "replace1"
  fi
  if [[ -n "$_6_7_s_noRanges" ]]; then 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "" "s" "g" "search1" "replace1"
  fi

}

# call TEST function
TEST
