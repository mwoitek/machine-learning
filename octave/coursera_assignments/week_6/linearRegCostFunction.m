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
# Function that computes the cost and its gradient for regularized
# linear regression with multiple variables. It's assumed that X
# already has a column of ones.
function [J grad] = linearRegCostFunction (X, y, theta, lambda)

  # Number of training examples.
  m = length (y);

  # theta without its 1st component.
  theta_2 = theta(2:end);

  # Cost without regularization.
  residuals = y - X * theta;
  J_0 = dot (residuals, residuals);

  # Regularization term.
  J_r = lambda * dot (theta_2, theta_2);

  # Computes the cost function.
  J = (J_0 + J_r) / (2 * m);

  # Gradient without regularization.
  XT = X';
  grad = XT * X * theta - XT * y;

  # Regularization term.
  grad(2:end) += lambda * theta_2;

  # Computes the gradient of the cost function.
  grad /= m;

endfunction
