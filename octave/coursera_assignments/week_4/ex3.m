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
# Machine Learning Online Class - Exercise 3: One-vs-all.
# This file isn't just a copy of the one provided to us. I changed the original
# code considerably.

% oneVsAll.m
% predictOneVsAll.m
% predict.m

clear;
close all;
clc

# Setting a few parameters.
# 20x20 Input images of digits.
input_layer_size = 400;
# 10 labels, from 1 to 10. We have mapped the digit 0 to label 10.
num_labels = 10;

fprintf ("Loading and visualizing data...\n");
# The training data is stored in the arrays X and y.
load ("ex3data1.mat");
m = rows (X);

# Randomly selects 100 data points and displays them.
# Vector containing a random permutation of 1:m.
rand_indices = randperm (m);
sel = X(rand_indices(1:100),:);
displayData (sel);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nTesting the function lrCostFunction...\n");

theta_t = [-2; -1; 1; 2];
X_t = [(ones (5, 1)) (reshape (1:15, 5, 3) / 10)];
y_t = [1; 0; 1; 0; 1] >= 0.5;
lambda_t = 3;
[J grad] = lrCostFunction (theta_t, X_t, y_t, lambda_t);

fprintf ("\nCost: %.6f\n", J);
fprintf ("Expected cost: 2.534819\n");
fprintf ("Gradient:\n");
fprintf ("%.6f\n", grad);
fprintf ("Expected gradient:\n");
fprintf ("0.146561\n");
fprintf ("-0.548558\n");
fprintf ("0.724722\n");
fprintf ("1.398003\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nTraining one-vs-all logistic regression...\n");
lambda = 0.1;
[all_theta] = oneVsAll (X, y, num_labels, lambda);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

pred = predictOneVsAll (all_theta, X);
fprintf ("\nTraining set accuracy: %f\n", mean (double (pred == y)) * 100);
