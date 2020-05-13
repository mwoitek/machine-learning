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
# Function that displays in a grid the 2D data stored in X. If requested, this
# function returns the figure handle h and the displayed array. This file isn't
# just a copy of the one provided to us. I changed the original code
# considerably.
function [h display_array] = displayData (X, ex_width)

  # Sets ex_width automatically if not passed in.
  if ~(exist ("ex_width", "var")) || isempty (ex_width)
    ex_width = round (sqrt (columns (X)));
  endif

  # Gray image.
  colormap (gray);

  # Computes the number of rows and columns.
  [m n] = size(X);
  ex_height = n / ex_width;

  # Computes the number of items to display.
  display_rows = floor (sqrt (m));
  display_cols = ceil (m / display_rows);

  # Padding between images.
  pad = 1;

  # Sets up blank display.
  display_array = - ones (pad + display_rows * (ex_height + pad), ...
                          pad + display_cols * (ex_width + pad));

  # Copies each example into a patch on the display array.
  curr_ex = 1;
  for j = 1:display_rows
    for i = 1:display_cols
      if curr_ex > m
        break;
      endif
      # Copies the patch.
      max_val = max (abs (X(curr_ex,:))); # Gets the maximum value of the patch.
      display_array(pad + (j - 1) * (ex_height + pad) + (1:ex_height), ...
                    pad + (i - 1) * (ex_width + pad) + (1:ex_width)) = ...
        reshape (X(curr_ex,:), ex_height, ex_width) / max_val;
      curr_ex += 1;
    endfor
    if curr_ex > m
      break;
    endif
  endfor

  # Displays the image.
  h = imagesc (display_array, [-1 1]);

  # Hides the axes.
  axis image off

  drawnow;

endfunction
