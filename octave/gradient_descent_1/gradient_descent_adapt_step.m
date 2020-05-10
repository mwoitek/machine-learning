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
# Implementation of the GRADIENT DESCENT algorithm. This version of the
# algorithm uses an ADAPTIVE STEP SIZE. This code finds the value that
# minimizes the function
# f(x)=x^{4}-3x^{3}+2.
# The exact result for this value is
# x=\frac{9}{4}.

clear;
close all;
clc

# PARAMETERS OF THE ALGORITHM.

# Desired precision:
prec = 10 ^ (-5);

# Maximum number of iterations:
max_iter = 10 ^ 4;

# ACTUAL IMPLEMENTATION OF THE ALGORITHM.

# Initial value of x:
current_x = 6;

# Initial value of the derivative:
current_df = df (current_x);

# Initial value of the step size:
gam = 10 ^ (-2);

for i = 1:max_iter
  next_x = current_x - gam * current_df;
  diff_x = next_x - current_x;
  if (abs (diff_x) <= prec)
    break
  else
    next_df = df (next_x);
    gam = adapt_gamma (current_x, next_x, current_df, next_df);
    current_x = next_x;
    current_df = next_df;
  endif
endfor

printf ("Global minimum of f(x) at x = %.5f\n", next_x);
