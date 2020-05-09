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
# Function that returns a normalized version of X (without the column with
# ones). After the normalization, the mean value of each feature is 0, and the
# corresponding standard deviation is 1.
function [X_norm mu sigma] = featureNormalize (X)
  cols = columns (X);
  X_norm = zeros (rows (X), cols);
  mu = zeros (1, cols);
  sigma = zeros (1, cols);
  for i = 1:cols
    temp = X(:,i);
    # For each feature, computes the mean value.
    mu(i) = mean (temp);
    # For each feature, computes the standard deviation.
    sigma(i) = std (temp);
    # Normalizes each feature.
    X_norm(:,i) = (temp - mu(i)) / sigma(i);
  endfor
endfunction
