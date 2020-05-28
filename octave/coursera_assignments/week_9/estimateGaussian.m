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
# Function that computes the parameters (averages and variances) of several
# Gaussian distributions. The dataset is stored in the design matrix X. The
# dimension of X is m by n, where m is the number of examples and n is the
# number of features. This function returns the average and the variance
# associated with every column of X. These quantities are returned through the
# column vectors mu and sigma2. mu(i) is the average of the i-th feature.
# sigma2(i) is the variance of the i-th feature. Then mu and sigma2 are
# n-dimensional.
function [mu sigma2] = estimateGaussian (X)

  # Number of examples.
  m = rows (X);

  # Computes the average of each feature (each column of X).
  mu = mean (X, 1);

  # Computes the variance of each feature (each column of X).
  sigma2 = sum ((X - mu) .^ 2, 1) / m;

  # Turns mu and sigma2 into column vectors.
  mu = mu';
  sigma2 = sigma2';

endfunction
