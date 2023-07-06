'''
Instructions
Calculate the Hamming Distance between two DNA strands.

Your body is made up of cells that contain DNA. Those cells regularly wear out and need replacing, which they achieve by dividing into daughter cells. In fact, the average human body experiences about 10 quadrillion cell divisions in a lifetime!

When cells divide, their DNA replicates too. Sometimes during this process mistakes happen and single pieces of DNA get encoded with the incorrect information. If we compare two strands of DNA and count the differences between them we can see how many mistakes occurred. This is known as the "Hamming Distance".

We read DNA using the letters C,A,G and T. Two strands might look like this:

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
They have 7 differences, and therefore the Hamming Distance is 7.

The Hamming Distance is useful for lots of things in science, not just biology, so its a nice phrase to be familiar with :)

Implementation notes
The Hamming distance is only defined for sequences of equal length, so an attempt to calculate it between sequences of different lengths should not work.
'''
#!/usr/bin/env bash
error () {
  printf '%s\n' "$*"
  exit 1
}
Hamming_distance() {
    # The number of arguments is 0 or 1, we don't have enough material to work
    if [ $# -eq 0 ] || [ $# -eq 1 ]; then
        error "Usage: hamming.sh <string1> <string2>"
        exit 1
    elif [ ${#1} -ne ${#2} ]; then
        echo "strands must be of equal length" 
        exit 1
    else
        COUNT=0
        for ((i=0; i<${#1}; i++)); do
            if [ "${1:$i:1}" != "${2:$i:1}" ]; then
                COUNT=$((COUNT+1))
            fi
        done
        echo "$COUNT"
    fi
}
Hamming_distance "$@"
