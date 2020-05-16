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
# This function runs the K-means algorithm on the m by n data matrix X.
# plot_progress is a true/false flag that indicates if the function should also
# plot its progress as the learning happens. This is set to false by default.
# The function returns "centroids", a K by n matrix of the computed centroids,
# and idx, a m-dimensional column vector of centroid assignments. This file
# isn't just a copy of the one provided to us. I changed the original code
# considerably.
function [centroids idx] = runkMeans (X, initial_centroids, max_iters, ...
                                      plot_progress)

  # If necessary, sets the default value for plot_progress.
  if ~(exist ("plot_progress", "var")) || isempty (plot_progress)
    plot_progress = false;
  endif

  # If we are plotting the progress, creates a new figure.
  if plot_progress
    figure;
    hold on;
  endif

  # Initializes a few variables related to the centroids.
  K = rows (initial_centroids);
  centroids = initial_centroids;
  previous_centroids = centroids;

  # Runs the K-means algorithm.
  for i = 1:max_iters

    # Outputs the progress.
    fprintf ("K-means algorithm - Iteration %d/%d\n", i, max_iters);

    # Assigns each example in X to the closest centroid.
    idx = findClosestCentroids (X, centroids);

    # If required, plots the progress.
    if plot_progress
      plotProgresskMeans (X, centroids, previous_centroids, idx, K, i);
      previous_centroids = centroids;
      fprintf ("Press ENTER to continue.\n");
      pause;
    endif

    # Computes the new centroids.
    centroids = computeCentroids (X, idx, K);

  endfor

  # If we are plotting the progress, holds off.
  if plot_progress
    hold off;
  endif

endfunction
