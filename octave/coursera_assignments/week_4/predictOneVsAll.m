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
# Function that predicts the label for a trained one-vs-all classifier. The
# labels are in the range from 1 to K, where K = rows (all_theta).
function p = predictOneVsAll (all_theta, X)

  # Number of training examples.
  m = rows (X);

  # Adds a column of ones to X.
  X = [(ones (m, 1)) X];

  # Fills the matrix h_theta with all of the probabilities.
  h_theta = sigmoid (X * all_theta');

  # Determines the vector of predictions p. To predict the label for the i-th
  # training example, we look for the maximum value in the i-th row of h_theta.
  # If this value is found in the j-th column, then the predicted label is j.
  [max_prob p] = max (h_theta, [], 2);

endfunction
