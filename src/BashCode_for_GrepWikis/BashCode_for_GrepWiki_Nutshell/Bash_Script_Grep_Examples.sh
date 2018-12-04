#!/bin/bash

# Bash Script for: Linux Wiki; grep-in-a-nushell.md
# Author: Roland Benz
# Date: 4. Dec. 2018
# Which task to run? 
#   Start script as follows, '?' as a placeholder  for 1-24: 
#      $ EX=? ./filename.sh
# ----------------------------------------------------------------------------

main() {
  
  # assign global variable
  local ex="$EX"

  #Ex.1)
  if [[ "$ex" -eq 1  ]]; then 
    echo "Ex.1"
    grep -E --color 'spanish | give' ./foo/dar.txt
  fi  
  #Ex.2)
  if [[ "$ex" -eq 2  ]]; then 
    echo "Ex.2"
    grep -E --color 'spanish' ./foo/dar.txt | grep 'give'
  fi  
  #Ex.3)
  if [[ "$ex" -eq 3  ]]; then 
    echo "Ex.3"
    #shellcheck disable=2002
    cat ./foo/car.txt | grep -E --color 'cool' - ./foo/dar.txt  
  fi  
  #Ex.4)
  if [[ "$ex" -eq 4  ]]; then 
    echo "Ex.4.a"
    printf 'foo bla\nbla bar\n' | grep -E --color -z 'foo.*[[:space:]]\+.*bar'
    echo "Ex.4.b"
    printf 'foo bla\nbla bar\n' | grep --color -z 'foo.*[[:space:]]\+.*bar'
  fi  
  #Ex.5)
  if [[ "$ex" -eq 5  ]]; then 
    echo "Ex.5"
    grep -E --color -l 'cool' ./foo/*.txt
  fi  
  #Ex.6)
  if [[ "$ex" -eq 6  ]]; then 
    echo "Ex.6"
    grep -E --color -r 'cool' ./foo
  fi  
  #Ex.7)
  if [[ "$ex" -eq 7  ]]; then 
    echo "Ex.7"
    find ./foo -name '*.txt' -print0 | xargs -0r grep -E --color -H 'cool'
  fi  
  #Ex.8)
  if [[ "$ex" -eq 8  ]]; then 
    echo "Ex.8"
    grep -E --color -H 'cool' ./foo/*.txt
  fi  
  #Ex.9)
  if [[ "$ex" -eq 9  ]]; then 
    echo "Ex.9"
    grep -E --color -r --include='*.txt' 'cool' ./foo
  fi  
  #Ex.10)
  if [[ "$ex" -eq 10 ]]; then 
    echo "Ex.10"
    #shellcheck disable=2062
    grep -E --color -r -e '--co op--' ./foo
  fi  
  #Ex.11)
  if [[ "$ex" -eq 11 ]]; then 
    echo "Ex.11"
    grep -E --color -r -w 'pool' ./foo
  fi  
  #Ex.12)
  if [[ "$ex" -eq 12 ]]; then 
    echo "Ex.12"
    grep -E --color -r 'pool\>' ./foo
  fi  
  #Ex.13)
  if [[ "$ex" -eq 13 ]]; then 
    echo "Ex.13"
    grep -E --color -C 1 '500' ./foo/*
  fi  
  #Ex.14)
  if [[ "$ex" -eq 14 ]]; then 
    echo "Ex.14.a"
    grep -E --color -H 'cool' ./foo/car.txt  
    echo "Ex.14.b"
    grep -E --color 'cool' ./foo/car.txt /dev/null  
  fi  
  #Ex.15)
  if [[ "$ex" -eq 15 ]]; then 
    echo "Ex.15.a"
    #shellcheck disable=2009
    ps -ef | grep -E --color '[c]ron'
    echo "Ex.15.b"
    pgrep -al 'cron'
  fi  
  #Ex.16)
  if [[ "$ex" -eq 16 ]]; then 
    echo "Ex.16"
    grep -E --color -r -w -e '(.)(.).\2\1' ./foo
  fi  
  #Ex.17)
  if [[ "$ex" -eq 17 ]]; then 
    echo "Ex.17"
    echo 'ja' | grep -E --color '(a)\1|j\1'
  fi  
  #Ex.18)
  if [[ "$ex" -eq 18 ]]; then 
    echo "Ex.18"
    grep -E --color -r -lv 'cool' ./foo
  fi  
  #Ex.19)
  if [[ "$ex" -eq 19 ]]; then 
    echo "Ex.19"
    grep -E --color -r -L 'cool' ./foo
  fi  
  #Ex.20)
  if [[ "$ex" -eq 20 ]]; then 
    echo "Ex.20"
    grep -E --color -r -Lv 'cool' ./foo
  fi  
  #Ex.21)
  if [[ "$ex" -eq 21 ]]; then 
    echo "Ex.21.a"
    grep -E --color '' ./foo/car.txt
    echo "Ex.21.b"
    grep -E --color '^' ./foo/car.txt
    echo "Ex.21.c"
    grep -E --color '$' ./foo/car.txt
    echo "Ex.21.d"
    #shellcheck disable=2063
    grep -E --color '.*' ./foo/car.txt  
  fi  
  #Ex.22)
  if [[ "$ex" -eq 22 ]]; then 
    echo "Ex.22"
    grep -E --color -r '^$' ./foo
  fi  
  #Ex.23)
  if [[ "$ex" -eq 23 ]]; then 
    echo "Ex.23"
    grep -E --color -r -n '^[[:blank:]]*$' ./foo
  fi  
  #Ex.24)
  if [[ "$ex" -eq 24 ]]; then 
    echo "Ex.24"
    grep -E --color -r -f /dev/null ./foo
  fi  
}
main "$EX"
