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

clear;
close all;
clc

# PRINCIPLE COMPONENT ANALYSIS.

fprintf ("Visualizing the example dataset for PCA...\n");
load ("ex7data1.mat"); # Loads the dataset into the matrix X.
figure;
hold on;
plot (X(:,1), X(:,2), "bo");
hold off;
axis ([0.5 6.5 2 8]);
axis square;

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nRunning PCA on the example dataset...\n");

# Before running PCA, normalizes the features.
[X_norm mu sigma] = featureNormalize (X);

# Runs PCA.
[U S] = pca (X_norm);

# Draws the eigenvectors centered at the mean of the data. These lines show the
# directions of maximum variation in the dataset.
hold on;
drawLine (mu, mu + 1.5 * S(1,1) * U(:,1)', "-k", "LineWidth", 2);
drawLine (mu, mu + 1.5 * S(2,2) * U(:,2)', "-k", "LineWidth", 2);
hold off;

fprintf ("\nTop eigenvector:\n");
fprintf ("U(:,1) = [%.6f; %.6f]\n", U(1,1), U(2,1));
fprintf ("Expected result: [-0.707107; -0.707107]\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# DIMENSIONAL REDUCTION WITH PCA.

# Next, we implement the projection step to map the data onto the first K
# eigenvectors of the covariance matrix of X. Then we plot the data in this
# reduced space. This shows us what the data looks like when we use only the
# selected eigenvectors to reconstruct it.

fprintf ("\nDimensional reduction on the example dataset...\n");

# Projects the normalized data onto a K-dimensional reduced space.
K = 1;
Z = projectData (X_norm, U, K);
fprintf ("\nProjection of the first example: %.6f\n", Z(1));
fprintf ("Expected projection: 1.481274\n");

# Recovers an approximation of the original data from the projected examples in
# the matrix Z.
X_rec = recoverData (Z, U, K);
fprintf ("\nApproximation of the first example: [%.6f %.6f]\n", ...
         X_rec(1,1), X_rec(1,2));
fprintf ("Expected approximation: [-1.047419 -1.047419]\n");

# Plots the normalized dataset.
figure;
hold on;
plot (X_norm(:,1), X_norm(:,2), "bo");
hold off;
axis ([-4 3 -4 3]);
axis square;

# Draws lines connecting the approximate points to the original points.
hold on;
plot (X_rec(:,1), X_rec(:,2), "ro");
for i = 1:rows (X_norm)
  drawLine (X_norm(i,:), X_rec(i,:), "--k", "LineWidth", 1);
endfor
hold off;

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# FACE DATA.

fprintf ("\nLoading and visualizing the face dataset...\n");
load ("ex7faces.mat");
# Displays the first 100 faces in the dataset.
figure;
displayData (X(1:100,:));

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# PCA on the face data: Eigenfaces.

# Runs PCA and displays the eigenvectors (eigenfaces, in this case). We display
# the first 36 eigenfaces.

fprintf ("\nRunning PCA on the face dataset...\n");

# Before running PCA, normalizes the features.
[X_norm mu sigma] = featureNormalize (X);

# Runs PCA.
[U S] = pca (X_norm);

# Displays the top 36 eigenfaces found.
figure;
displayData (U(:,1:36)');

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nDimensional reduction for the face dataset...\n");

# Dimension of the reduced space.
K = 100;

# Projects the face data onto the reduced space.
Z = projectData (X_norm, U, K);
fprintf ("\nThe projected data matrix Z is %d by %d\n", size (Z));

# Recovers an approximation of the original data from the projected examples in
# the matrix Z.
X_rec = recoverData (Z, U, K);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Next, we display the projected face data. The original data is also
# displayed.

fprintf ("\nVisualizing the faces after PCA dimensional reduction...\n");

# Displays the normalized data.
figure;
subplot (1, 2, 1);
displayData (X_norm(1:100,:));
axis square;
title ("Original faces");

# Displays the reconstructed data.
subplot (1, 2, 2);
displayData (X_rec(1:100,:));
axis square;
title ("Recovered faces");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# OPTIONAL EXERCISES.

fprintf ("\nPCA for visualization of high-dimensional data...\n");

# In the last K-means exercise, we used this algorithm on 3D data
# (pixel colors of an image). Next, we visualize this data in 3D, and
# then we apply PCA to obtain a visualization in 2D.

# Loads the image from the previous K-means exercise.
A = double (imread ("bird_small.png"));
# If imread doesn't work, try this instead:
# load ("bird_small.mat");

# Divides all values in A by 255 so that they are in the range from 0 to 1.
A /= 255;

# Size of the image.
img_size = size (A);

# Reshapes the image into a N by 3 matrix, where N is the number of pixels.
X = reshape (A, img_size(1) * img_size(2), 3);

K = 16;
max_iters = 10;

# Initializes the centroids randomly.
initial_centroids = kMeansInitCentroids (X, K);

# Runs the K-means algorithm.
[centroids idx] = runkMeans (X, initial_centroids, max_iters);

# Samples 1000 random indexes (since working with all the data is expensive).
sel = floor (rand (1000, 1) * rows (X)) + 1;

# Color palette.
palette = hsv (K); # The hsv function creates a colormap.
colors = palette(idx(sel),:);

fprintf ("\nDisplaying the data and the centroid memberships in 3D...\n");
figure;
hold on;
scatter3 (X(sel,1), X(sel,2), X(sel,3), 10, colors);
hold off;
title ("Pixel dataset in 3D (colors show centroid memberships)");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# Uses PCA to display the data in 2D.

# Before running PCA, normalizes the features.
[X_norm mu sigma] = featureNormalize (X);

# Projects the data to 2D.
[U S] = pca (X_norm);
Z = projectData (X_norm, U, 2);

fprintf ("\nPlotting the data in 2D...\n");
figure;
hold on;
plotDataPoints (Z(sel,:), idx(sel), K);
hold off;
title ("Pixel dataset in 2D (used PCA for dimensional reduction)");
