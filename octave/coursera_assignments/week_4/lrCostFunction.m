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
# Computes the cost function and its gradient for logistic regression with
# regularization. To complete the last assignment, I implemented a vectorized
# version of this function. Then the following code is essentially a copy of
# the one in the file ../week_3/costFunctionReg.m.
function [J grad] = lrCostFunction (theta, X, y, lambda)

  # Number of training examples.
  m = length (y);

  # Loads a vector with the values of the hypothesis function.
  h_theta = sigmoid (X * theta);

  # theta without its 1st component.
  theta_2 = theta(2:end);

  # Computes the cost function.

  # Related to the 1st term of J.
  J_1 = y' * log (h_theta);

  # Related to the 2nd term of J.
  J_2 = (1 - y)' * log (1 - h_theta);

  # Related to the regularization term.
  J_r = (lambda / 2) * dot (theta_2, theta_2);

  J = - (J_1 + J_2 - J_r) / m;

  # Computes the gradient.

  # "Gradient" without regularization.
  grad = X' * (h_theta - y);

  grad(2:end) += lambda * theta_2;
  grad /= m;

endfunction
