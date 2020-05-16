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
# Function that returns a normalized version of X (without the column with
# ones). After the normalization, the mean value of each feature is 0, and the
# corresponding standard deviation is 1. This file isn't a copy of the one
# provided to us. I'm using the same code I wrote to complete the assignment of
# week 2.
function [X_norm mu sigma] = featureNormalize (X)

  # For each feature, computes the mean value. The results are stored in a row
  # vector.
  mu = mean (X, 1);

  # For each feature, computes the standard deviation. The results are stored
  # in a row vector.
  sigma = std (X, 1);

  # Normalizes each feature.
  X_norm = (X - mu) ./ sigma;

endfunction
