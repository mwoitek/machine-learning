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
# Function that computes the probability density function of the multivariate
# Gaussian distribution. The dataset is stored in the design matrix X. The
# dimension of X is m by n, where m is the number of examples and n is the
# number of features. The n-dimensional column vector mu is so that mu(i) is
# the average of the i-th feature. The array sigma2 can be a matrix or a
# n-dimensional column vector. If sigma2 is a matrix, then it is treated as the
# covariance matrix. If sigma2 is a vector, then sigma2(i) is the variance of
# the i-th feature. In this case, sigma2 is converted into a diagonal
# covariance matrix. The returned vector p is a m-dimensional column vector.
# p(i) is the probability density function for the i-th example. This file
# isn't just a copy of the one provided to us. I changed the original code
# considerably.
function p = multivariateGaussian (X, mu, sigma2)

  # Checks if sigma2 is a vector. If necessary, converts sigma2 into a diagonal
  # matrix.
  if (columns (sigma2) == 1)
    sigma2 = diag (sigma2);
  endif

  # Number of examples and number of features.
  [m n] = size (X);

  # Computes the determinant of the covariance matrix.
  det_sigma2 = det (sigma2);

  # Computes the normalization factor of the probability density function.
  norm_p = (det_sigma2 * (2 * pi) ^ n) ^ (-0.5);

  # Inverts the covariance matrix.
  inv_sigma2 = pinv (sigma2);

  # Computes the probability density function.
  p = zeros (m, 1);
  X -= mu';
  for i = 1:m
    p(i) = X(i,:) * inv_sigma2 * (X(i,:))';
  endfor
  p = norm_p * exp (-0.5 * p);

endfunction
