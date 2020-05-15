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
# Machine Learning Online Class - Exercise 5: Regularized Linear
# Regression and Bias-Variance. This file isn't just a copy of the one
# provided to us. I changed the original code considerably.

# x is the change in the water level of the dam.
# y is the amount of water flowing out of the dam.

clear;
close all;
clc

fprintf ("Loading and visualizing data...\n");
# The values of x and y will be stored in X, y, Xval, yval, Xtest,
# ytest.
load ("ex5data1.mat");
figure;
hold on;
plot (X, y, "rx", "MarkerSize", 10, "LineWidth", 1.5);
hold off;
xlabel ("Change in the water level");
ylabel ("Water flowing out of the dam");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Number of training examples.
m = rows (X);

X_ones = [(ones (m, 1)) X];

fprintf ("\nTesting the function that computes the cost and its gradient...\n");
theta = [1; 1];
[J, grad] = linearRegCostFunction (X_ones, y, theta, 1);
fprintf ("\nCost at theta = [1; 1]: %.6f\n", J);
fprintf ("Expected cost: 303.993192\n");
fprintf ("\nGradient at theta = [1; 1]: [%.6f; %.6f]\n", grad(1), grad(2));
fprintf ("Expected gradient: [-15.303016; 598.250744]\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nTraining regularized linear regression...\n");
# The data is non-linear, so linear regression won't give a great fit.

fprintf ("\nTraining without regularization (lambda = 0)...\n");
lambda = 0;
theta = trainLinearReg (X_ones, y, lambda);

# Plots the linear fit over the data.
hold on;
plot (X, (X_ones * theta), "--", "LineWidth", 2);
hold off;
xlabel ("Change in the water level");
ylabel ("Water flowing out of the dam");
legend ("Training set", "Linear fit", "location", "north");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Since the model is underfitting the data, we expect to see a graph
# with high bias.

[error_train error_val] = ...
  learningCurve (X_ones, y, [(ones (rows (Xval), 1)) Xval], yval, lambda);

figure;
hold on;
plot (1:m, error_train, 1:m, error_val);
hold off;
xlabel ("Number of training examples");
ylabel ("Error");
legend ("Training set", "Cross validation set", "location", "north");
axis ([0 13 0 150]);
title ("Learning curve for regularized linear regression");

fprintf ("\n+-------------------+----------------+------------------------+\n");
fprintf ("| Training examples | Training error | Cross validation error |\n");
fprintf ("+-------------------+----------------+------------------------+\n");
for i = 1:m
  fprintf ("|                %.2d |    %.5E |            %.5E |\n", ...
	   i, error_train(i), error_val(i));
endfor
fprintf ("+-------------------+----------------+------------------------+\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# One solution to the problem of underfitting is to use polynomial
# regression.

# Largest exponent used to compute the polynomial features.
p = 8;

# For the training set, computes the polynomial features and
# normalizes them.
X_poly = polyFeatures (X, p);
[X_poly mu sigma] = featureNormalize (X_poly);

# Adds a column of ones to X_poly.
X_poly = [(ones (m, 1)) X_poly];

# For the cross validation set, computes the polynomial features and
# normalizes them (using mu and sigma).
X_poly_val = polyFeatures (Xval, p);
X_poly_val = (X_poly_val - mu) ./ sigma;

# Adds a column of ones to X_poly_val.
X_poly_val = [(ones (rows (X_poly_val), 1)) X_poly_val];

# For the test set, computes the polynomial features and normalizes
# them (using mu and sigma).
X_poly_test = polyFeatures (Xtest, p);
X_poly_test = (X_poly_test - mu) ./ sigma;

# Adds a column of ones to X_poly_test.
X_poly_test = [(ones (rows (X_poly_test), 1)) X_poly_test];

fprintf ("\nNormalized training example 01:\n");
fprintf ("%f\n", X_poly(1,:));

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nLearning curve for polynomial regression...\n");

lambda = 0;
theta = trainLinearReg (X_poly, y, lambda);

fprintf ("\nPlotting the training data and the polynomial regression fit...\n");
figure;
hold on;
plot (X, y, "rx", "MarkerSize", 10, "LineWidth", 1.5);
plotFit (min (X), max (X), mu, sigma, theta, p);
hold off;
xlabel ("Change in the water level");
ylabel ("Water flowing out of the dam");
title (sprintf ("Polynomial regression fit (lambda = %f)", lambda));

fprintf ("\nPlotting the polynomial regression learning curve...\n");
[error_train error_val] = learningCurve (X_poly, y, X_poly_val, yval, lambda);
figure;
hold on;
plot (1:m, error_train, 1:m, error_val);
hold off;
xlabel ("Number of training examples");
ylabel ("Error");
legend ("Training set", "Cross validation set", "location", "north");
axis ([0 13 0 100]);
title (sprintf ("Polynomial regression learning curve (lambda = %f)", lambda));

fprintf ("\nPolynomial regression (lambda = %f)\n", lambda);
fprintf ("\n+-------------------+----------------+------------------------+\n");
fprintf ("| Training examples | Training error | Cross validation error |\n");
fprintf ("+-------------------+----------------+------------------------+\n");
for i = 1:m
  fprintf ("|                %.2d |    %.5E |            %.5E |\n", ...
	   i, error_train(i), error_val(i));
endfor
fprintf ("+-------------------+----------------+------------------------+\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nValidation for selecting the best lambda value...\n");

[lambda_vec error_train error_val] = ...
  validationCurve (X_poly, y, X_poly_val, yval);

figure;
hold on;
plot (lambda_vec, error_train, lambda_vec, error_val);
hold off;
xlabel ('Regularization parameter \lambda');
ylabel ("Error");
legend ("Training set", "Cross validation set", "location", "north");

fprintf ("\n+-------------+----------------+------------------------+\n");
fprintf ("|   lambda    | Training error | Cross validation error |\n");
fprintf ("+-------------+----------------+------------------------+\n");
for i = 1:length (lambda_vec)
  fprintf ("| %.5E |    %.5E |            %.5E |\n", ...
	   lambda_vec(i), error_train(i), error_val(i));
endfor
fprintf ("+-------------+----------------+------------------------+\n");

# fprintf ("\nProgram paused. Press ENTER to continue.\n");
# pause;
