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
# Computes the cost function and its gradient for logistic regression.
function [J grad] = costFunction (theta, X, y)

  # Number of training examples.
  m = length (y);

  # Loads a vector with the values of the hypothesis function.
  h_theta = sigmoid (X * theta);

  # Computes the cost function.

  # Related to the 1st term of J.
  J_1 = y' * log (h_theta);

  # Related to the 2nd term of J.
  J_2 = (1 - y)' * log (1 - h_theta);

  J = - (J_1 + J_2) / m;

  # Computes the gradient.
  grad = (X' * (h_theta - y)) / m;

endfunction
