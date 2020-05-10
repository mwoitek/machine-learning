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
# Machine Learning Online Class - Exercise 2: Logistic regression.
# This file isn't just a copy of the one provided to us. I changed the original
# code considerably.

clear;
close all;
clc

# Loads data. The first two columns contain the exam scores and the third
# column contains the label.
data = load ("ex2data1.txt");
X = data(:,1:2);
y = data(:,3);

fprintf (["Plotting data with + indicating y = 1 examples and " ...
          "o indicating y = 0 examples.\n"]);
plotData (X, y);
xlabel ("Exam 1 score");
ylabel ("Exam 2 score");
legend ("Admitted", "Not admitted");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Adds a column of ones to X.
[m n] = size (X);
X = [(ones (m, 1)) X];

# Computes and displays the initial cost and the initial gradient.
initial_theta = zeros (n + 1, 1);
[cost grad] = costFunction (initial_theta, X, y);
fprintf ("\nCost at initial theta (zeros): %.3f\n", cost);
fprintf ("Expected cost: 0.693\n");
fprintf ("Gradient at initial theta (zeros):\n");
fprintf ("%.4f\n", grad);
fprintf ("Expected gradient:\n");
fprintf ("-0.1000\n");
fprintf ("-12.0092\n");
fprintf ("-11.2628\n");

# Computes and displays the cost and the gradient with non-zero theta.
test_theta = [-24; 0.2; 0.2];
[cost grad] = costFunction (test_theta, X, y);
fprintf ("\nCost at test theta: %.3f\n", cost);
fprintf ("Expected cost: 0.218\n");
fprintf ("Gradient at test theta:\n");
fprintf ("%.3f\n", grad);
fprintf ("Expected gradient:\n");
fprintf ("0.043\n");
fprintf ("2.566\n");
fprintf ("2.647\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Sets the options for fminunc (built-in function).
options = optimset ("GradObj", "on", "MaxIter", 400);

# Runs fminunc to obtain the optimal theta.
[theta cost] = fminunc (@(t) (costFunction (t, X, y)), initial_theta, options);

# Prints theta.
fprintf ("\nCost at theta found by fminunc: %.3f\n", cost);
fprintf ("Expected cost: 0.203\n");
fprintf ("theta found by fminunc:\n");
fprintf ("%.3f\n", theta);
fprintf ("Expected theta:\n");
fprintf ("-25.161\n");
fprintf ("0.206\n");
fprintf ("0.201\n");

# Plots the decision boundary.
plotDecisionBoundary (theta, X, y);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Predicts the admission probability for a student with score 45 on exam 1, and
# score 85 on exam 2.
prob = sigmoid ([1 45 85] * theta);
fprintf (["\nFor a student with scores 45 and 85, we predict an admission " ...
          "probability of %.3f\n"], prob);
fprintf ("Expected probability: 0.775 +/- 0.002\n");

# Computes the training accuracy.
p = predict (theta, X);
train_acc = 100 * mean (double (p == y));
fprintf ("\nTraining accuracy: %.1f %%\n", train_acc);
fprintf ("Expected accuracy: 89.0 %%\n");
