#!/bin/bash
#int-or-string?

a=2334		# Interger.
let " a+= 1"
echo "a = $a"	# a = 2335
echo		# Integer, still.

b=${a/23/BB}	# Substitute "BB" for "23".

echo "b = $b"	# b is a string. b = BB35
declare -i b	# Declaring it an integer doesn't help.
echo "b = $b"	# b=BB35

let "b += 1"	# BB35 + 1 ?
echo "b = $b"	# b = 1
echo		# Bash sets the "integer value" of a string to 0.

c=BB34
echo "c = $c"
d=${c/BB/23}

echo "d = $d"	# d = 2334
let "d += 1"	# 2334 + 1
echo "d = $d"
echo

#What about null variables?
e=
echo "e = $e"	# e =
let "e += 1"	# Is it allowed?
echo "e = $e"	# Null variable transformed into an integer.
echo		# This is undocumented and probably non-portable behavior!

echo "f = $f"
let "f += 1"
echo "f = $f"
echo		# Still work!

let "f /= $undecl_var"	# Divide by zero?
# let: f /= : syntax error: operand expected (error token is "/=")
# Syntax error! Variable $undecl_var is not set to zero here!

#But still ...
let "f /= 0"
# let: f /= 0: division by 0 (error token is "0")
# Expected behavior

exit $?