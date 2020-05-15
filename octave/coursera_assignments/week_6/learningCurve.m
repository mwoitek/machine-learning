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
# Function that returns the training error and the cross validation
# error for a learning curve. More precisely, this function returns
# two vectors with the same length, error_train and
# error_val. error_train(i) contains the training error for i
# examples, and error_val(i) contains the cross validation error for i
# examples.
function [error_train error_val] = learningCurve (X, y, Xval, yval, lambda)

  # Number of training examples.
  m = rows (X);

  # In this function, we compute the errors for dataset sizes from 1
  # up to m. When working with larger datasets, it might be better to
  # do this in larger intervals.
  # Initializes the vectors the function returns.
  error_train = zeros (m, 1);
  error_val = zeros (m, 1);

  # Loop over the examples.
  for i = 1:m

    # Applying regularized linear regression to the first i training
    # examples.
    theta = trainLinearReg (X(1:i,:), y(1:i), lambda);

    # Computes the training errors.
    res = y(1:i) - X(1:i,:) * theta;
    error_train(i) = dot (res, res) / (2 * i);

    # Computes the cross validation errors. To perform this
    # computation, we consider the entire cross validation set (Xval
    # and yval).
    res = yval - Xval * theta;
    error_val(i) = dot (res, res) / (2 * rows (Xval));

  endfor

endfunction
