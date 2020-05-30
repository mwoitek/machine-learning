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
# Function that computes the collaborative filtering cost function and
# its gradient. This function receives the "unrolled" vector
# params. This vector contains all the parameters of the cost
# function. It's also necessary to pass to this function the numbers
# of users, movies and features (num_users, num_movies and
# num_features). Y and R are num_movies by num_users matrices. The
# matrix Y stores user ratings of movies. The matrix R is so that
# R(i,j) = 1 if the user j rated the movie i. The last argument of
# this function corresponds to the regularization parameter. The
# returned vector grad is an "unrolled" vector containing all the
# partial derivatives of the cost function.
function [J grad] = cofiCostFunc (params, Y, R, num_users, num_movies, ...
				  num_features, lambda)

  # X is a num_movies by num_features matrix of movie features. Theta
  # is a num_users by num_features matrix of user features.

  # The "unrolled" vector params contains all the parameters in the
  # matrices Theta and X. We begin by reconstructing these matrices
  # from params.

  elem_X = num_movies * num_features;
  X = reshape (params(1:elem_X), num_movies, num_features);
  Theta = reshape (params((elem_X + 1):end), num_users, num_features);

  # COST FUNCTION.

  # COST WITHOUT REGULARIZATION.

  # Finds the elements of R that satisfy R(i,j) = 1.
  pos = find (R == 1);

  # Constructs the matrix of inner products between the vectors in Theta and X.
  Theta_X = X * Theta';

  # A helper matrix to avoid repeating calculations.
  M = zeros (size (Theta_X));
  M(pos) = Theta_X(pos) - Y(pos);

  # Computes the cost function without regularization.
  J_0 = sum (M .^ 2, 2);
  J_0 = sum (J_0);

  # REGULARIZATION TERM.

  # Computes the contribution from the matrix Theta.
  J_r_Theta = sum (Theta .^ 2, 2);
  J_r_Theta = sum (J_r_Theta);

  # Computes the contribution from the matrix X.
  J_r_X = sum (X .^ 2, 2);
  J_r_X = sum (J_r_X);

  # Computes the regularization term.
  J_r = lambda * (J_r_Theta + J_r_X);

  # Computes the cost function.
  J = (J_0 + J_r) / 2;

  # GRADIENT OF THE COST FUNCTION.

  # X_grad is a num_movies by num_features matrix. It stores the
  # partial derivatives of J with respect to each of the parameters in
  # X. Theta_grad is a num_users by num_features matrix. It stores the
  # partial derivatives of J with respect to each of the parameters in
  # Theta.

  # GRADIENT WITHOUT REGULARIZATION.

  # Uses our helper matrix M to compute the gradient without regularization.
  X_grad = M * Theta;
  Theta_grad = M' * X;

  # REGULARIZATION TERMS.

  # Adds to the matrices X_grad and Theta_grad the contributions from the
  # regularization terms.
  X_grad += lambda * X;
  Theta_grad += lambda * Theta;

  # Creates the "unrolled" vector grad. This vector stores all of the partial
  # derivatives in X_grad and Theta_grad.
  grad = [X_grad(:); Theta_grad(:)];

endfunction
