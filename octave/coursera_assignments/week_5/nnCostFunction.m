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
# Function that computes the cost function and its gradient for a 3-layer
# neural network which performs classification. The parameters of the neural
# network are "unrolled" into the vector nn_params. Then these parameters are
# reorganized to reconstruct the weight matrices Theta1 and Theta2. The
# returned vector grad is an "unrolled" vector containing the components of the
# gradient.
function [J grad] = nnCostFunction (nn_params, input_layer_size, ...
                                    hidden_layer_size, num_labels, ...
                                    X, y, lambda)

  # Number of training examples.
  m = rows (X);

  # Uses the vector y to construct the matrix y_matrix. This matrix stores the
  # information about the labels in a way that allows us to compute the cost
  # function. The i-th row of y_matrix is related to the label of the i-th
  # training example.
  y_matrix = zeros (m, num_labels);
  for i = 1:m
    y_matrix(i,y(i)) = 1;
  endfor

  # Reconstructs the weight matrices Theta1 and Theta2 from the "unrolled"
  # vector nn_params. A few helper variables are introduced to make the code
  # more readable.

  # Variables related to the dimensions of Theta1 and Theta2.
  rows_Theta1 = hidden_layer_size;
  cols_Theta1 = input_layer_size + 1;
  elem_Theta1 = rows_Theta1 * cols_Theta1;
  rows_Theta2 = num_labels;
  cols_Theta2 = hidden_layer_size + 1;

  # Reconstructs the weight matrices Theta1 and Theta2.
  Theta1 = reshape (nn_params(1:elem_Theta1), rows_Theta1, cols_Theta1);
  Theta2 = reshape (nn_params((elem_Theta1 + 1):end), rows_Theta2, cols_Theta2);

  # FEEDFORWARD.

  [a_3 z_3 a_2 z_2 a_1] = feedforward (Theta1, Theta2, X);
  a_3 = a_3';

  # COST FUNCTION.

  # COST WITHOUT REGULARIZATION.

  # Computes the contribution from the 1st term.
  J_0_1 = sum (y_matrix .* log (a_3), 2);
  J_0_1 = sum (J_0_1);
  # Computes the contribution from the 2nd term.
  J_0_2 = sum ((1 - y_matrix) .* log (1 - a_3), 2);
  J_0_2 = sum (J_0_2);
  # Computes the cost without regularization.
  J_0 = - (J_0_1 + J_0_2);

  # REGULARIZATION TERM.

  # Computes the contribution from the weight matrix Theta1.
  J_r_1 = sum (Theta1(:,2:end) .^ 2, 2);
  J_r_1 = sum (J_r_1);
  # Computes the contribution from the weight matrix Theta2.
  J_r_2 = sum (Theta2(:,2:end) .^ 2, 2);
  J_r_2 = sum (J_r_2);
  # Computes the regularization term.
  J_r = (lambda / 2) * (J_r_1 + J_r_2);

  # Computes the cost function.
  J = (J_0 + J_r) / m;

  # BACKPROPAGATION: GRADIENT OF THE COST FUNCTION.

  # Computes the elements of the matrices Theta1_grad and Theta2_grad. The
  # matrix Theta1_grad stores the partial derivatives of the cost function with
  # respect to the weights in Theta1. The elements of Theta2_grad are defined
  # analogously.

  # Initializes the matrices Theta1_grad and Theta2_grad.
  Theta1_grad = zeros (rows_Theta1, cols_Theta1);
  Theta2_grad = zeros (rows_Theta2, cols_Theta2);

  # GRADIENT WITHOUT REGULARIZATION.

  # ERROR VECTORS.

  # To compute the cost function, we had to run the feedforward algorithm. So
  # we can begin by calculating the error vectors.

  # Computes the elements of the matrix delta_3. It stores the error vector
  # delta^(3) for every training example. The vector corresponding to the i-th
  # example will be in the i-th column of delta_3.
  delta_3 = a_3 - y_matrix;
  delta_3 = delta_3';

  # Computes the elements of the matrix delta_2. It stores the error vector
  # delta^(2) for every training example. The vector corresponding to the i-th
  # example will be in the i-th column of delta_2.
  delta_2 = Theta2' * delta_3;
  delta_2 = delta_2 .* a_2 .* (1 - a_2);
  delta_2 = delta_2(2:end,:);

  # Computes the elements of the matrices Theta1_grad and Theta2_grad.

  # Loop over the training examples.
  for i = 1:m
    Theta1_grad += delta_2(:,i) * a_1(:,i)';
    Theta2_grad += delta_3(:,i) * a_2(:,i)';
  endfor

  # REGULARIZATION TERMS.

  # Adds to the matrices Theta1_grad and Theta2_grad the contributions from the
  # regularization terms. Notice that, for every matrix below, the first column
  # is ignored.
  Theta1_grad(:,2:end) += lambda * Theta1(:,2:end);
  Theta2_grad(:,2:end) += lambda * Theta2(:,2:end);

  # Computes the gradient of the cost function.
  grad = [Theta1_grad(:); Theta2_grad(:)] / m;

endfunction
