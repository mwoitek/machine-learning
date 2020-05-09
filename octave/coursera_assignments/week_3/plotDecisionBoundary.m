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
# Function that plots the data points with the decision boundary defined by
# theta.
# This file isn't just a copy of the one provided to us. I changed the original
# code considerably.
function plotDecisionBoundary (theta, X, y)

  plotData (X(:,2:3), y);

  # X is a m by 3 matrix.
  if columns (X) <= 3

    # Endpoints of the decision boundary line.
    plot_x = [(min (X(:,2)) - 2) (max (X(:,2)) + 2)];
    plot_y = (-1 / theta(3)) * (theta(2) * plot_x + theta(1));

    # Plots the decision boundary line.
    hold on;
    plot (plot_x, plot_y);
    hold off;
    xlabel ("Exam 1 score");
    ylabel ("Exam 2 score");
    legend ("Admitted", "Not admitted", "Decision boundary");
    axis ([30 100 30 100]);

  # X is a m by n matrix, where n > 3.
  else

    # Defines the grid range.
    u = linspace (-1, 1.5, 50);
    len_u = length (u);

    # Evaluates z = x * theta over the grid.
    z = zeros (len_u, len_u);
    for i = 1:len_u
      for j = 1:len_u
        z(i,j) = mapFeature (u(i), u(j)) * theta;
      endfor
    endfor

    # Plots z = 0. You need to specify the range [0 0].
    z = z';
    contour (u, u, z, [0 0], "LineWidth", 2);

  endif

endfunction
