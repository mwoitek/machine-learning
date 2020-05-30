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
# Function that gives us a numerical estimate for the gradient of the
# cost function. We do so by using finite differences. This function
# returns the vector numgrad. numgrad(i) stores an approximation for
# the partial derivative of J with respect to theta(i) (evaluated at
# theta). Notice that, in the collaborative filtering problem, theta
# is a vector containing all the parameters in the matrices Theta and
# X. This file isn't just a copy of the one provided to us. I changed
# the original code considerably.
function numgrad = computeNumericalGradient (J, theta)

  # Dimension of the vector theta.
  dim_theta = length (theta);

  # Initializes the vector that this function returns.
  numgrad = zeros (dim_theta, 1);

  # Initializes the perturbation vector.
  perturb = zeros (dim_theta, 1);

  # Norm of the perturbation vector.
  epsilon = 1e-4;

  # Loop for loading numgrad.
  for p = 1:dim_theta

    # Sets the perturbation vector.
    perturb(p) = epsilon;

    # Computes the numerical gradient by using finite differences.
    loss1 = J (theta - perturb);
    loss2 = J (theta + perturb);
    numgrad(p) = loss2 - loss1;

    # Resets the perturbation vector.
    perturb(p) = 0;

  endfor

  numgrad /= 2 * epsilon;

endfunction
