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
#   ____        _   _
#  |  _ \ _   _| |_| |__   ___  _ __
#  | |_) | | | | __| '_ \ / _ \| '_ \
#  |  __/| |_| | |_| | | | (_) | | | |
#  |_|    \__, |\__|_| |_|\___/|_| |_|
#         |___/
#
#
#

"""
Implementation of the GRADIENT DESCENT algorithm. This version of the algorithm uses an ADAPTIVE STEP SIZE.
"""


import cfg
import gradient_descent_function as gdf
import gradient_descent_n as gdn
from sys import argv, exit


def main():

    # READS FROM THE COMMAND LINE THE PARAMETERS OF THE ALGORITHM.
    try:
        # Initial value of the step size:
        gam = float(argv[1])
        # Desired precision:
        prec = float(argv[2])
        # Maximum number of iterations:
        max_iter = int(argv[3])
        # Number of independent variables of the function f:
        cfg.init_n()
    except IndexError:
        exit("You didn't specify all the parameters of the algorithm.")
    except ValueError:
        exit("It wasn't possible to assign all the specified values to the parameters of the algorithm.")

    # CHECKS THAT THE SPECIFIED VALUES ARE ACCEPTABLE.
    if gam <= 0:
        exit("The initial value of the step size has to be strictly positive.")
    elif prec <= 0:
        exit("The desired precision has to be strictly positive.")
    elif max_iter < 1:
        exit("The maximum number of iterations cannot be less than 1.")
    elif cfg.n < 1:
        exit("The number of independent variables of the function cannot be less than 1.")

    # FINDS AN APPROXIMATE RESULT FOR THE VALUES THAT MINIMIZE THE FUNCTION, AND PRINTS THEM.
    x, i = gdn.grad_desc_adapt_step(gam, prec, max_iter)
    gdn.print_approx_res(x, i)

    # FOR COMPARISON, PRINTS THE EXACT RESULT FOR THE VALUES THAT MINIMIZE THE FUNCTION.
    gdf.print_exact_res()


main()
