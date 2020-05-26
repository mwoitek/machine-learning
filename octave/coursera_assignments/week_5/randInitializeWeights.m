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
# Function for randomly initializing the weights associated with a pair of
# consecutive layers. The first layer has L_in units, and the second layer has
# L_out units. These numbers don't take into account the bias units. The
# returned matrix W is L_out by L_in + 1. There's an extra column, since the
# first column of W stores the weights related to the bias unit of the first
# layer.
function W = randInitializeWeights (L_in, L_out)

  # Computes epsilon_init. This positive number defines the range of the random
  # values we'll assign to the weights.
  epsilon_init = sqrt (6 / (L_in + L_out));

  # Assigns random values to the weights. These values belong to the closed
  # interval [-epsilon_init, epsilon_init].
  W = 2 * epsilon_init * rand (L_out, L_in + 1) - epsilon_init;

endfunction
