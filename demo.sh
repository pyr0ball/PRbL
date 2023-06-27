#!/bin/bash

# Initial Vars
VERSION=1.2.1
scriptname="${BASH_SOURCE[0]##*/}"
rundir="${BASH_SOURCE[0]%/*}"
runuser="$(whoami)"

if [ ! -z $prbl_functions ] ; then
    source $prbl_functions
else
    if [ -f ${rundir}/functions ] ; then
        source ${rundir}/functions
    else
        source <(curl -ks 'https://raw.githubusercontent.com/pyr0ball/PRbL/master/functions')
    fi
fi

# Title
clear
boxborder \
   "Pyr0ball's Bash Functions Library Demo v${VERSION}" \
   "functions v${functionsrev}"
#boxborder

# Colorized output
boxborder \
   "${lyl}Text Formatting${dfl}" \
   $(boxseparator) \
   "${red}Red Text Sample${dfl}" \
   "${lrd}Light Red Text${dfl}" \
   "${ong}Orange Text Sample${dfl}" \
   "${ylw}Yellow Text Sample${dfl}" \
   "${lyl}Light Yellow Text${dfl}" \
   "${grn}Green Text Sample${dfl}" \
   "${cyn}Cyan Text Sample${dfl}" \
   "${lbl}Light Blue Text${dfl}" \
   "${blu}Blue Text Sample${dfl}" \
   "${pur}Purple Text Sample${dfl}" \
   "${mag}Magenta Text Sample${dfl}" \
   "${gry}Grey Text Sample${dfl}" \
   $(boxseparator) \
   "${bld}Bold Text Sample${dfl}" \
   "${dim}Dim Text Sample${dfl}" \
   "${unl}Underline Text${dfl}" \
   "${inv}Inverted Text Sample${dfl}" \
   "Default Text Sample" \
   $(boxseparator) \
   "${lyl}Combined Text Formatting${dfl}" \
   "${red}${bld}Red + Bold Text${dfl}" \
   "${red}${dim}Red + Dim Text${dfl}" \
   "${red}${unl}Red + Underline${dfl}" \
   "${red}${inv}Red + Inverted${dfl}"
# boxborder

# demo different box border types
echo ""
boxborder "${lyl}Bounding Boxes${dfl}"
box-double
boxborder "Double Line"
box-heavy
boxborder "Heavy"
box-light
boxborder "Light"
box-rounded
boxborder "Rounded"
box-singlechar
boxborder "Single Character"
box-norm
boxborder "Normal"

# Demo formatting transformations

# Center justified text:

center "${lyl}Center-Justified Text${dfl}"

# Spanner text

spanner "Spanner text" "end of line"

# Demo interactive menus
boxborder \
   "${lyl}Keyboard Interactive Menus${dfl}"\
   $(boxseparator) \
   "Use Up/Down arrow keys, or [j|k] to navigate" \
   "For Multiselect, use space bar to invert selection" \
   "and 'Enter' to Confirm"
#boxborder

# Example for select_option

echo "Select one option using up/down keys and enter to confirm:"
echo

options=("one" "two" "three")

select_option "${options[@]}"
choice=$?

echo "Choosen index = $choice"
echo "        value = ${options[$choice]}"

# Examples for select_opt

case `select_opt "Yes" "No" "Cancel"` in
  0) echo "selected Yes";;
  1) echo "selected No";;
  2) echo "selected Cancel";;
esac

options=("Yes" "No" "${array[@]}") # join arrays to add some variable array
case `select_opt "${options[@]}"` in
  0) echo "selected Yes";;
  1) echo "selected No";;
  *) echo "selected ${options[$?]}";;
esac

# Example for above multiselect functions
boxborder \
   "Use arrow keys to select a line, spacebar to toggle" \
   "Then 'enter' to confirm choices"
my_options=(   "Option 1"  "Option 2"  "Option 3" )
preselection=( "true"      "true"      "false"    )

multiselect result my_options preselection

idx=0
for option in "${my_options[@]}"; do
   echo -e "$option\t=> ${result[idx]}"
   ((idx++))
done

# Spinner
for i in {1..21} ; do
   boxborder "spinner$i demo"
   set_spinner spinner$i
   spin "sleep 3"
done