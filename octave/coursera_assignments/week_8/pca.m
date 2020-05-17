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
# Function that runs the Principal Component Analysis on the dataset X (with m
# examples and n features). More precisely, this function computes the
# eigenvectors and eigenvalues of the covariance matrix of X. These results are
# returned through the n by n matrices U and S. U is so that U(:,i) stores the
# i-th eigenvector, and S is a diagonal matrix containing the eigenvalues.
function [U S] = pca (X)

  # Computes the covariance matrix of X.
  Sigma = (X' * X) / rows (X);

  # Uses svd to compute the eigenvectors and eigenvalues of the covariance
  # matrix.
  [U S V] = svd (Sigma);

endfunction
