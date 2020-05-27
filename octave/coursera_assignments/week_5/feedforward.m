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
# Function that computes the activation values for a 3-layer neural network.
# The function receives the weight matrices Theta1 and Theta2, and the design
# matrix X. The i-th row of X stores the input vector of the i-th training
# example. This function returns 5 matrices (a_3, z_3, a_2, z_2 and a_1) that
# are organized similarly. The matrix a_3 contains the vector a^(3) for every
# training example. The output vector of the i-th example is in the i-th column
# of a_3. The other 4 matrices are defined analogously. THIS FILE ISN'T PART OF
# THE ORIGINAL SET OF FILES. But I added this function to avoid repeating code.
function [a_3 z_3 a_2 z_2 a_1] = feedforward (Theta1, Theta2, X)

  # Computes the vector a^(1) for every training example.

  # Adds a column of ones to X. Then transposes the resulting
  # matrix. The input layer of the i-th training example will be in
  # the i-th column of a_1.
  a_1 = [(ones (rows (X), 1)) X]';

  # Computes the vectors z^(2) and a^(2) for every training example.

  # Computes the vectors z^(2). The vector associated with the i-th example
  # will be in the i-th column of z_2.
  z_2 = Theta1 * a_1;

  # Computes the vectors a^(2). The hidden layer of the i-th example will be in
  # the i-th column of a_2.
  a_2 = sigmoid (z_2);
  # Adds a row of ones to a_2.
  a_2 = [(ones (1, columns (a_2))); a_2];

  # Computes the vectors z^(3) and a^(3) for every training example.

  # Computes the vectors z^(3). The vector associated with the i-th example
  # will be in the i-th column of z_3.
  z_3 = Theta2 * a_2;

  # Computes the vectors a^(3). The output layer of the i-th example will be in
  # the i-th column of a_3.
  a_3 = sigmoid (z_3);

endfunction
