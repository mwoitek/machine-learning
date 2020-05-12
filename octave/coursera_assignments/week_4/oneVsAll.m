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
# Function that trains num_labels logistic regression classifiers. This
# function returns each of these classifiers in a matrix all_theta, where the
# i-th row corresponds to the classifier for label i.
function all_theta = oneVsAll (X, y, num_labels, lambda)

  # Computes the number of rows and columns of the original X.
  [m n] = size(X);

  # Adds a column of ones to X.
  X = [(ones (m, 1)) X];

  # Initializes all_theta.
  all_theta = zeros (num_labels, n + 1);

  # Sets the options for fmincg.
  options = optimset ("GradObj", "on", "MaxIter", 50);

  # Loop over the different classes.
  for c = 1:num_labels

    # Initializes the fitting parameters.
    initial_theta = zeros (n + 1, 1);

    # Runs fmincg to obtain the optimal theta.
    # (y == c) is a vector of 1's and 0's that tell us whether the ground truth
    # is true or false for the class c.
    theta = fmincg (@(t) (lrCostFunction (t, X, (y == c), lambda)), ...
                    initial_theta, options);

    # Fills the c-th row of all_theta.
    all_theta(c,:) = theta';

  endfor

endfunction
