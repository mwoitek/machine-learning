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
# Machine Learning Online Class - Exercise 3: Neural networks.
# This file isn't just a copy of the one provided to us. I changed the original
# code considerably.

clear;
close all;
clc

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

fprintf ("\nLoading saved neural network parameters...\n");
# Loads the weights into the matrices Theta1 and Theta2. Theta1 has size 25x401
# and Theta2 has size 10x26.
load ("ex3weights.mat");

# Uses the neural network to predict the labels of the training set. It also
# computes and displays the training accuracy.
p = predict (Theta1, Theta2, X);
train_acc = 100 * mean (double (p == y));
fprintf ("\nTraining accuracy: %.1f %%\n", train_acc);
fprintf ("Expected accuracy: 97.5 %%\n");

fprintf ("\nProgram paused. Press ENTER to continue.\n\n");
pause;

# To give us an idea of the network's output, we can run through the examples
# one at a time to see what the network is predicting.

# Randomly permutes the examples.
rp = randperm (m);

for i = 1:m

  fprintf ("Displaying example image %d\n", i);
  temp = X(rp(i),:);
  displayData (temp);

  p = predict (Theta1, Theta2, temp);
  fprintf ("Neural network prediction: %d (digit %d)\n", p, mod (p, 10));

  # Pauses and gives the option to quit.
  s = input ("\nProgram paused. Press ENTER to continue or q to quit.\n", "s");
  if s == "q"
    break;
  endif

endfor
