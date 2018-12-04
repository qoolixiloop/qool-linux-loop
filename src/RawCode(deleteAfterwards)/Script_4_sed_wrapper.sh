sed_Wrapper() {

  #============================================================================
  #doc_begin; help_begin-------------------------------------------------------
  # ---------------------------------------------------------------------------
  # sed_search_replace(): For Task II: 
  # Purpose: 
  #   A wrapper with predefined SED strings.
  #   Serves as a reminder of the syntax for the different SED Commands
  #
  # Arguments:
  #  There are a lot of input arguments, and they must all be passed at the 
  #  right position, for the function to work. Not used arguments are passed
  #  as an own separate empty string "". Because I only use the function
  #  programmatically, this is rather an advantage than a disadvantage.
  #   $1: file; the input file to read from; will be overwritten by $2
  #   $2  filetmp; the output file to write to; overwrites $1
  #   $3  commandLineOptions; SED Options; see "$ sed --help";
  #                           -E is hard coded here 
  #                           e.g. use -n with command 'p' or command '='
  #   $4  separator"; use it, if your strings contain many "/"
  #   $5  addressRange; either "N_from,M_to" or "M"
  #   $6  regexPattern; either "/reg_from/,/reg_to/" or "/reg/"
  #   $7  command; one of "a, i, d, p, =, s" (see "$ man sed" for a list)
  #   $8  commandOptions "for a,i:'TEXT' to add; for s: 'g' or '' "
  #   ${9} substituteSearch; reg
  #   ${10} substituteReplace; text
  # 
  # SED: Usage
  #  SED -E sedOptions sedScript <inputfile >outputFile
  #
  # REGEX Extended 
  #   1.)  use sedOption -E (set here by default) 
  #   2.)  Literal vs Special meaning  of characters and digits
  #   2.1) Escape "\" rules of extended Regex:
  #          a-z, A-Z, 0-9: all have literal meaning unescaped
  #          \a-\z, \A-\Z : some have special meaning escaped
  #          \specialCharacters: all have literal meaning escaped
  #         specialCharacters: some have special meaning unescaped 
  #   2.2) additional escape "\" rules of SED specific special characters:
  #          ": used to build the command string -> must be escaped everywhere
  #          /: used to separate command strings -> must be escaped everywhere
  #             or use a new separator, e.g. | or #
  #          ': must not be escaped
  #
  # Source to learn SED
  #   $ info sed  ("$ man sed", and "$ sed --help" are just summaries)
  #
  # In a nutshell, how SED work
  #   Because Regex as well as SED commands and options are single characters,
  #   digits or symbols, they are not easy to read, but extremly compact and
  #   short in size.
  #   By default SED reads a file line by line, and applies the whole sedScript
  #   to one line at a time. This is called a cycle. But the default behaviour 
  #   can be changed by certain commands. It is even possible to read a whole
  #   file without ever ending one cycle.
  #   SED has two buffers, called pattern space and holding space.
  #   The pattern space is a one line buffer, where the whole sedScript is 
  #   applied for each line of the file. Before a new line is read, this 
  #   buffer is emptied. 
  #   The holding space is a multi line buffer. It gets it's input
  #   from the pattern space buffer. 
  #   Because there is a mechanism to switch the content of the two buffers, 
  #   the pattern space buffer can actually hold several lines of a file, 
  #   to which the whole sedScript is applied in one cycle. 
  #   There is also a mechanism to jump to labels within the sedScript, 
  #   which can be used to skip certain commands of the sedScript, similar to 
  #   the goto command in certain languages. 
  #   SED has no if-else statments, but it has a mechanism to determine lines, 
  #   to which the commands of the sedScript shall be applied. 
  #   This is either a "line number from,line number to" range, 
  #   a "regex from,regex to" range, or just a regex. 
  #   For certain commands, like substitute "s" or delete "d", it is even
  #   possible to define both a line number and a regex range.
  # ---------------------------------------------------------------------------
  #doc_end; help_end-----------------------------------------------------------
  [[ $DEBUG == 'y' ]] && echo "--$LINENO ${BASH_SOURCE[0]}:sed_search_replace()"
  # ---------------------------------------------------------------------------
  #============================================================================

  echo "entering sed_wrapper()"

  # INPUT: arguments
  local file="$1"
  local filetmp="$2"
  local commandLineOptions="$3"
  local separator="$4"
  local addressRange="$5"
  local regexRange="$6"
  local command="$7"
  local commandOptions="$8"
  local substituteSearch="${9}"
  local substituteReplace="${10}"

  # sedScript: holds the instructions applied to each line of the file 
  local sedScript 

  # CHECK: input arguments
  echo "file: $file"
  echo "filetmp: $filetmp"
  echo "commandLineOptions: $commandLineOptions"
  echo "separator: $separator"
  echo "addressRange: $addressRange"
  echo "regexRange: $regexRange"
  echo "command: $command"
  echo "commandOptions: $commandOptions"
  echo "substituteSearch: $substituteSearch"
  echo "substituteReplace: $substituteReplace"


  #CHECK: number of arguments
  if [[ "$#" -ne 10 ]]; then
    echo "ERROR: number of arguments: $#; but should be 10"
    return
  fi
  echo "number of arguments: $#"

  #EMPTY: empty the file to write to 
  if [[ -n "$filetmp" ]]; then 
    echo "---------------------EMPTY begin------------------------------------"
    true > "$filetmp"
    echo "---------------------EMPTY end--------------------------------------"
  fi


  echo "---------------------BUILD_SED_SCIPT begin-----------------------"
  # Depending on the command used, the SedScript can have different forms:
  #
  #   [addressRange] {command  [commandOptions]; command [commandOptions]; ...}
  #   [regexRange] {command [commandOptions]; command [commandOptions]; ...}
  # ---------------------------------------------------------------------------
  # apply default separator, if argument is empty
  if [[ -z "$separator" ]]; then
    sep="/"
  else
    sep="$separator"
  fi

  case "$command" in
    a)
      echo "command: a"
      if [[ -n "$addressRange" ]]; then
        sedScript="${addressRange}a $commandOptions"
      elif [[ -n "$regexRange" ]]; then
        sedScript="${regexRange}a $commandOptions"
      else
        echo "wrong application of command a"
      fi
      ;;
    i)
      echo "command: i"
      if [[ -n "$addressRange" ]]; then
        sedScript="${addressRange}i $commandOptions"
      elif [[ -n "$regexRange" ]]; then
        sedScript="${regexRange}i $commandOptions"
      else
        echo "wrong application of command i"
      fi
      ;;
    d)
      echo "command: d"
      if [[ -n "$addressRange" ]] && [[ -n "$regexRange" ]]; then
        sedScript="${addressRange}{${regexRange}d}"
      elif [[ -n "$addressRange" ]]; then
        sedScript="${addressRange}d $commandOptions"
      elif [[ -n "$regexRange" ]]; then
        sedScript="${regexRange}d $commandOptions"
      else
        echo "wrong application of command d"
      fi
      ;;
    =)
      echo "command: ="
      if [[ -n "$addressRange" ]] && [[ -n "$regexRange" ]]; then
        sedScript="${addressRange}{${regexRange}=}"
      elif [[ -n "$addressRange" ]]; then
        sedScript="${addressRange}= $commandOptions"
      elif [[ -n "$regexRange" ]]; then
        sedScript="${regexRange}= $commandOptions"
      else
        echo "wrong application of command ="
      fi
      ;;
    p)
      echo "command: p"
      if [[ -n "$addressRange" ]] && [[ -n "$regexRange" ]]; then
        sedScript="${addressRange}{${regexRange}p}"
      elif [[ -n "$addressRange" ]]; then
        sedScript="${addressRange}p $commandOptions"
      elif [[ -n "$regexRange" ]]; then
        sedScript="${regexRange}p $commandOptions"
      else
        echo "wrong application of command p"
      fi
      ;;
    s)
      echo "command: s"
      
      if [[ -n "$substituteSearch" ]] && [[ -n "$substituteReplace" ]]; then
        if [[ -n "$addressRange" ]] && [[ -n "$regexRange" ]]; then
          sedScript="${addressRange}{${regexRange}\
            s${sep}${substituteSearch}${sep}${substituteReplace}${sep}\
            ${commandOptions}}"
        elif [[ -n "$addressRange" ]]; then
          sedScript="${addressRange}\
            {s${sep}${substituteSearch}${sep}${substituteReplace}${sep}\
              ${commandOptions}}"
        elif [[ -n "$regexRange" ]]; then
          sedScript="${regexRange}\
            {s${sep}${substituteSearch}${sep}${substituteReplace}${sep}\
              ${commandOptions}}"
        else
          sedScript="\
            {s${sep}${substituteSearch}${sep}${substituteReplace}${sep}\
              ${commandOptions}}"
        fi
      else
        echo "wrong application of command s"
        echo "substituteSearch: $substituteSearch\ 
          substituteReplace: $substituteReplace"
      fi
      ;;
  esac
  
  echo "sedScript: $sedScript"
  echo "---------------------BUILD_SCRIPT end---------------------------------"

  # user interaction: 
  #
  # removed, same as in othe functions

  echo "---------------------SED begin----------------------------------------"
  # apply sed substitution to $file to whole line (g)
  # avoid inline editing by writing into $filetmp
  if [[ -n "$filetmp" ]]; then
    if [[ -n "$commandLineOptions" ]]; then
      echo "sed_1"
      sed -E "$commandLineOptions" -e "$sedScript" <"$file" >"$filetmp" 
    else
      echo "sed_2"
      sed -E -e "$sedScript" <"$file" >"$filetmp"
    fi
  else
    if [[ -n "$commandLineOptions" ]]; then
      echo "sed_3"
      sed -E "$commandLineOptions" -e "$sedScript" <"$file" 
    else
      echo "sed_4"
      sed -E -e "$sedScript" <"$file"
    fi
  fi
  echo "---------------------SED end------------------------------------------"


  #DIFF: show differences before and after
  if [[ -n "$filetmp" ]]; then 
    echo "---------------------DIFF begin-------------------------------------"
    diff -u --color "$file" "$filetmp"
    echo "---------------------DIFF end---------------------------------------"
  fi

  #MV: move/ overwrite $file with $filetmp
  if [[ -n "$filetmp" ]]; then 
    echo "---------------------MV begin---------------------------------------"
    echo "commented" #mv "$filetmp" "$file"
    cat "$filetmp"
    echo "---------------------MV begin---------------------------------------"
  fi


}

#call function
sed_Wrapper "$@"
# -----------------------------------------------------------------------------
