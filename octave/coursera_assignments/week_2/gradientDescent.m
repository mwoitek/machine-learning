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
# Function that performs gradient descent to obtain theta.
function [theta, J_history] = gradientDescent (X, y, theta, alpha, num_iters)
  J_history = zeros (num_iters, 1);
  m = length (y);
  XTm = X' / m;
  XTmX = XTm * X;
  XTmy = XTm * y;
  for iter = 1:num_iters
    # Computes the gradient of the cost function J.
    gradJ = XTmX * theta - XTmy;
    # Performs an iteration.
    theta = theta - alpha * gradJ;
    # Saves the cost function J after every iteration.
    J_history(iter) = computeCost (X, y, theta);
  endfor
endfunction
