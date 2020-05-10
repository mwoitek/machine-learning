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
# Function used in the regularization exercise. This function maps the two
# input features to higher-degree features. The inputs X1 and X2 must have the
# same size.
function out = mapFeature (X1, X2)

  degree = 6;

  out = ones (size (X1(:,1)));
  for i = 1:degree
    for j = 0:i
      out(:,(end + 1)) = (X1 .^ (i - j)) .* (X2 .^ j);
    endfor
  endfor

endfunction
