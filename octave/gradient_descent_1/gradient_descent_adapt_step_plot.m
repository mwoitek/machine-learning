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
# Implementation of the GRADIENT DESCENT algorithm.
# This version of the algorithm uses an ADAPTIVE STEP SIZE.
#
# This code finds the value that minimizes the function
# f(x)=x^{4}-3x^{3}+2.
# The exact result for this value is
# x=\frac{9}{4}.

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

# Vector that stores all the values of x (except for the initial one):
xs = [];

# Vector that stores all the values of the step size (except for the initial one):
gams = [];

i = 0;
while (i < max_iter)
  next_x = current_x - gam * current_df;
  xs = [xs, next_x];
  i++;
  diff_x = next_x - current_x;
  if (abs (diff_x) <= prec)
    break
  else
    next_df = df (next_x);
    gam = adapt_gamma (current_x, next_x, current_df, next_df);
    gams = [gams, gam];
    current_x = next_x;
    current_df = next_df;
  endif
endwhile

printf ("Global minimum of f(x) at x = %.5f\n", next_x)
printf ("To obtain this result, we iterated %d times\n", i)

# PLOTTING THE RESULTS.

cd image_files/
is = 1:(i - 1);

# Plotting the approximation for x as a function of the number of iterations:
plot ([is, i], xs, "+r")
xlabel ("Number of iterations i")
ylabel ("Approximation for x")
print ("adapt_step", "-dpng")

# Plotting the step size as a function of the number of iterations:
plot (is, gams, "*b")
xlabel ("Number of iterations i")
ylabel ("Step size")
print ("step", "-dpng")
