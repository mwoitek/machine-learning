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

clear;
close all;
clc

fprintf ("Loading the movie ratings dataset...\n");

# Loads the 1682x943 matrices Y and R. The matrix Y contains ratings
# (1-5) of 1682 movies by 943 users. Moreover, the matrix R is so that
# R(i,j) = 1 if the user j rated the movie i.
load ("ex8_movies.mat");

# By using the matrices Y and R, we can compute statistical quantities
# like the average rating of a movie.
avg_rat = mean (Y(1,R(1,:)));
fprintf ("\nAverage rating of movie 1 (Toy Story): %f / 5\n", avg_rat);

# To visualize the ratings matrix, we can plot it with imagesc.
imagesc (Y);
xlabel ("Users");
ylabel ("Movies");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# COST FUNCTION FOR COLLABORATIVE FILTERING.

# To debug the cost function code, loads pre-trained parameters. These
# parameters are stored in the matrices Theta and X.
fprintf ("\nLoading pre-trained parameters...\n");
load ("ex8_movieParams.mat");

# Reduces the size of the dataset. This makes our test run faster.
num_features = 3;
num_movies = 5;
num_users = 4;
R = R(1:num_movies,1:num_users);
Theta = Theta(1:num_users,1:num_features);
X = X(1:num_movies,1:num_features);
Y = Y(1:num_movies,1:num_users);
params = [X(:); Theta(:)];

fprintf ("\nComputing the cost function without regularization...\n");
J = cofiCostFunc (params, Y, R, num_users, num_movies, num_features, 0);

fprintf ("\nCost at loaded parameters: %.2f\n", J);
fprintf ("Expected cost: 22.22\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nChecking the gradient without regularization...\n");

# Checks the gradient by running checkCostFunction.
checkCostFunction;

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nComputing the cost function with regularization...\n");
J = cofiCostFunc (params, Y, R, num_users, num_movies, num_features, 1.5);

fprintf ("\nCost at loaded parameters (lambda = 1.5): %.2f\n", J);
fprintf ("Expected cost: 31.34\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nChecking the gradient with regularization...\n");

# Checks the gradient by running checkCostFunction.
checkCostFunction (1.5);

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# RATINGS BY A NEW USER.

# This part of the code allows you to put in your own ratings for the
# movies in the dataset. To see the ID of each movie, check the file
# movie_ids.txt.

# Reads the movie list in movie_ids.txt.
movieList = loadMovieList ();

# Initializes my ratings matrix.
my_ratings = zeros (1682, 1);

# Example: To give a rating of 4 to Toy Story (ID 1), we set
my_ratings(1) = 4;

# More ratings.
my_ratings(7) = 3;
my_ratings(12) = 5;
my_ratings(54) = 4;
my_ratings(64) = 5;
my_ratings(66) = 3;
my_ratings(69) = 5;
my_ratings(98) = 2;
my_ratings(183) = 4;
my_ratings(226) = 5;
my_ratings(355) = 5;

fprintf ("\nRatings by the new user:\n");
for i = 1:length (my_ratings)
  if (my_ratings(i) != 0)
    fprintf ("\nMovie: %s\n", movieList{i});
    fprintf ("Rating: %d\n", my_ratings(i));
  endif
endfor

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

fprintf ("\nTraining collaborative filtering...\n");

# Loads the 1682x943 matrices Y and R. The matrix Y contains ratings
# (1-5) of 1682 movies by 943 users. Moreover, the matrix R is so that
# R(i,j) = 1 if the user j rated the movie i.
load ("ex8_movies.mat");

# Adds the information about my ratings to the matrices Y and R.
Y = [my_ratings Y];
R = [(my_ratings != 0) R];

# Normalizes the ratings.
[Ynorm Ymean] = normalizeRatings (Y, R);

num_features = 10;
num_movies = rows (Y);
num_users = columns (Y);

# Randomly initializes the parameters in X and Theta.
X = randn (num_movies, num_features);
Theta = randn (num_users, num_features);
initial_parameters = [X(:); Theta(:)];

# Sets the options for fmincg.
options = optimset ("GradObj", "on", "MaxIter", 100);

# Creates an alias for the function cofiCostFunc.
lambda = 10;
costFunc = @(t) cofiCostFunc (t, Ynorm, R, num_users, num_movies, num_features, ...
                              lambda);

# Runs fmincg to obtain the optimal parameters.
theta = fmincg (costFunc, initial_parameters, options);

# The "unrolled" vector theta contains all the parameters in the matrices Theta
# and X. Next, we reconstruct these matrices from theta.
elem_X = num_movies * num_features;
X = reshape (theta(1:elem_X), num_movies, num_features);
Theta = reshape (theta((elem_X + 1):end), num_users, num_features);

fprintf ("\nRecommender system learning completed.\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n");
pause;

# After training the model, we can make recommendations by computing the
# predictions matrix.
p = X * Theta';
my_predictions = p(:,1) + Ymean;

[r ix] = sort (my_predictions, "descend");
fprintf ("\nTop 10 recommendations for you:\n\n");
for i = 1:10
  j = ix(i);
  fprintf ("Predicting rating %.1f for movie %s\n", my_predictions(j), ...
           movieList{j});
endfor

fprintf ("\nOriginal ratings provided:\n");
for i = 1:length (my_ratings)
  if (my_ratings(i) != 0)
    fprintf ("\nMovie: %s\n", movieList{i});
    fprintf ("Rating: %d\n", my_ratings(i));
  endif
endfor
