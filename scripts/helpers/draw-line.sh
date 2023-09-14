#!/bin/sh

# Function for drawing a line the width of the terminal.
# If the function cannot determine the width of the terminal, 80 is used by default.
# 


# Draw the line
#   $1 line character
#
draw_line () {

    # Get the number of columns in the terminal
    COLS="$(stty size | cut -d ' ' -f2)"

    # If number of columns is unset or null, substitute 80
    COLS="${COLS:-80}"

    # Handle the line character
    if [ -z "$1" ]
      then
        # No line character specified
        LINE_CHAR="-"

      else
        # Line character specified
        LINE_CHAR=$1
    fi

    # Print the line followed by a new line  
    printf '%.0s'$LINE_CHAR $(seq $COLS)
    printf '\n'
}
