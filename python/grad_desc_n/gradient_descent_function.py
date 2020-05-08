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
Module with the code that is DEPENDENT on the function f.
The formulas involved in the implementation of this module can be found in the file './latex/formulae.pdf'.
"""


import cfg
import numpy as np
from random import uniform


def initial_x():
    """

    GENERATES the INITIAL VALUES of the independent variables of f.

    Returns:
      An array with the initial values of the independent variables of f.

    """

    # RANDOMLY GENERATES the INITIAL VALUES of the independent variables:
    temp = [uniform(1, cfg.n) for i in range(cfg.n)]

    return np.array(temp, dtype=np.float_)


def grad(x):
    """

    COMPUTES the GRADIENT of the function f.

    Argument:
      x: Array with the independent variables.

    Returns:
      An array with the gradient of the function f.

    """

    return x - np.arange(1, cfg.n + 1, dtype=np.float_)


def print_exact_res():
    """

    PRINTS the EXACT RESULT for the values that minimize the function f.

    """

    print("************************************************************")
    print("EXACT RESULT FOR THE VALUES THAT MINIMIZE THE FUNCTION:\n")
    f_str = "The value of x_{:d} is {:f}"
    for i in range(1, cfg.n + 1):
        print(f_str.format(i, float(i)))
    print("************************************************************\n")
