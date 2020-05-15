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
# Function that takes a column vector X and maps each example into its
# polynomial features. This function returns a matrix X_poly so that
# X_poly(i,:) = [X(i) (X(i) .^ 2) (X(i) .^ 3) ... (X(i) .^ p)].
function X_poly = polyFeatures (X, p)

  # Initializes the matrix the function returns. More precisely, we
  # create a matrix by putting side by side p copies of X.
  X_poly = repmat (X, [1 p]);

  # Loads a row vector with all p exponents.
  exps = [1:p];

  # Computes the i-th power of every element in the i-th column of
  # X_poly.
  X_poly = X_poly .^ exps;

endfunction
