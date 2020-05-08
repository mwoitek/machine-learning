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
Module with the code that is NOT DEPENDENT on the cost function J.
"""


import gradient_descent_function as gdf
import numpy as np


def adapt_gam(diff_theta, current_grad, next_grad):
    """

    COMPUTES the values of the STEP SIZE.

    Arguments:
      diff_theta:   Array corresponding to the difference next_theta - current_theta.
      current_grad: Array corresponding to the gradient of J after i iterations.
      next_grad:    Array corresponding to the gradient of J after i + 1 iterations.

    Returns:
      A float corresponding to the new value of the step size.

    """

    diff_grad = next_grad - current_grad
    num = abs(np.inner(diff_theta, diff_grad))
    den = np.inner(diff_grad, diff_grad)

    return num / den


def grad_desc_adapt_step(gam, prec, max_iter, XTXm, XTym):
    """

    GRADIENT DESCENT ALGORITHM WITH AN ADAPTIVE STEP SIZE.

    Arguments:
      gam:      Initial value of the step size.
      prec:     Desired precision.
      max_iter: Maximum number of iterations.
      XTXm:     Array corresponding to the matrix (X^T * X) / m.
      XTym:     Array corresponding to the vector (X^T * y) / m.

    Returns:
      An array with an approximate result for the values that minimize the cost function J,
      and the number of iterations we had to perform to obtain this result.

    """

    # ASSIGNS the INITIAL VALUES to the independent variables of J:
    current_theta = gdf.initial_theta()

    # COMPUTES the GRADIENT of J for the initial values of the independent variables:
    current_grad = gdf.grad(current_theta, XTXm, XTym)

    # NUMBER OF ITERATIONS we performed:
    i = 0

    # ACTUAL IMPLEMENTATION OF THE ALGORITHM:
    while i < max_iter:

        # Performs an iteration:
        next_theta = current_theta - gam * current_grad
        i += 1

        # CHECKS if after the last iteration we have the DESIRED PRECISION:
        diff_theta = next_theta - current_theta
        cond = np.absolute(diff_theta) <= prec
        if np.all(cond):
            break
        else:
            next_grad = gdf.grad(next_theta, XTXm, XTym)
            # UPDATES the value of the STEP SIZE:
            gam = adapt_gam(diff_theta, current_grad, next_grad)
            current_theta = next_theta
            current_grad = next_grad

    return next_theta, i


def grad_desc_const_step(gam, prec, max_iter, XTXm, XTym):
    """

    GRADIENT DESCENT ALGORITHM WITH A CONSTANT STEP SIZE.

    Arguments:
      gam:      Step size.
      prec:     Desired precision.
      max_iter: Maximum number of iterations.
      XTXm:     Array corresponding to the matrix (X^T * X) / m.
      XTym:     Array corresponding to the vector (X^T * y) / m.

    Returns:
      An array with an approximate result for the values that minimize the cost function J,
      and the number of iterations we had to perform to obtain this result.

    """

    # ASSIGNS the INITIAL VALUES to the independent variables of J:
    current_theta = gdf.initial_theta()

    # NUMBER OF ITERATIONS we performed:
    i = 0

    # ACTUAL IMPLEMENTATION OF THE ALGORITHM:
    while i < max_iter:

        # Performs an iteration:
        next_theta = current_theta - gam * gdf.grad(current_theta, XTXm, XTym)
        i += 1

        # CHECKS if after the last iteration we have the DESIRED PRECISION:
        cond = np.absolute(next_theta - current_theta) <= prec
        if np.all(cond):
            break
        else:
            current_theta = next_theta

    return next_theta, i
