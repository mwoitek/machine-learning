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
# Function that reads the movie list in movie_ids.txt. This function returns a
# cell array containing the movie names in the file. This file isn't just a
# copy of the one provided to us. I changed the original code considerably.
function movieList = loadMovieList ()

  # Opens the file.
  fid = fopen ("movie_ids.txt");

  # Number of movies.
  n = 1682;

  # All the movie names will be stored in the cell array movieList.
  movieList = cell (n, 1);

  # Loop for loading movieList.
  for i = 1:n

    # Reads a line of the file.
    line = fgets (fid);

    # Reads the movie name in the line. The movie ID is ignored.
    [dummy movieName] = strtok (line, " ");

    # Adds the movie name to the cell array.
    movieList{i} = strtrim (movieName);

  endfor

  # Closes the file.
  fclose (fid);

endfunction
