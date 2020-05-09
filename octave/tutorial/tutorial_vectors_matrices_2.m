#
#
#
# ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
# ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
# ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
# ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
# ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
#  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
#
#
#
#   ____      __
#  / __ \____/ /____ __  _____
# / /_/ / __/ __/ _ `/ |/ / -_)
# \____/\__/\__/\_,_/|___/\__/
#
#
#
# Commands that perform some useful operations on vectors and matrices.
echo on

# Defining a few matrices and vectors:
M1 = [1 2 3; 4 5 6]
M2 = [7 8; 9 10; 11 12]
M3 = magic (6)
v1 = [-1 0 1]
v2 = [2; 4; 6]

# Printing the list of variables in the current scope:
who

# Detailed version of the last command:
whos

# CHANGING THE SHAPE OF A MATRIX.

# Returning the transpose:
M1'
M2'
M3'

# Turning a matrix into a vector:
M1(:)
M2(:)

# ACCESSING THE DATA INSIDE OF A MATRIX.

# Reading the element in row 2 and column 1:
M1(2,1)

# Reading the element in row 3 and column 2:
M2(3,2)

# Extracting row 2:
M1(2,:)

# Extracting column 1:
M2(:,1)

# Extracting rows 2 and 4:
M3([2 4],:)

# Extracting columns 3 and 5:
M3(:,[3 5])

# MODIFYING THE DATA INSIDE OF A MATRIX.

# Changing row 2:
M2(2,:) = [0 1]

# Changing column 1:
M2(:,1) = [11; 22; 33]

# Appending a row vector:
M1 = [M1; v1] # To the bottom
M1 = [v1; M1] # To the top

# Appending a column vector:
M2 = [M2 v2] # To the right
M2 = [v2 M2] # To the left

# Appending two matrices:
A1 = [M1 M2'] # Horizontal append
A2 = [M1; M2'] # Vertical append

# REMOVING VARIABLES FROM THE CURRENT SCOPE.

whos

# Removing a single variable:
clear v1

# Removing several variables by using regular expressions:
clear A*

# Checking that the variables were removed:
exist ("v1")
exist ("A1")
exist ("A2")
whos

# Removing all the variables in the current scope:
clear *
whos

echo off
