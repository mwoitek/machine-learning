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
This module contains the functions for COMPUTING LINEAR REGRESSION COEFFICIENTS
by using the solution to the NORMAL EQUATION.
"""


import numpy as np


def lin_reg_1_var_normal_eq(stat_quan):
    """

    Computes the LINEAR REGRESSION COEFFICIENTS by using the solution to the NORMAL EQUATION.
    This code is useful only when there's a SINGLE INDEPENDENT VARIABLE.

    Argument:
      stat_quan: Dictionary with some important STATISTICAL QUANTITIES
                 related to the data in the input file.

    Returns:
      An array with the linear regression coefficients.

    """

    slope = stat_quan["cov"] / stat_quan["vr_x"]
    inter = stat_quan["av_y"] - slope * stat_quan["av_x"]

    return np.array([inter, slope], dtype=np.float_)


def lin_reg_normal_eq(X, y):
    """

    Computes the LINEAR REGRESSION COEFFICIENTS by using the solution to the NORMAL EQUATION.

    Arguments:
      X: Array corresponding to the DESIGN MATRIX.
      y: Array with the values of the model's DEPENDENT VARIABLE.

    Returns:
      An array with the linear regression coefficients.

    """

    XT = np.transpose(X)
    XTy = np.matmul(XT, y)
    XTX = np.matmul(XT, X)
    inv_XTX = np.linalg.inv(XTX)

    return np.matmul(inv_XTX, XTy)
