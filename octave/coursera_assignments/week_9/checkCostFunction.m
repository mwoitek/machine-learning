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
# Function that creates a small collaborative filtering problem to check the
# code for computing the cost function and its gradient. This function outputs
# the gradient computed with the aid of the functions computeNumericalGradient
# and cofiCostFunc. These two gradient computations should produce very similar
# results. This file isn't just a copy of the one provided to us. I changed the
# original code considerably.
function checkCostFunction (lambda)

  # If the regularization parameter isn't specified, then uses the default
  # value 0.
  if ~(exist ("lambda", "var")) || isempty (lambda)
    lambda = 0;
  endif

  # Creates a small collaborative filtering problem.
  X_t = rand (4, 3);
  Theta_t = rand (5, 3);
  Y = X_t * Theta_t';
  Y(rand (4, 5) > 0.5) = 0;
  R = zeros (4, 5);
  R(Y != 0) = 1;
  X = rand (4, 3);
  Theta = rand (5, 3);
  params = [X(:); Theta(:)];
  num_features = 3;
  num_movies = 4;
  num_users = 5;

  # Creates an alias for the function cofiCostFunc.
  costFunc = @(t) cofiCostFunc (t, Y, R, num_users, num_movies, num_features, ...
                                lambda);

  # Performs the two gradient computations.
  numgrad = computeNumericalGradient (costFunc, params);
  [cost grad] = costFunc (params);

  # Prints in two columns the results of the two gradient computations. The two
  # columns should be very similar.
  fprintf ("\n");
  disp ([numgrad grad]);
  fprintf ("\nThe above two columns should be very similar.\n");
  fprintf ("Left column: Gradient computed with computeNumericalGradient.\n");
  fprintf ("Right column: Gradient computed with cofiCostFunc.\n");

  # Computes the relative difference between the two gradients. If you have a
  # correct implementation, and used epsilon = 0.0001 in
  # computeNumericalGradient, then diff should be less than 1e-9.
  diff = norm (numgrad - grad) / norm (numgrad + grad);
  fprintf (["\nIf the cost function code is correct, then the relative " ...
            "difference will be small (less than 1e-9).\n"]);
  fprintf ("\nRelative difference: %g\n", diff);

endfunction
