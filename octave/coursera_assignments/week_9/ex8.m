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
# Machine Learning Online Class - Exercise 8: Anomaly Detection and
# Collaborative Filtering. This file isn't just a copy of the one provided to
# us. I changed the original code considerably.

# Example case: 2 network server statistics across several machines (latency
# and throughput of each machine). This code will help us find possibly faulty
# (or very fast) machines.

clear;
close all;
clc

fprintf ("Visualizing the example dataset for outlier detection...\n");

# Loads the dataset. The data is stored in the arrays X, Xval and yval.
load ("ex8data1.mat");

plot (X(:,1), X(:,2), "bx");
xlabel ("Latency (ms)");
ylabel ("Throughput (MB/s)");
axis ([0 30 0 30]);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# DATASET STATISTICS.

# We use a Gaussian distribution for each of the features.

# First, we evaluate the parameters of the Gaussian distribution. Next, we
# compute the probabilities for each of the points. Then we visualize the
# overall distribution and where each of the points falls.

fprintf ("\nVisualizing the Gaussian fit...\n");

# Computes the averages and variances (mu and sigma2).
[mu sigma2] = estimateGaussian (X);

# Computes the probability density function for each example in X (each row of
# X).
p = multivariateGaussian (X, mu, sigma2);

# Visualizing the Gaussian fit.
visualizeFit (X, mu, sigma2);
xlabel ("Latency (ms)");
ylabel ("Throughput (MB/s)");
axis ([0 30 0 30]);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nFinding a good threshold by using the cross validation set...\n");

# Computes the probability density function for each example in the cross
# validation set (each row of Xval).
pval = multivariateGaussian (Xval, mu, sigma2);

[epsilon F1] = selectThreshold (yval, pval);
fprintf ("\nBest epsilon found by cross validation: %.2e\n", epsilon);
fprintf ("You should see an epsilon close to 8.99e-05\n");
fprintf ("Best F1 score found by cross validation: %f\n", F1);
fprintf ("Expected F1 score: 0.875000\n");

# Finds the outliers in the training set and plots them. Red circles are drawn
# around the outliers.
outliers = find (p < epsilon);
hold on;
plot (X(outliers,1), X(outliers,2), "ro", "LineWidth", 2, "MarkerSize", 10);
hold off;

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# MULTIDIMENSIONAL OUTLIERS.

# Next, we apply our code to solve a harder problem. This problem involves more
# features. Only some features indicate whether an example is an outlier.

# Loads the second dataset. The data is stored in the arrays X, Xval and yval.
load ("ex8data2.mat");

# Computes the averages and variances (mu and sigma2).
[mu sigma2] = estimateGaussian (X);

# Computes the probability density function for each example in X (each row of
# X).
p = multivariateGaussian (X, mu, sigma2);

# Computes the probability density function for each example in the cross
# validation set (each row of Xval).
pval = multivariateGaussian (Xval, mu, sigma2);

[epsilon F1] = selectThreshold (yval, pval);
fprintf ("\nBest epsilon found by cross validation: %.2e\n", epsilon);
fprintf ("You should see an epsilon close to 1.38e-18\n");
fprintf ("Best F1 score found by cross validation: %f\n", F1);
fprintf ("Expected F1 score: 0.615385\n");

# Computes the number of outliers in the training set.
num_outliers = sum (p < epsilon);
fprintf ("Number of outliers found: %d\n", num_outliers);
