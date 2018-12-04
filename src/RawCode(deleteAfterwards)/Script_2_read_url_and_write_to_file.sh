#!/bin/bash


# read argument: new string to be added to file
input_string_url="https://github.com/qoolixiloop/qool-markdown-loop/wiki/add-paypal-button"
echo "1.) new input string: $input_string_url"
#-----------------------------------------------------------------------------
# cut out qool-XXX-loop
# -o: only print matching part
pattern_repo="qool-.*-loop"
search_repo=$(echo "$input_string_url" | grep -o "$pattern_repo" )
echo "2.) search repo: $search_repo"

#-----------------------------------------------------------------------------
# pattern to search for 
pattern="^\[.*github\.com\/qoolixiloop\/$search_repo\/wiki.*wiki page"
echo "3.) patter to search: $pattern"

#-----------------------------------------------------------------------------
# list of files to read, search, and write to
file_rw_1="file_rw.md"
file_rw_2="file_rw.md"
file_rw_3="file_rw.md"

echo "1.) read write file: $file_rw_1"

#-----------------------------------------------------------------------------
# awk
# ===
# $0: whole line
# FNR: file number

# only substitute if pattern is found the third time
# '/pattern/{c++;if(c==3){sub("search","replace");c=0}}1' file

# 
awk_found_pattern=$(awk '/'"$pattern"'/ {print (AWK1 $0)}' \
  "$file_rw_1")

# 
awk_found_pattern_on_line=$(awk '/'"$pattern"'/ {print FNR}' \
  "$file_rw_1")

if [[ -n "$awk_found_pattern"  ]]; then 
  echo "1. AWK) found pattern: ${awk_found_pattern}"
  echo "2. AWK) found pattern on line: ${awk_found_pattern_on_line}"
fi

# read string into array
# https://stackoverflow.com/questions/
#         10586153/split-string-into-an-array-in-bash/10586169
# and why all other approaches are wrong
string="I am a string"
readarray -td '' array < <(awk '{ gsub(/, /,"\0"); print; }' <<<"$string, "); 
unset 'array[-1]';
declare -p array;
# print: array to string conversion
echo "${array[@]}"
#-----------------------------------------------------------------------------
# SED
# ===
# sed -options 'command' file
# sed -options 'command' < infile > outfile
# sed -options 'command1; command2' file
# options:
# -n do not print buffer/file
# -i apply/print to file
# -E or -r extended regular expression
# commands for search and print, delete, append, insert:
# N,M[!]p                         print OR [not] line(s)
# /pattern/[!]p                   print or [not] pattern(s)
# /pattern1/,/pattern2/[!]p       print or [not] between patterns
# N,M[!]d  OR  N,M!d              delete OR [not] line(s) 
# /pattern/[!]d                   delete OR [not] pattern(s)
# /pattern1/,/pattern2/[!]d       delete OR [not] between patterns
# N,M[!]a Text                    append Text OR [not] to lines(s) 
# /pattern/[!]a Text              append Text OR [not] to pattern
# /pattern1/,/pattern2/[!]a Text  append Text OR [not] between patterns
# N,M[!]i Text                    insert Text OR [not] to line(s) 
# /pattern/[!]i Text              insert Text OR [not] to pattern
# /pattern1/,/pattern2/[!]i Text  insert Text OR [not] between patterns
# /pattern/=                      print line numbers
# { ; }                           list of commands colon separated
# {p;q}                           print first (p) and quit (q)

# command for search and replace on lines where pattern matches
# Index,/pattern/s/search/replace/sr_options
# Index
# 0              apply only to first match
# sr_options
# g              apply to all search instances
# n              apply only to nth search instance
# p              print only replaced lines
# w file         print to file

# apply only to first match
# -n '/RE/{p;q;}' file       # print only the first match
# '0,/RE/{//d;}' file        # delete only the first match
# '0,/RE/s//to_that/' file   # change only the first match

# regex goups
# search and replace only last occurence of search pattern in line
# \1: print content of first braces
# \2: print content of second braces
# sed -r 's/(.*)search/\1replace/'
# sed -r 's/(.*)search(.*)/\1replace\2/

