#!/bin/bash

# Usage examples:
# ./calc.sh 2+2
# ./calc.sh "2 + 2"

# Check if an expression is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <expression>"
    exit 1
fi
# Remove spaces from the input expression
expression=$(echo "$1" | tr -d ' ')
# Replace 'x' with '*' for multiplication
expression=${expression//x/*}
# Evaluate the expression using 'bc'
result=$(echo "scale=10; $expression" | bc -l)
# Print the formatted result
echo "$expression = $result"
