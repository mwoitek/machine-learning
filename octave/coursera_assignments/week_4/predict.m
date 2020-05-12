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
# Function that outputs the predicted labels of X given the trained weights of
# a neural network (Theta1 and Theta2).
function p = predict (Theta1, Theta2, X)

  # Adds a column of ones to X. Then transposes the resulting
  # matrix. The input layer of the i-th training example will be in
  # the i-th column of X. In other words, this matrix will store the
  # vector a^(1) for every example.
  X = [(ones (rows (X), 1)) X]';

  # Computes the vector a^(2) for every training example. The hidden
  # layer of the i-th example will be in the i-th column of X.
  X = sigmoid (Theta1 * X);
  # Adds a row of ones to X.
  X = [(ones (1, columns (X))); X];

  # Computes the vector a^(3) for every training example. The output
  # layer of the i-th example will be in the i-th column of X.
  X = sigmoid (Theta2 * X);

  # Determines the vector of predictions p. To predict the label for
  # the i-th training example, we look for the maximum value in the
  # i-th column of X. If this value is found in the j-th row, then the
  # predicted label is j.
  [max_h p] = max (X, [], 1);
  # In this case, max gives us p as a row vector. Since we need it as
  # a column vector, we compute the transpose of p.
  p = p';

endfunction
