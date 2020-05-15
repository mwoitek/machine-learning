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
# Function that trains linear regression using the dataset (X, y) and
# the regularization parameter lambda. It's assumed that X already has
# a column of ones. This function returns the trained parameters
# theta.
function theta = trainLinearReg (X, y, lambda)

  # Initializes the fitting parameters.
  initial_theta = zeros (columns (X), 1);

  # Creates an alias for the cost function to be
  # minimized. costFunction is a function that takes in only one
  # argument.
  costFunction = @(t) linearRegCostFunction (X, y, t, lambda);

  # Sets the options for fmincg.
  options = optimset ("MaxIter", 200, "GradObj", "on");

  # Runs fmincg to obtain the optimal theta.
  theta = fmincg (costFunction, initial_theta, options);

endfunction
