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
# Function that displays the progress of the K-means algorithm. It's intended
# for use with 2D data only. More precisely, this function plots the data
# points with colors assigned to each centroid. It also plots a line between
# the previous location and the current location of the centroids. This file
# isn't just a copy of the one provided to us. I changed the original code
# considerably.
function plotProgresskMeans (X, centroids, previous, idx, K, i)

  # Plots the examples.
  plotDataPoints (X, idx, K);

  # Plots the centroids as black x's.
  plot (centroids(:,1), centroids(:,2), "x", "MarkerEdgeColor", "k", ...
        "MarkerSize", 10, "LineWidth", 3);

  # Plots the history of the centroids with lines.
  for j = 1:rows (centroids)
    drawLine (centroids(j,:), previous(j,:));
  endfor

  title (sprintf ("Iteration number %d", i));

endfunction
