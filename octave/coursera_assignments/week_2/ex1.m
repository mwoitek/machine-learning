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
# Machine Learning Online Class - Exercise 1: Linear Regression.
# This file isn't just a copy of the one provided to us. I changed the original
# code considerably.

# x refers to the population size in 10,000s.
# y refers to the profit in $10,000s.

clear;
close all;
clc

fprintf ("Running warmUpExercise...\n");
fprintf ("5x5 identity matrix:\n");
warmUpExercise ()

fprintf ("Program paused. Press ENTER to continue.\n");
pause;

fprintf ("\nPlotting data...\n");
data = load ("ex1data1.txt");
X = data(:,1);
y = data(:,2);
m = length (y); # Number of training examples.
plotData (X, y);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Some gradient descent settings.
alpha = 0.01;
num_iters = 1500;

# Initializes the fitting parameters.
theta = zeros (2, 1);

# Adds a column of ones to X.
X = [(ones (m, 1)) X];

fprintf ("\nTesting the cost function...\n");

# Computes and displays the initial cost.
J = computeCost (X, y, theta);
fprintf ("\nWith theta = [0; 0]\nCost computed = %.2f\n", J);
fprintf ("Expected cost value = 32.07\n");

# Further testing of the cost function.
J = computeCost (X, y, [-1; 2]);
fprintf ("\nWith theta = [-1; 2]\nCost computed = %.2f\n", J);
fprintf ("Expected cost value = 54.24\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nRunning gradient descent...\n");
theta = gradientDescent (X, y, theta, alpha, num_iters);

# Prints theta.
fprintf ("\ntheta found by gradient descent:\n");
fprintf ("%.4f\n", theta);
fprintf ("\nExpected theta values:\n");
fprintf ("-3.6303\n1.1664\n\n");

# Plots the linear fit.
hold on; # Keeps the previous plot visible.
plot (X(:,2), (X * theta), "-");
legend ("Training data", "Linear regression");
hold off; # Doesn't overlay any more plots on this figure.

# Predicts the values for population sizes of 35,000 and 70,000.
predict1 = [1 3.5] * theta;
fprintf ("For population = 35,000, we predict a profit of $ %.2f\n", predict1 * 10000);
predict2 = [1 7] * theta;
fprintf ("For population = 70,000, we predict a profit of $ %.2f\n", predict2 * 10000);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nVisualizing J(theta_0, theta_1)...\n");

# Grid over which we will calculate J.
theta0_vals = linspace (-10, 10, 100);
theta1_vals = linspace (-1, 4, 100);

# Initializes J_vals to a matrix of 0's.
J_vals = zeros (length (theta0_vals), length (theta1_vals));

# Fills out J_vals.
for i = 1:length (theta0_vals)
  for j = 1:length (theta1_vals)
    t = [theta0_vals(i); theta1_vals(j)];
    J_vals(i,j) = computeCost (X, y, t);
  endfor
endfor

# Because of the way meshgrids work in the surf command, we need to transpose
# J_vals before calling surf. Otherwise, the axes will be flipped.
J_vals = J_vals';

# Surface plot.
figure;
surf (theta0_vals, theta1_vals, J_vals);
xlabel ('\theta_0');
ylabel ('\theta_1');

# Contour plot.
figure;
# Plots J_vals as 15 contours spaced logarithmically between 0.01 and 100.
contour (theta0_vals, theta1_vals, J_vals, logspace (-2, 3, 20));
xlabel ('\theta_0');
ylabel ('\theta_1');
hold on;
plot (theta(1), theta(2), "rx", "MarkerSize", 10, "LineWidth", 2);
