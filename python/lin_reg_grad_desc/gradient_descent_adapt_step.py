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
Module for computing LINEAR REGRESSION COEFFICIENTS.
These coefficients are obtained by using the GRADIENT DESCENT algorithm.
This version of the algorithm uses an ADAPTIVE STEP SIZE.
"""


import cfg
import file_operations as fo
import gradient_descent_function as gdf
import gradient_descent_n as gdn
from sys import argv, exit


def main():

    # READS from the command line the PARAMETERS OF THE ALGORITHM.
    try:
        # Initial value of the step size:
        gam = float(argv[1])
        # Desired precision:
        prec = float(argv[2])
        # Maximum number of iterations:
        max_iter = int(argv[3])
        # Number of independent variables of the cost function J:
        cfg.init_N()
    except IndexError:
        exit("You didn't specify all the parameters of the algorithm.")
    except ValueError:
        exit("It wasn't possible to assign all the specified values to the parameters of the algorithm.")

    # CHECKS that the specified VALUES ARE ACCEPTABLE.
    if gam <= 0:
        exit("The initial value of the step size has to be strictly positive.")
    elif prec <= 0:
        exit("The desired precision has to be strictly positive.")
    elif max_iter < 1:
        exit("The maximum number of iterations cannot be less than 1.")
    elif cfg.N < 2:
        exit("The number of independent variables of the cost function cannot be less than 2.")

    # READS from the command line the NAME OF THE INPUT DATA FILE.
    try:
        file_name = argv[5]
    except IndexError:
        exit("You have to inform the name of the input data file.")

    # READS THE DATA FILE whose name was specified.
    # If the file doesn't exist, finishes the execution of the code.
    X, y, header_lines = fo.read_data_file(file_name)
    if type(X) is int:
        exit("The data file " + file_name + " doesn't exist.")

    # Finds an APPROXIMATE RESULT for the VALUES THAT MINIMIZE THE COST FUNCTION.
    XTXm, XTym = gdf.load_aux_quan(X, y)
    theta, i = gdn.grad_desc_adapt_step(gam, prec, max_iter, XTXm, XTym)

    # WRITES to the output file ALL THE RESULTS.
    fo.write_output(theta, i, header_lines, file_name)


main()
