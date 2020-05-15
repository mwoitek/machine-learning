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
# Function that plots the learned polynomial fit with exponent p and
# feature normalization (mu, sigma). This file isn't just a copy of
# the one provided to us. I changed the original code considerably.
function plotFit (min_x, max_x, mu, sigma, theta, p)

  # For x, we use a range slightly bigger than that given by the
  # mininum and maximum values of x. We do so to get an idea of how
  # the fit will vary outside the range of the data points.
  x = [min_x - 15:0.05:max_x + 25]';

  # Computes the polynomial features and normalizes them (using mu and sigma).
  X_poly = polyFeatures (x, p);
  X_poly = (X_poly - mu) ./ sigma;

  # Adds a column of ones to X_poly.
  X_poly = [(ones (rows (X_poly), 1)) X_poly];

  # Plots the polynomial fit.
  plot (x, (X_poly * theta), "--", "LineWidth", 2);

endfunction
