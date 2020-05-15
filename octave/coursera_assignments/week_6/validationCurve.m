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
# This function takes in the training set (X, y) and the validation
# set (Xval, yval). Then the function returns the training error and
# the validation error (error_train and error_val) for different
# values of lambda.
function [lambda_vec error_train error_val] = ...
 validationCurve (X, y, Xval, yval)

  # Selected values of lambda (Don't change this).
  lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

  # Number of different values of lambda.
  lambda_num = length (lambda_vec);

  # Initializes the vectors the function returns.
  error_train = zeros (lambda_num, 1);
  error_val = zeros (lambda_num, 1);

  # Loop over the values of lambda.
  for i = 1:lambda_num

    # Applying regularized linear regression with
    # lambda = lambda_vec(i).
    theta = trainLinearReg (X, y, lambda_vec(i));

    # Computes the training error for lambda = lambda_vec(i).
    res = y - X * theta;
    error_train(i) = dot (res, res) / (2 * rows (X));

    # Computes the validation error for lambda = lambda_vec(i).
    res = yval - Xval * theta;
    error_val(i) = dot (res, res) / (2 * rows (Xval));

  endfor

endfunction
