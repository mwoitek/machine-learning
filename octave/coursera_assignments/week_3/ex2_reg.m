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
# Machine Learning Online Class - Exercise 2: Logistic regression with
# regularization.
# This file isn't just a copy of the one provided to us. I changed the original
# code considerably.

clear;
close all;
clc

# Loads data. The first 2 columns contain the x values and the third column
# contains the label y.
data = load ("ex2data2.txt");
X = data(:,1:2);
y = data(:,3);

plotData (X, y);
xlabel ("Microchip test 1");
ylabel ("Microchip test 2");
legend ("y = 1", "y = 0");

# You are given a dataset with points that are not linearly separable. To deal
# with this, you introduce polynomial features by using the function
# mapFeature. This function also adds to X a column of ones.
X = mapFeature (X(:,1), X(:,2));

# Computes and displays the initial cost and the initial gradient. To do so,
# we use lambda = 1.
initial_theta = zeros (columns (X), 1); # Initializes the fitting parameters.
[cost grad] = costFunctionReg (initial_theta, X, y, 1);
fprintf ("Cost at initial theta (zeros): %.3f\n", cost);
fprintf ("Expected cost: 0.693\n");
fprintf ("Gradient at initial theta (zeros) - First 5 values only:\n");
fprintf ("%.4f\n", grad(1:5));
fprintf ("Expected gradient - First 5 values only:\n");
fprintf ("0.0085\n");
fprintf ("0.0188\n");
fprintf ("0.0001\n");
fprintf ("0.0503\n");
fprintf ("0.0115\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Computes and displays the cost function and its gradient. To do so, we use an
# all-ones theta and lambda = 10.
test_theta = ones (columns (X), 1);
[cost grad] = costFunctionReg (test_theta, X, y, 10);
fprintf ("\nCost at test theta (with lambda = 10): %.2f\n", cost);
fprintf ("Expected cost: 3.16\n");
fprintf ("Gradient at test theta - First 5 values only:\n");
fprintf ("%.4f\n", grad(1:5));
fprintf ("Expected gradient - First 5 values only:\n");
fprintf ("0.3460\n");
fprintf ("0.1614\n");
fprintf ("0.1948\n");
fprintf ("0.2269\n");
fprintf ("0.0922\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Sets the regularization parameter.
lambda = 1;

# Sets the options for fminunc (built-in function).
options = optimset ("GradObj", "on", "MaxIter", 400);

# Runs fminunc to obtain the optimal theta.
[theta cost] = fminunc (@(t) (costFunctionReg (t, X, y, lambda)), ...
                        initial_theta, options);

# Plots the decision boundary.
plotDecisionBoundary (theta, X, y);
title (sprintf ("lambda = %g", lambda));
xlabel ("Microchip test 1");
ylabel ("Microchip test 2");
legend ("y = 1", "y = 0", "Decision boundary");

# Computes the training accuracy.
p = predict (theta, X);
train_acc = 100 * mean (double (p == y));
fprintf ("\nTraining accuracy: %.1f %%\n", train_acc);
fprintf ("Expected accuracy (with lambda = 1): 83.1 %%\n");
