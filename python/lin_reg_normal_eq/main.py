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

import cfg
import file_operations as fo
import mod_stat_quan as msq
import normal_equation as ne
import numpy as np
from sys import argv, exit


def main():

    # READS from the command line the NAME OF THE INPUT DATA FILE.
    try:
        file_name = argv[1]
    except IndexError:
        exit("You have to inform the name of the input data file.")

    # READS from the command line the NUMBER OF THE MODEL'S INDEPENDENT VARIABLES.
    try:
        cfg.init_N()
    except IndexError:
        exit("You didn't specify the number of independent variables.")
    except ValueError:
        exit("The specified number of independent variables can't be converted into an integer.")

    # CHECKS if the specified number of independent variables is ACCEPTABLE.
    if cfg.N < 1:
        exit("The number of independent variables can't be less than 1.")

    # READS THE DATA FILE whose name was specified.
    # If the file doesn't exist, finishes the execution of the code.
    X, y, header_lines = fo.read_data_file(file_name)
    if type(X) is int:
        exit("The data file " + file_name + " doesn't exist.")

    # Calculates the LINEAR REGRESSION COEFFICIENTS.
    theta = ne.lin_reg_normal_eq(X, y)

    # If there's a SINGLE INDEPENDENT VARIABLE,
    # computes some important STATISTICAL QUANTITIES related to the data in the input file.
    # Then calculates the LINEAR REGRESSION COEFFICIENTS by using an ALTERNATIVE METHOD.
    if cfg.N == 1:
        x = np.hsplit(X, 2)[1].flatten()
        stat_quan = msq.load_stat_quan(x, y)
        theta_alt = ne.lin_reg_1_var_normal_eq(stat_quan)
    else:
        stat_quan = 0
        theta_alt = 0

    # WRITES to the output file ALL THE RESULTS.
    fo.write_output(theta, theta_alt, header_lines, stat_quan, file_name)


main()
