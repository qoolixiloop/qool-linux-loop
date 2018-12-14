> sed_Wrapper() {
> 
>   #doc_begin; help_begin-------------------------------------------------------
>   # ---------------------------------------------------------------------------
>   # sed_wrapper(): For Task II: 
>   # Purpose: 
>   #   A wrapper for SED with predefined SED script strings.
>   #   Serves as a reminder of the syntax for the different SED commands.
>   #
>   # Arguments:
>   #  There are a lot of input arguments, and they must all be passed at the 
>   #  right position, for the function to work. Not used arguments are passed
>   #  as an own separate empty string "". Because I only use the function
>   #  programmatically, this is rather an advantage than a disadvantage.
>   #   $1: file; the input file to read from; will be overwritten by $2
>   #   $2  filetmp; the output file to write to; overwrites $1
>   #   $3  commandLineOptions; SED Options; see "$ sed --help";
>   #                           -E is hard coded here 
>   #                           e.g. use -n with command 'p' or command '='
>   #   $4  separator"; use it, if your strings contain many "/"
>   #   $5  addressRange; either "N_from,M_to" or "M"
>   #   $6  regexPattern; either "/reg_from/,/reg_to/" or "/reg/"
>   #   $7  command; one of "a, i, d, p, =, s" (see "$ man sed" for a list)
>   #   $8  commandOptions "for a,i:'TEXT' to add; for s: 'g' or '' "
>   #   $9 substituteSearch; reg
>   #   ${10} substituteReplace; text
>   # 
>   # SED: Usage
>   #  SED -E sedOptions sedScript <inputfile >outputFile
>   #
>   # ---------------------------------------------------------------------------
> 
>   # INPUT: arguments
>   local file="$1"
>   local filetmp="$2"
>   local commandLineOptions="$3"
>   local separator="$4"
>   local addressRange="$5"
>   local regexRange="$6"
>   local command="$7"
>   local commandOptions="$8"
>   local substituteSearch="$9"
>   local substituteReplace="${10}"
> 
>   # sedScript: holds the instructions applied to each line of the file 
>   local sedScript 
> 
>   # CHECK: input arguments
>   echo "file: $file"
>   echo "filetmp: $filetmp"
>   echo "commandLineOptions: $commandLineOptions"
>   echo "separator: $separator"
>   echo "addressRange: $addressRange"
>   echo "regexRange: $regexRange"
>   echo "command: $command"
>   echo "commandOptions: $commandOptions"
>   echo "substituteSearch: $substituteSearch"
>   echo "substituteReplace: $substituteReplace"
> 
> 
>   #CHECK: number of arguments
>   if [[ "$#" -ne 10 ]]; then
>     echo "ERROR: number of arguments: $#; but should be 10"
>     return
>   fi
>   echo "number of arguments: $#"
> 
>   #EMPTY: empty the file to write to 
>   if [[ -n "$filetmp" ]]; then 
>     true > "$filetmp"
>   fi
> 
> 
>   #BUILD: SED_SCRIPT
>   #=================
>   # apply default separator, if argument is empty
>   if [[ -z "$separator" ]]; then
>     sep="/"
>   else
>     sep="$separator"
>   fi
> 
>   #CASE: input command
>   case "$command" in
>     a)
>       # command to append text
>       echo "command: a"
>       if [[ -n "$addressRange" ]]; then
>         sedScript="${addressRange}a $commandOptions"
>       elif [[ -n "$regexRange" ]]; then
>         sedScript="${regexRange}a $commandOptions"
>       else
>         echo "wrong application of command a"
>       fi
>       ;;
>     i)
>       #command to insert text
>       echo "command: i"
>       if [[ -n "$addressRange" ]]; then
>         sedScript="${addressRange}i $commandOptions"
>       elif [[ -n "$regexRange" ]]; then
>         sedScript="${regexRange}i $commandOptions"
>       else
>         echo "wrong application of command i"
>       fi
>       ;;
>     d)
>       # command to delete text
>       echo "command: d"
>       if [[ -n "$addressRange" ]] && [[ -n "$regexRange" ]]; then
>         sedScript="${addressRange}{${regexRange}d}"
>       elif [[ -n "$addressRange" ]]; then
>         sedScript="${addressRange}d $commandOptions"
>       elif [[ -n "$regexRange" ]]; then
>         sedScript="${regexRange}d $commandOptions"
>       else
>         echo "wrong application of command d"
>       fi
>       ;;
>     =)
>       # command to print line numbers
>       echo "command: ="
>       if [[ -n "$addressRange" ]] && [[ -n "$regexRange" ]]; then
>         sedScript="${addressRange}{${regexRange}=}"
>       elif [[ -n "$addressRange" ]]; then
>         sedScript="${addressRange}= $commandOptions"
>       elif [[ -n "$regexRange" ]]; then
>         sedScript="${regexRange}= $commandOptions"
>       else
>         echo "wrong application of command ="
>       fi
>       ;;
>     p)
>       # command to print text
>       echo "command: p"
>       if [[ -n "$addressRange" ]] && [[ -n "$regexRange" ]]; then
>         sedScript="${addressRange}{${regexRange}p}"
>       elif [[ -n "$addressRange" ]]; then
>         sedScript="${addressRange}p $commandOptions"
>       elif [[ -n "$regexRange" ]]; then
>         sedScript="${regexRange}p $commandOptions"
>       else
>         echo "wrong application of command p"
>       fi
>       ;;
>     s)
>       # command to substitute text
>       echo "command: s"
>       
>       if [[ -n "$substituteSearch" ]] && [[ -n "$substituteReplace" ]]; then
>         if [[ -n "$addressRange" ]] && [[ -n "$regexRange" ]]; then
>           sedScript="${addressRange}{${regexRange}\
>             s${sep}${substituteSearch}${sep}${substituteReplace}${sep}\
>             ${commandOptions}}"
>         elif [[ -n "$addressRange" ]]; then
>           sedScript="${addressRange}\
>             {s${sep}${substituteSearch}${sep}${substituteReplace}${sep}\
>               ${commandOptions}}"
>         elif [[ -n "$regexRange" ]]; then
>           sedScript="${regexRange}\
>             {s${sep}${substituteSearch}${sep}${substituteReplace}${sep}\
>               ${commandOptions}}"
>         else
>           sedScript="\
>             {s${sep}${substituteSearch}${sep}${substituteReplace}${sep}\
>               ${commandOptions}}"
>         fi
>       else
>         # unhandled or wrong command called
>         echo "wrong application of command s"
>         echo "substituteSearch: $substituteSearch\ 
>           substituteReplace: $substituteReplace"
>       fi
>       ;;
>   esac
>  
>   # echo the sed script
>   echo "sedScript: $sedScript"
> 
>   # user interaction: 
>   #
>   # removed, same as in othe functions
> 
>   # SED: apply SED script to $file and write to $filetmp
>   # ====================================================
>   if [[ -n "$filetmp" ]]; then
>     if [[ -n "$commandLineOptions" ]]; then
>       echo "sed_1"
>       sed -E "$commandLineOptions" -e "$sedScript" <"$file" >"$filetmp" 
>     else
>       echo "sed_2"
>       sed -E -e "$sedScript" <"$file" >"$filetmp"
>     fi
>   else
>     if [[ -n "$commandLineOptions" ]]; then
>       echo "sed_3"
>       sed -E "$commandLineOptions" -e "$sedScript" <"$file" 
>     else
>       echo "sed_4"
>       sed -E -e "$sedScript" <"$file"
>     fi
>   fi
> 
>   #DIFF: show differences before and after
>   if [[ -n "$filetmp" ]]; then 
>     diff -u --color "$file" "$filetmp"
>   fi
> 
>   #CAT: show file $filetmp
>   if [[ -n "$filetmp" ]]; then 
>     cat "$filetmp"
>   fi
> 
> }
> 
> #call function
> sed_Wrapper "$@"
> # -----------------------------------------------------------------------------
