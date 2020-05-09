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
# Commands for performing the following tasks:
# 1 - Creating vectors;
# 2 - Creating matrices;
# 3 - Determining the dimensions of vectors and matrices.

echo on

# CREATING VECTORS.

# Row vector:
v1 = [1 2 3]

# Random row vector of dimension 5:
rv1 = randn (1, 5)

# Row vector whose entries go from 2 to 6:
w1 = 2:6

# Row vector whose entries go from 0 to 2.5 in increments of 0.5:
w2 = 0:0.5:2.5

# Column vector:
v2 = [1; 2; 3]

# Random column vector of dimension 4:
rv2 = randn (4, 1)

# Column vector whose entries go from 3 to 5:
w3 = [3:5]'

# Column vector whose entries go from 0.6 to 1.4 in increments of 0.2:
w4 = [0.6:0.2:1.4]'

# CREATING MATRICES.

# 2 by 3 matrix:
M1 = [4 5 6; 7 8 9]

# Random 3 by 4 matrix:
RM1 = randn (3, 4)

# 3 by 2 matrix containing only zeros:
M2 = zeros (3, 2)

# 2 by 4 matrix containing only ones:
M3 = ones (2, 4)

# Identity matrices:
I3 = eye (3)
I4 = eye (4)

# Matrices corresponding to magic squares:
M4 = magic (4)
M5 = magic (5)

# DETERMINING THE DIMENSIONS OF VECTORS AND MATRICES.

# Determines the dimension of each vector defined above:
length (v1)
length (rv1)
length (w1)
length (w2)
length (v2)
length (rv2)
length (w3)
length (w4)

# Determines the dimension of each matrix defined above:
size (M1)
size (RM1)
size (M2)
size (M3)
size (I3)
size (I4)
size (M4)
size (M5)

echo off
