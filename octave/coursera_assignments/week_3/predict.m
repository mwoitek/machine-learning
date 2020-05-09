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
# Function that uses the learned logistic regression parameters to predict
# whether the label is 0 or 1.
function p = predict (theta, X)

  # Loads a vector with the values of the hypothesis function.
  h_theta = sigmoid (X * theta);

  # Number of training examples.
  m = rows (X);

  # If sigmoid (theta' * x) < 0.5, predicts 0.
  # If sigmoid (theta' * x) >= 0.5, predicts 1.
  p = zeros (m, 1);
  p(h_theta >= 0.5) = 1;

endfunction
