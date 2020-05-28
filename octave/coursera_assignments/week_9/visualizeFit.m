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
# Function for visualizing the dataset and the probability density function of
# the Gaussian distribution. Each example has a location (x1, x2) that depends
# on its feature values. This file isn't just a copy of the one provided to us.
# I changed the original code considerably.
function visualizeFit (X, mu, sigma2)

  [X1 X2] = meshgrid (0:.5:35);
  Z = multivariateGaussian ([X1(:) X2(:)], mu, sigma2);
  Z = reshape (Z, size (X1));

  plot (X(:,1), X(:,2), "bx");
  hold on;
  # If there are infinities, do not plot.
  if (sum (isinf (Z)) == 0)
    contour (X1, X2, Z, 10 .^ (-20:3:0)');
  endif
  hold off;

endfunction