# cut option 'value'
# -c character(s)
# -f field(s) or column(s)
# -d delimiter for characters
# -d$ delimiter for \n, \t

# print to variable: all matched lines
sed_found_pattern=$(sed -n "/$pattern/p" "$file_rw_1")

# print to variable: line numbers of all matched lines
sed_found_pattern_on_line=$(sed -n "/$pattern/{=;}" "$file_rw_1")

# print to variable:
# all line numbers and matched lines and then cut matched lines
sed_found_pattern_on_line_1=$(sed -n "/$pattern/{=;p;}" "$file_rw_1" \
  | cut -d$ '\n' -f 1)

# print to variable: only first line number of matched line
sed_found_pattern_on_line_2=$(sed -n "/$pattern/=" "$file_rw_1")

if [[ -n "$sed_found_pattern"  ]]; then 
  echo "1.SED) found pattern: ${sed_found_pattern}"
  echo "2.SED) found pattern on line: ${sed_found_pattern_on_line}"
  echo "3.SED) found pattern on line: ${sed_found_pattern_on_line_1}"
  echo "3.SED) found pattern on line: ${sed_found_pattern_on_line_2}"
fi

#-----------------------------------------------------------------------------
# GREP
# ====
# grep options "pattern" file(s)       # apply grep to file(s), directorie(s)
# echo string | grep options "pattern" #apply grep to string
# -E: extended Regex
# -c: count instead of normal ouput
# -n: lines number of matches and line
# -o: only matching part of line
# -v: invert match

# CUT
# ===
# cut option 'value'
# -c character(s)
# -f field(s) or column(s)
# -d delimiter for characters
# -d$ delimiter for \n, \t

# print to variable: all matched lines
grep_found_pattern=$(grep -E "$pattern" "$file_rw_1")

# print to variable: number of matched lines found
grep_found_nr_of_lines=$(grep -E -c "$pattern" "$file_rw_1")

# print to variable: line numbers of all matched lines
grep_found_pattern_on_line=$(grep -E -n "$pattern" "$file_rw_1" | \
  cut -d ':' -f 1)

if [[ -n "$grep_found_pattern"  ]]; then 
  echo "1.GREP) found pattern: ${grep_found_pattern}"
  echo "2.GREP) found pattern on line: ${grep_found_pattern_on_line}"
  echo "3.GREP) found nr or lines: ${grep_found_nr_of_lines}"
fi

if [[ "$grep_found_nr_of_lines" -eq "1"  ]]; then 
  echo "3.GREP) found nr or lines: ${grep_found_nr_of_lines}"
fi

#-----------------------------------------------------------------------------
# BASH: WHILE READ LINE echo LINE to GREP 
# =======================================

# loop through lines, -r do read backslashes '\' literally
line_nr=0
while read -r line; do

  # increment line number counter
  (( line_nr ++ ))

  # -E: extended Reges
  echogrep_found_pattern=$(echo "$line" | grep -E "$pattern")
 
  # -n: if string is not empty 
  if [[ -n "$echogrep_found_pattern"  ]]; then 
    echo "1.ECHOGREP) we are on line nr: $line_nr"
    echo "2.ECHOGREP) we are on line: $line"; 
    echo "3.ECHOGREP) found pattern: ${echogrep_found_pattern}"
  fi

done < "$file_rw_1"
#-----------------------------------------------------------------------------
# SORT, HEAD, TAIL
# ================

# sort
# -r reverse the result 1,2,3 -> 3,2,1
# -n string numerical value
# -o write to file
# -u unique

# example: find min/max in an array
# construct an array
numbers=(1 4 3 5 7 1 10 21 8)

# max: print whole array [@] with newlines \n, 
#      sort array normal or reverse, take first or last
printf "%d\n" "${numbers[@]}" | sort -rn | head -1
printf "%d\n" "${numbers[@]}" | sort -n | tail -1

# min: print whole array [@] with newlines \n, 
#      sort array normal or reverse, take last or last
printf "%d\n" "${numbers[@]}" | sort -rn | tail -1
printf "%d\n" "${numbers[@]}" | sort -n | head -1

