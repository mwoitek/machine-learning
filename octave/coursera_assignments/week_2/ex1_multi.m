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
# Machine Learning Online Class - Exercise 1: Linear regression with multiple
# variables.
# This file isn't just a copy of the one provided to us. I changed the original
# code considerably.

clear;
close all;
clc

fprintf ("Loading data...\n");
data = load ("ex1data2.txt");
X = data(:,1:2);
y = data(:,3);
m = length (y); # Number of training examples.

# Prints out some data points.
fprintf ("\nFirst 10 examples from the dataset:\n");
fprintf ("x = [%d %d], y = %d\n", [X(1:10,:) y(1:10,:)]');

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nNormalizing features...\n");
[X_norm mu sigma] = featureNormalize (X);

# Adds a column of ones to X and X_norm.
X = [(ones (m, 1)) X];
X_norm = [(ones (m, 1)) X_norm];

# Some gradient descent settings.
alpha = 0.01;
num_iters = 400;

# Initializes the fitting parameters.
theta = zeros (3, 1);

fprintf ("\nRunning gradient descent...\n");
[theta J_history] = gradientDescentMulti (X_norm, y, theta, alpha, num_iters);

# Plots the convergence graph.
figure;
plot (1:numel (J_history), J_history, "-b", "LineWidth", 2);
xlabel ("Number of iterations");
ylabel ("Cost J");

# Displays the gradient descent's results.
fprintf ("\ntheta found by gradient descent:\n");
fprintf ("%f\n", theta);

# Estimates the price of a 1650 sq. ft., 3 bedroom house.
temp = [1650 3];
for i = 1:columns (temp)
  temp(i) = (temp(i) - mu(i)) / sigma(i);
endfor
temp = [1 temp];
price = temp * theta;
fprintf ("\nPredicted price of a 1650 sq. ft., 3 bedroom house (using gradient descent):\n");
fprintf ("$ %.2f\n", price);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nSolving with normal equations...\n");

# Calculates the parameters from the normal equations.
theta = normalEqn (X, y);

# Displays the normal equations' results.
fprintf ("\ntheta found from the normal equations:\n");
fprintf ("%f\n", theta);

# Estimates the price of a 1650 sq. ft., 3 bedroom house.
price = [1 1650 3] * theta;
fprintf ("\nPredicted price of a 1650 sq. ft., 3 bedroom house (using normal equations):\n");
fprintf ("$ %.2f\n", price);
