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
# Commands for computing on data.

echo on

# Defining a few matrices and vectors:
M1 = [2 3 4; 5 6 7]
M2 = [0 1; 2 3; 4 5]
M3 = [2 3; 4 5]
M4 = 11 * ones (2)
M5 = randn (3, 3)
M6 = magic (5)
v1 = [-1; 0; 1]
v2 = [2; 4]
v3 = randn (1, 5)

# MULTIPLICATION.

# Regular matrix multiplication:
A1 = M1 * M2

# Element-wise multiplication of two matrices:
A2 = M3 .* M4

# SQUARES.

# Squaring a matrix by regular matrix multiplication:
B1 = M3 ^ 2

# Computing the square of each element of a matrix:
B2 = M3 .^ 2

# OTHER POWERS.

# There is nothing special about squares.
# The last two commands can be adapted so we can compute other powers.
# Here are a few examples:
C1 = M3 ^ 3
C2 = M3 .^ 3
C3 = M3 ^ 4
C4 = M3 .^ 4

# INVERSES.

# Inverting each entry in a vector or matrix:
Iv2 = 1 ./ v2
IM3 = 1 ./ M3

# Computing the inverse matrix of M3:
IM3_2 = M3 ^ (-1)

# MATHEMATICAL FUNCTIONS.

# Absolute value:
abs (v1)

# floor (x) = Highest integer not greater than x:
floor (v3)

# ceil (x) = Lowest integer not less than x:
ceil (v3)

# round (x) = Integer closest to x:
round (M5)

# Sine, cosine and tangent:
sin (M5)
cos (M5)
tan (M5)

# Exponential function:
exp (v1)

# Natural logarithmic:
log (v2)

# EXTRACTING USEFUL INFORMATION FROM VECTORS AND MATRICES.

# Finding the minimum and maximum values in a vector:
min (v3)
max (v3)

# min/max can also be used to find the position of the minimum/maximum:
[min_v3, ind_min_v3] = min (v3)
[max_v3, ind_max_v3] = max (v3)

# The above functions can also take matrix arguments.
# In this case, min/max returns a row vector
# with the minimum/maximum value of each column.
# Here are a few examples:
min (M5)
max (M5)
[min_M5, ind_min_M5] = min (M5)
[max_M5, ind_max_M5] = max (M5)

echo off