#-----------------------------------------------------------------------------
#extract highest line number
awk_max_nr=$awk_found_pattern_on_line
echo "${awk_max_nr}" | sort -n | tail -1
echo "${awk_found_pattern_on_line}" | sort -n | tail -1
echo "${awk_found_pattern_on_line[@]}" | sort -n | tail -1

sed_max_nr="$sed_found_pattern_on_line"
echo "${sed_max_nr}" | sort -n | tail -1
echo "${sed_found_pattern_on_line}" | sort -n | tail -1
echo "${sed_found_pattern_on_line[@]}" | sort -n | tail -1

grep_max_nr="$grep_found_pattern_on_line"
echo "${grep_max_nr}" | sort -n | tail -1
echo "${grep_found_pattern_on_line}" | sort -n | tail -1
echo "${grep_found_pattern_on_line[@]}" | sort -n | tail -1
#-----------------------------------------------------------------------------
# SED APPEND TO LINE
# ==================
N=$(echo "${sed_found_pattern_on_line}" | sort -n | tail -1)
cmd="a"
text="$input_string_url"
file="$file_rw_1"
change=$(sed "$N $cmd $text" "$file")
# diff variable and file
diff <(echo "$change") "$file"
#----------------------------------------------------------------------------
# ITERATE THROUGH FILES
# =====================

# make array of all files
all_files=("$file_rw_1" "$file_rw_2" "$file_rw_3")

# iterate through array
for file in "${all_files[@]}" ; do
    echo "$file"
done

#----------------------------------------------------------------------------
# STRINGS to ARRAYS
# ==================

# string to array
# approach for space separated string
string="this is a string"
array=($string); declare -p array
echo "${array[@]}"

# 2 character separated string
# like comma followed by space [, ]
# not perfect. only perfect solution is the one above with awk
# but still good, remove -d if it does not split e.g. newline separated string
string='Paris, France, Europe'; readarray -td, a <<<"$string"; declare -p a;

# this approach is worse and has several issues
# <                      read file or directory
# <<EOF text EOF         read heredoc
# <<<                    read string
# echo string | command  read string, but command in subshell (not good)
# -r                     read without allowing escape backspaces
# -a                     read string into array
string=', , a, , b, c, , , '; IFS=', ' read -ra a <<<"$string"; declare -p a;

#-----------------------------------------------------------------------------
# ARRAYS TO STRING
# ================

array=(we are array elements); declare -p array;
str="${array[*]}"
echo "$str"
echo "${array[*]}"

#-----------------------------------------------------------------------------
# PRINT ARRAYS [@] vs [*]
# =======================

# output:
# with quotes around myarray[@]
# ARG[@]: 'one'
# ARG[@]: 'two'
# ARG[@]: 'three four'
# with quotes around myarray[*]
# ARG[*]: 'one two three four'
# without quotes around myarray[*]
# ARG[*]: 'one'
# ARG[*]: 'two'
# ARG[*]: 'three'
# ARG[*]: 'four'
# without quotes around myarray[@]
# ARG[@]: 'one'
# ARG[@]: 'two'
# ARG[@]: 'three'
# ARG[@]: 'four'

myarray[0]="one"
myarray[1]="two"
myarray[3]="three four"

# this is what I usually want
echo "with quotes around myarray[@]"
for x in "${myarray[@]}"; do
        echo "ARG[@]: '$x'"
done

# this  is what I do not want
# here shellcheck complains
# echo "with quotes around myarray[*]"
# for x in "${myarray[*]}"; do
#         echo "ARG[*]: '$x'"
# done

# this  is what I do not want
echo "without quotes around myarray[*]"
for x in ${myarray[*]}; do
        echo "ARG[*]: '$x'"
done

# # this  is what I do not want
# # here shellcheck complains
# echo "without quotes around myarray[@]"
# for x in ${myarray[@]}; do
#         echo "ARG[@]: '$x'"
# done

#-----------------------------------------------------------------------------
# ECHO NEWLINES
# =============

# with echo
str=$'Hello World 1\n===========\n'
echo "$str"
echo $'Hello World 2\n===========\n'
echo -e 'Hello World 3\n===========\n'

# with printf: -v: save output to a variable str
printf -v str 'Hello World 3\n===========\n'


#-----------------------------------------------------------------------------
