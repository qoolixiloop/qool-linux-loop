#!/bin/bash

# Input arguments
File_to_read_from="$1"
Wait_in_sec="$2"

# File descriptors
exec 3<"$File_to_read_from"

while IFS= read -r -u 3 line; do 
  
  
  # while loop
  # IFS= means no word split
  # read considers a line as one word
  # -n1 means read nr of chars=1 at a time
  while IFS= read -r -n1 char; do
  #for word in ${line[@]}; do 

    # display one character at a time
    # -n means no newline
	  echo -n  "$char"
    #echo -n "$word "

    # then make a little pause
    sleep "$Wait_in_sec" # in units [sec]
  
  done <<< "$line"

  # make a newline
  echo

done
