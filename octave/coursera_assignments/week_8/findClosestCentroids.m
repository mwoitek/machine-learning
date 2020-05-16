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
# This function takes in the dataset stored in the matrix X. This dataset
# contains m examples. The i-th row X(i,:) corresponds to the i-th example. The
# function returns the m-dimensional column vector idx of centroid assignments.
# There are K centroids. Then idx(i) stores a number in the range 1, ..., K
# that identifies the centroid that is closest to the i-th example.
function idx = findClosestCentroids (X, centroids)

  # Number of examples.
  m = rows (X);

  # Initializes the column vector that the function returns.
  idx = zeros (m, 1);

  # Loop over the examples.
  for i = 1:m

    # Computes the square of the distance between the i-th example and every
    # centroid. More precisely, creates the K-dimensional column vector
    # sq_dist. This vector is so that sq_dist(j) is the square of the distance
    # between the i-th example and the j-th centroid.
    sq_dist = X(i,:) - centroids;
    sq_dist = sq_dist .^ 2;
    sq_dist = sum (sq_dist, 2);

    # The next number we want to store in idx corresponds to the position of
    # the minimum value in sq_dist.
    [min_val pos_min] = min (sq_dist);
    idx(i) = pos_min;

  endfor

endfunction
