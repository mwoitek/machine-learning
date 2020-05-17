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
# Function that computes the projection of the normalized data in X (matrix
# with m examples and n features). Each row of this matrix is an "example
# vector". More precisely, this function projects every such vector into the
# reduced space spanned by the first K columns of U (K eigenvectors of the
# covariance matrix of X). The projected examples are returned through the m by
# K matrix Z.
function Z = projectData (X, U, K)

  # Computes the matrix Z. This matrix is so that the i-th row Z(i,:) stores
  # the i-th projected example.
  Z = X * U(:,1:K);

endfunction
