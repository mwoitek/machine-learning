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
# Machine Learning Online Class - Exercise 4: Neural Network Learning. This
# file isn't just a copy of the one provided to us. I changed the original code
# considerably.

clear;
close all;
clc

# NUMBERS OF UNITS.
# Input layer: 400 units (20x20 images of handwritten digits).
input_layer_size = 400;
# Hidden layer: 25 units.
hidden_layer_size = 25;
# Output layer: 10 units (Number of labels).
# There are 10 labels, from 1 to 10. We have mapped the digit 0 to label 10.
num_labels = 10;

fprintf ("Loading and visualizing data...\n");
# The training data is stored in the arrays X and y.
load ("ex4data1.mat");
m = rows (X);

# Randomly selects 100 data points and displays them.
rand_indices = randperm (m);
sel = X(rand_indices(1:100),:);
displayData (sel);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nLoading saved neural network parameters...\n");
# Loads the weights into the matrices Theta1 and Theta2.
load ("ex4weights.mat");

# Unrolls the parameters. In other words, stores all of the elements of the
# matrices Theta1 and Theta2 in a single vector.
nn_params = [Theta1(:); Theta2(:)];

# FEEDFORWARD.

fprintf ("\nFeedforward using the neural network...\n");

# Weight regularization parameter (Here we set this to 0).
lambda = 0;

J = nnCostFunction (nn_params, input_layer_size, hidden_layer_size, num_labels, ...
                    X, y, lambda);

fprintf ("\nCost at parameters loaded from ex4weights: %.6f\n", J);
fprintf ("Expected cost: 0.287629\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nChecking the cost function with regularization...\n");

# Weight regularization parameter (Here we set this to 1).
lambda = 1;

J = nnCostFunction (nn_params, input_layer_size, hidden_layer_size, num_labels, ...
                    X, y, lambda);

fprintf ("\nCost at parameters loaded from ex4weights: %.6f\n", J);
fprintf ("Expected cost: 0.383770\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nEvaluating the gradient (derivative) of the sigmoid function...\n");
g = sigmoidGradient ([-1 -0.5 0 0.5 1]);
fprintf ("\nGradient (derivative) evaluated at [-1 -0.5 0 0.5 1]:\n");
fprintf ("%f\n", g);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nChecking the backpropagation algorithm...\n");

# Checks the gradient by running checkNNGradients.
checkNNGradients;

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nChecking the backpropagation algorithm (with regularization)...\n");

# Checks the gradient by running checkNNGradients.
lambda = 3;
checkNNGradients (lambda);

# Also checks by computing the cost function.
J = nnCostFunction (nn_params, input_layer_size, hidden_layer_size, num_labels, ...
                    X, y, lambda);

fprintf (["\nCost at parameters loaded from ex4weights (with lambda = %f): " ...
          "%.6f\n"], lambda, J);
fprintf ("Expected cost (for lambda = 3): 0.576051\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nRandomly initializing the neural network parameters...\n");
initial_Theta1 = randInitializeWeights (input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights (hidden_layer_size, num_labels);
# Unrolls the parameters. In other words, stores all of the elements of the
# matrices initial_Theta1 and initial_Theta2 in a single vector.
initial_nn_params = [initial_Theta1(:); initial_Theta2(:)];

fprintf ("\nTraining the neural network...\n");

# Try different values of lambda:
lambda = 1;

# Creates an alias for the cost function to be minimized. costFunction is a
# function that takes in only one argument.
costFunction = @(p) nnCostFunction (p, input_layer_size, hidden_layer_size, ...
                                    num_labels, X, y, lambda);

# Sets the options for fmincg. Change MaxIter to a larger value to see how more
# iterations help.
options = optimset ("MaxIter", 50);

# Runs fmincg to obtain the optimal parameters.
[nn_params cost] = fmincg (costFunction, initial_nn_params, options);

# Constructs the weight matrices Theta1 and Theta2 from the "unrolled"
# vector nn_params. A few helper variables are introduced to make the code
# more readable.

# Variables related to the dimensions of Theta1 and Theta2.
rows_Theta1 = hidden_layer_size;
cols_Theta1 = input_layer_size + 1;
elem_Theta1 = rows_Theta1 * cols_Theta1;
rows_Theta2 = num_labels;
cols_Theta2 = hidden_layer_size + 1;

# Constructs the weight matrices Theta1 and Theta2.
Theta1 = reshape (nn_params(1:elem_Theta1), rows_Theta1, cols_Theta1);
Theta2 = reshape (nn_params((elem_Theta1 + 1):end), rows_Theta2, cols_Theta2);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nVisualizing the neural network...\n");
displayData (Theta1(:,2:end));

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Uses the neural network to predict the labels of the training set. It also
# computes and displays the training accuracy.
p = predict (Theta1, Theta2, X);
train_acc = 100 * mean (double (p == y));
fprintf ("\nTraining accuracy: %.1f %%\n", train_acc);
