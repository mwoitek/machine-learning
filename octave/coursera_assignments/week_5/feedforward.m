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
# Function that computes the activation values for the last layer of a 3-layer
# neural network. The function receives the weight matrices Theta1 and Theta2,
# and the design matrix X. The i-th row of X stores the input vector of the
# i-th training example. The returned matrix a is organized similarly. It
# contains the vector a^(3) for every training example. The output vector of
# the i-th example is in the i-th column of a. THIS FILE ISN'T PART OF THE
# ORIGINAL SET OF FILES. But I added this function to avoid repeating code.
function a = feedforward (Theta1, Theta2, X)

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
  # layer of the i-th example will be in the i-th column of a.
  a = sigmoid (Theta2 * X);

endfunction
