'''
Instructions
Convert a phrase to its acronym.

Techies love their TLA (Three Letter Acronyms)!

Help generate some jargon by writing a program that converts a long name like Portable Network Graphics to its acronym (PNG).

Punctuation is handled as follows: hyphens are word separators (like whitespace); all other punctuation can be removed from the input.

For example:

Input	Output
As Soon As Possible	ASAP
Liquid-crystal display	LCD
Thank George Its Friday!	TGIF
'''

Acronym() {
    for (( i=0; i<${#1}; i++ )); do
        if [ $i -eq 0 ]; then
            OUTPUT="${1:0:1}"
        elif [ "${1:$i:1}" == " " ] || [ "${1:$i:1}" == "-" ] || [ "${1:$i:1}" == "_" ]; then
            if [[ ${1:$((i+1)):1} =~ [[:alpha:]] ]]; then
                OUTPUT="${OUTPUT}${1:$((i+1)):1}"
            else
               continue
            fi
        fi
    done
    echo "${OUTPUT^^}"
}
Acronym "$@"
