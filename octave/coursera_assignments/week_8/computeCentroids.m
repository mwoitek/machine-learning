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
# This function takes in the following:
# - The dataset stored in the matrix X: This dataset contains m examples. The
# i-th row X(i,:) corresponds to the i-th example.
# - The m-dimensional column vector idx of centroid assignments.
# - The number of centroids K.
# The function returns the new centroids by computing the means of the data
# points assigned to each centroid. These results are stored in the matrix
# "centroids". This matrix is so that centroids(j,:) is the mean of the points
# assigned to the j-th centroid.
function centroids = computeCentroids (X, idx, K)

  # Number of features.
  n = columns (X);

  # Initializes the matrix that the function returns.
  centroids = zeros (K, n);

  # Loop over the centroids.
  for i = 1:K

    # Selects the data points that were assigned to the i-th centroid.
    assigned_points = X(find (idx == i),:);

    # Stores the mean of the selected points in the i-th row of "centroids".
    centroids(i,:) = mean (assigned_points, 1);

  endfor

endfunction
