#!/bin/bash

TEST() {
  
  echo --------------TEST begin------------------------------------------------
  local d
  d=$(date)
  echo "$d"

  # Choose which tests to run
  # set either to "y" or to ""
  # ---------------------------------------------------------------------------
  # Command "a" APPEND:
  local _1_1_a_toAddressRange="y"
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
  local _6_1_s_addressRangeANDregexRange=""
  local _6_2_s_addressRange=""
  local _6_3_s_regexRange=""
  local _6_4_s_addressRangeANDregexRange_oneRegex=""
  local _6_5_s_addressRange_oneLine=""
  local _6_6_s_regexRange_oneRegex=""
  local _6_7_s_noRanges=""
  # ---------------------------------------------------------------------------

  # Command "a" APPEND:
  if [[ -n "$_1_1_a_toAddressRange" ]]; then 
    echo "------------------------------" 
    echo "1.1" 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "4,7" "" "a" "TEXT" "" "" "" ""   
  fi
  if [[ -n "$_1_2_a_toRegexRange" ]]; then 
    echo "------------------------------" 
    echo "1.2 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/,/pattern2/" "a" "TEXT" "" "" "" ""   
  fi
  if [[ -n "$_1_3_a_toAddressRange_oneLine" ]]; then 
    echo "------------------------------" 
    echo "1.3 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "6" "" "a" "TEXT" "" "" "" ""   
  fi
  if [[ -n "$_1_4_a_toRegexRange_oneRegex" ]]; then 
    echo "------------------------------" 
    echo "1.4 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/" "a" "TEXT" "" "" "" ""   
  fi

  # Command "i" INSERT:
  if [[ -n "$_2_1_i_toAddressRange" ]]; then 
    echo "------------------------------" 
    echo "2.1 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "4,7" "" "i" "TEXT" "" "" "" ""   
  fi
  if [[ -n "$_2_2_i_toRegexRange" ]]; then 
    echo "------------------------------" 
    echo "2.2 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/,/pattern2/" "i" "TEXT" "" "" "" ""   
  fi
  if [[ -n "$_2_3_i_toAddressRange_oneLine" ]]; then 
    echo "------------------------------" 
    echo "2.3 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "4" "" "i" "TEXT" "" "" "" ""   
  fi
  if [[ -n "$_2_4_i_toRegexRange_oneRegex" ]]; then 
    echo "------------------------------" 
    echo "2.4 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/" "i" "TEXT" "" "" "" ""   
  fi
  
  # Command "d" DELETE:
  if [[ -n "$_3_1_d_addressRangeANDregexRange" ]]; then 
    echo "------------------------------" 
    echo "3.1 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "/pattern1/,/pattern2/" "d" "" "" "" "" ""   
  fi
  if [[ -n "$_3_2_d_addressRange" ]]; then 
    echo "------------------------------" 
    echo "3.2 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "" "d" "" "" "" "" ""   
  fi
  if [[ -n "$_3_3_d_regexRange" ]]; then 
    echo "------------------------------" 
    echo "3.3 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/,/pattern2/" "d" "" "" "" "" ""   
  fi
  if [[ -n "$_3_4_d_addressRangeANDregexRange_oneRegex" ]]; then 
    echo "------------------------------" 
    echo "3.4 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "/pattern1/" "d" "" "" "" "" ""   
  fi
  if [[ -n "$_3_5_d_addressRange_oneLine" ]]; then 
    echo "------------------------------" 
    echo "3.5 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2" "" "d" "" "" "" "" ""   
  fi
  if [[ -n "$_3_6_d_regexRange_oneRegex" ]]; then 
    echo "------------------------------" 
    echo "3.6 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/" "d" "" "" "" "" ""   
  fi
  
  # Command "=" PRINT LINENUMBERS:
  if [[ -n "$_4_1_eq_addressRangeANDregexRange" ]]; then 
    echo "------------------------------" 
    echo "4.1 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2,7" "/pattern1/,/pattern2/" "=" "" "" "" "" ""   
  fi
  if [[ -n "$_4_2_eq_addressRange" ]]; then 
    echo "------------------------------" 
    echo "4.2 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2,7" "" "=" "" "" "" "" ""   
  fi
  if [[ -n "$_4_3_eq_regexRange" ]]; then 
    echo "------------------------------" 
    echo "4.3 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "" "/pattern1/" "=" "" "" "" "" ""   
  fi
  if [[ -n "$_4_4_eq_addressRangeANDregexRange_oneRegex" ]]; then 
    echo "------------------------------" 
    echo "4.4 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2,7" "/pattern1/" "=" "" "" "" "" ""   
  fi
  if [[ -n "$_4_5_eq_addressRange_oneLine" ]]; then 
    echo "------------------------------" 
    echo "4.5 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2" "" "=" "" "" "" "" ""   
  fi
  if [[ -n "$_4_6_eq_regexRange_oneRegex" ]]; then 
    echo "------------------------------" 
    echo "4.6 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "" "/pattern1/" "=" "" "" "" "" ""   
  fi
  
  # Command "p" PRINT LINECONTENT:
  if [[ -n "$_5_1_p_rangeANDbuffer_into_file" ]]; then 
    echo "------------------------------" 
    echo "5.1 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/" "p" "" "" "" "" ""   
  fi
  if [[ -n "$_5_2_p_lineANDbuffer_into_file" ]]; then 
    echo "------------------------------" 
    echo "5.2 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2" "" "p" "" "" "" "" ""   
  fi
  if [[ -n "$_5_3_p_range_into_file" ]]; then 
    echo "------------------------------" 
    echo "5.3 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "" "/pattern1/,/pattern2/" "p" "" "" "" "" ""   
  fi
  if [[ -n "$_5_4_p_line_into_file" ]]; then 
    echo "------------------------------" 
    echo "5.4 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2" "" "p" "" "" "" "" ""   
  fi
  
  if [[ -n "$_5_5_p_rangeANDbuffer_into_shell" ]]; then 
    echo "------------------------------" 
    echo "5.5 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "/pattern1/,/pattern2/" "p" "" "" "" "" ""   
  fi
  if [[ -n "$_5_6_p_lineANDbuffer_into_shell" ]]; then 
    echo "------------------------------" 
    echo "5.6 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2" "" "p" "" "" "" "" ""   
  fi
  if [[ -n "$_5_7_p_range_into_shell" ]]; then 
    echo "------------------------------" 
    echo "5.7 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2,7" "/pattern1/" "p" "" "" "" "" ""   
  fi
  if [[ -n "$_5_8_p_line_into_shell" ]]; then 
    echo "------------------------------" 
    echo "5.8 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2" "" "p" "" "" "" "" ""   
  fi
  
  if [[ -n "$_5_9_p_rangeANDbuffer_into_variable" ]]; 
  then echo "------------------------------" 
    echo "5.9 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "/pattern1/" "p" "" "" "" "" ""   
  fi
  if [[ -n "$_5_10_p_lineANDbuffer_into_variable" ]]; then 
    echo "------------------------------" 
    echo "5.10 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2" "" "p" "" "" "" "" ""   
  fi
  if [[ -n "$_5_11_p_range_into_variable" ]]; then 
    echo "------------------------------" 
    echo "5.11 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2,7" "" "p" "" "" "" "" ""   
  fi
  if [[ -n "$_5_12_p_line_into_variable" ]]; then 
    echo "------------------------------" 
    echo "5.12 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "-n" "" "2" "" "p" "" "" "" "" ""   
  fi
 
  # Command "s" SUBSTITUTE
  if [[ -n "$_6_1_s_addressRangeANDregexRange" ]]; then 
    echo "------------------------------" 
    echo "6.1 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "/pattern1/,/pattern2/" "s" "" "search1" "replace1" "g"   
  fi
  if [[ -n "$_6_2_s_addressRange" ]]; then 
    echo "------------------------------" 
    echo "6.2 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "" "s" "" "search1" "replace1" "g"   
  fi
  if [[ -n "$_6_3_s_regexRange" ]]; then 
    echo "------------------------------" 
    echo "6.3 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/,/pattern2/" "s" "" "search1" "replace1" "g"  
  fi
  if [[ -n "$_6_4_s_addressRangeANDregexRange_oneRegex" ]]; then 
    echo "------------------------------" 
    echo "6.4 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2,7" "/pattern1/" "s" "" "search1" "replace1" "g"   
  fi
  if [[ -n "$_6_5_s_addressRange_oneLine" ]]; then 
    echo "------------------------------" 
    echo "6.5 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "2" "" "s" "" "search1" "replace1" "g"   
  fi
  if [[ -n "$_6_6_s_regexRange_oneRegex" ]]; then 
    echo "------------------------------" 
    echo "6.6 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "/pattern1/" "s" "" "search1" "replace1" "g"   
  fi
  if [[ -n "$_6_7_s_noRanges" ]]; then 
    echo "------------------------------" 
    echo "6.6 " 
    echo "------------------------------" 
    ./Script_4_sed_wrapper.sh  "file_r.md" "file_w.md" \
      "" "" "" "" "s" "" "search1" "replace1" "g"   
  fi

  echo --------------TEST end--------------------------------------------------
}

# call TEST function
TEST
