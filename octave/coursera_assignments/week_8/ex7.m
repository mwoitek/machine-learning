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
# Machine Learning Online Class - Exercise 7: Principle Component Analysis and
# K-Means Clustering. This file isn't just a copy of the one provided to us. I
# changed the original code considerably.

# pca.m
# projectData.m
# recoverData.m

clear;
close all;
clc

# K-MEANS CLUSTERING. We have divided the learning algorithm into two
# functions, findClosestCentroids and computeCentroids.

fprintf ("Finding the closest centroids...\n");

# Loads a 2D example dataset.
load ("ex7data2.mat");

# Number of centroids.
K = 3;

# Initial positions of the centroids. The position of the i-th centroid
# corresponds to the i-th row of the following matrix:
initial_centroids = [3 3; 6 2; 8 5];

# For consistency, here we set the initial centroids in a specific way.
# However, in practice, it's a good idea to generate them automatically.
# One possible approach is to set them to be random examples.

# Finds the closest centroids for the examples.
idx = findClosestCentroids (X, initial_centroids);

fprintf ("\nClosest centroids for the first 3 examples:\n");
fprintf ("%d\n", idx(1:3));
fprintf ("Closest centroids should be 1, 3 and 2, respectively\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nRecomputing the mean of every centroid...\n");

# Computes the means based on the closest centroids found above.
centroids = computeCentroids (X, idx, K);

fprintf (["\nCentroids computed after the initial finding of the " ...
          "closest centroids:\n"]);
fprintf ("[%.6f %.6f]\n", centroids');
fprintf ("Centroids should be\n");
fprintf ("[2.428301 3.157924]\n");
fprintf ("[5.813503 2.633656]\n");
fprintf ("[7.119387 3.616684]\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nRunning K-means clustering on the example dataset...\n");

# Total number of iterations.
max_iters = 10;

# Runs the K-means algorithm. The "true" at the end tells our function to plot
# the progress of the algorithm.
[centroids idx] = runkMeans (X, initial_centroids, max_iters, true);
fprintf ("\nK-means done.\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Using the K-means algorithm to compress an image. To do this, first
# we run this algorithm on the colors of the pixels in the image. Then
# we map each pixel onto its closest centroid.

fprintf ("\nRunning K-means clustering on pixels from an image...\n");

# Loads an image of a bird.
A = double (imread ("bird_small.png"));
# If imread doesn't work, try this instead:
# load ("bird_small.mat");

# Divides all values in A by 255 so that they are in the range from 0 to 1.
A /= 255;

# Size of the image.
img_size = size (A);

# Let N be the number of pixels. Next, we reshape the image into a N by 3
# matrix. Each row of this matrix contains the red, green and blue pixel
# values. This gives us our dataset matrix X that we will use the K-means
# algorithm on.
X = reshape (A, img_size(1) * img_size(2), 3);

# K-MEANS ALGORITHM.

# Try different values of K and max_iters:
K = 16;
max_iters = 10;

# Initializes the centroids randomly.
initial_centroids = kMeansInitCentroids (X, K);

# Runs the K-means algorithm.
[centroids idx] = runkMeans (X, initial_centroids, max_iters);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Next, we use the K-means clusters to compress an image. To do this, first we
# find the closest cluster for each example.

fprintf ("\nApplying the K-means algorithm to compress an image...\n");

# Finds the closest cluster for each example. Essentially, we represent the
# image X in terms of the indices in idx:
idx = findClosestCentroids (X, centroids);

# We can recover the image from idx by mapping each pixel (specified by its
# index in idx) to the centroid value.
X_recovered = centroids(idx,:);

# Reshapes the recovered image.
X_recovered = reshape (X_recovered, img_size(1), img_size(2), 3);

# Displays the original image.
subplot (1, 2, 1);
imagesc (A);
title ("Original image");

# Displays the compressed image (side by side).
subplot (1, 2, 2);
imagesc (X_recovered);
title (sprintf ("Compressed image (%d colors)", K));
