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
# Function for initializing the weights associated with a pair of consecutive
# layers. To do so, we use a fixed strategy. This will help us to debug our
# code. The first layer has L_in units, and the second layer has L_out units.
# These numbers don't take into account the bias units. The returned matrix W
# is L_out by L_in + 1. There's an extra column, since the first column of W
# stores the weights related to the bias unit of the first layer. This file
# isn't just a copy of the one provided to us. I changed the original code
# considerably.
function W = debugInitializeWeights (L_in, L_out)

  # A few helper variables related to W.
  rows_W = L_out;
  cols_W = L_in + 1;
  elem_W = rows_W * cols_W;

  # Initializes the matrix W with the aid of the sine function. This ensures
  # that W always contains the same values. This is useful for debugging.
  W = sin (1:elem_W);
  W = reshape (W, [rows_W cols_W]) / 10;

endfunction
