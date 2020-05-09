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
# Function that plots the positive and negative examples on a 2D plot. Plots
# the data points with + for the positive examples, and o for the negative
# ones.
function plotData (X, y)

  # Finds the indexes of the positive and negative examples.
  pos = find (y == 1);
  neg = find (y == 0);

  figure;
  hold on;
  plot (X(pos,1), X(pos,2), "k+", "LineWidth", 2, "MarkerSize", 7);
  plot (X(neg,1), X(neg,2), "ko", "MarkerFaceColor", "y", "MarkerSize", 7);
  hold off;

endfunction
