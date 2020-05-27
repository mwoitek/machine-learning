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
# Function that creates a small neural network to check the backpropagation
# algorithm. This function outputs the gradient computed with the aid of our
# backpropagation code, and the gradient computed by using the function
# computeNumericalGradient. These two gradient computations should produce very
# similar results. This file isn't just a copy of the one provided to us. I
# changed the original code considerably.
function checkNNGradients (lambda)

  # If the regularization parameter isn't specified, then uses the default
  # value 0.
  if ~(exist ("lambda", "var")) || isempty (lambda)
    lambda = 0;
  endif

  # NUMBERS OF UNITS.
  # Input layer: 3 units.
  input_layer_size = 3;
  # Hidden layer: 5 units.
  hidden_layer_size = 5;
  # Output layer: 3 units.
  num_labels = 3;

  # Generates weights for debugging.
  Theta1 = debugInitializeWeights (hidden_layer_size, input_layer_size);
  Theta2 = debugInitializeWeights (num_labels, hidden_layer_size);
  # Unrolls the weights.
  nn_params = [Theta1(:); Theta2(:)];

  # Number of training examples.
  m = 5;

  # Reuses the function debugInitializeWeights to generate the design matrix X.
  X = debugInitializeWeights (input_layer_size - 1, m);

  # Generates the vector of labels y.
  y = (mod (1:m, num_labels))' + 1;

  # Creates an alias for the function nnCostFunction.
  costFunc = @(p) nnCostFunction (p, input_layer_size, hidden_layer_size, ...
                                  num_labels, X, y, lambda);

  # Performs the two gradient computations.
  numgrad = computeNumericalGradient (costFunc, nn_params);
  [cost grad] = costFunc (nn_params);

  # Prints in two columns the results of the two gradient computations. The two
  # columns should be very similar.
  fprintf ("\n");
  disp ([numgrad grad]);
  fprintf ("\nThe above two columns should be very similar.\n");
  fprintf ("Left column: Gradient computed with computeNumericalGradient.\n");
  fprintf ("Right column: Gradient computed with nnCostFunction.\n");

  # Computes the relative difference between the two gradients. If you have a
  # correct implementation, and used EPSILON = 0.0001 in
  # computeNumericalGradient, then diff should be less than 1e-9.
  diff = norm (numgrad - grad) / norm (numgrad + grad);
  fprintf (["\nIf the backpropagation algorithm is correct, then the " ...
            "relative difference will be small (less than 1e-9).\n"]);
  fprintf ("\nRelative difference: %g\n", diff);

endfunction
