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
# a neural network (Theta1 and Theta2). This file isn't just a copy of the one
# provided to us. I changed the original code considerably.
function p = predict (Theta1, Theta2, X)

  # Computes the vector a^(3) for every training example. The output
  # layer of the i-th example will be in the i-th column of a.
  a = feedforward (Theta1, Theta2, X);

  # Determines the vector of predictions p. To predict the label for
  # the i-th training example, we look for the maximum value in the
  # i-th column of a. If this value is found in the j-th row, then the
  # predicted label is j.
  [dummy_max p] = max (a, [], 1);
  # In this case, max gives us p as a row vector. Since we need it as
  # a column vector, we compute the transpose of p.
  p = p';

endfunction
