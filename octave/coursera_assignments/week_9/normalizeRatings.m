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
# Function for normalizing the movie ratings in the matrix Y. The i-th row of
# this matrix contains the ratings associated with the i-th movie. For every i,
# we subtract from the i-th row of Y the average rating related to the movie i.
# This gives us the normalized matrix Ynorm. The mean ratings are also returned
# through the column vector Ymean. Notice that, according to Ynorm, every movie
# has an average rating of 0. This file isn't just a copy of the one provided
# to us. I changed the original code considerably.
function [Ynorm Ymean] = normalizeRatings (Y, R)

  # Number of movies and number of users.
  [m n] = size (Y);

  # Initializes the arrays that this function returns.
  Ynorm = zeros (m, n);
  Ymean = zeros (m, 1);

  # Loop over the movies.
  for i = 1:m

    # Finds the users that rated the i-th movie.
    idx = find (R(i,:) == 1);

    # Computes the mean rating of the i-th movie.
    Ymean(i) = mean (Y(i,idx));

    # Normalizes the ratings of the i-th movie.
    Ynorm(i,idx) = Y(i,idx) - Ymean(i);

  endfor

endfunction
