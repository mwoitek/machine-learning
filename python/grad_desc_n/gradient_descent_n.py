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
Module with the code that is NOT DEPENDENT on the function f.
The formulas involved in the implementation of this module can be found in the file './latex/formulae.pdf'.
"""


import cfg
import gradient_descent_function as gdf
import numpy as np


def adapt_gam(diff_x, current_grad, next_grad):
    """

    COMPUTES the values of the STEP SIZE.

    Arguments:
      diff_x:       Array corresponding to the difference next_x - current_x.
      current_grad: Array corresponding to the gradient of f after i iterations.
      next_grad:    Array corresponding to the gradient of f after i + 1 iterations.

    Returns:
      A float corresponding to the new value of the step size.

    """

    diff_grad = next_grad - current_grad
    num = abs(np.inner(diff_x, diff_grad))
    den = np.inner(diff_grad, diff_grad)

    return num / den


def grad_desc_adapt_step(gam, prec, max_iter):
    """

    GRADIENT DESCENT ALGORITHM WITH AN ADAPTIVE STEP SIZE.

    Arguments:
      gam:      Initial value of the step size.
      prec:     Desired precision.
      max_iter: Maximum number of iterations.

    Returns:
      An array with an approximate result for the values that minimize the function f,
      and the number of iterations we had to perform to obtain this result.

    """

    # ASSIGNS the INITIAL VALUES to the independent variables of the function f:
    current_x = gdf.initial_x()

    # COMPUTES the GRADIENT of the function f for the initial values of the independent variables:
    current_grad = gdf.grad(current_x)

    # NUMBER OF ITERATIONS we performed:
    i = 0

    # ACTUAL IMPLEMENTATION OF THE ALGORITHM:
    while i < max_iter:

        # Performs an iteration:
        next_x = current_x - gam * current_grad
        i += 1

        # CHECKS if after the last iteration we have the DESIRED PRECISION:
        diff_x = next_x - current_x
        cond = np.absolute(diff_x) <= prec
        if np.all(cond):
            break
        else:
            next_grad = gdf.grad(next_x)
            # UPDATES the value of the STEP SIZE:
            gam = adapt_gam(diff_x, current_grad, next_grad)
            current_x = next_x
            current_grad = next_grad

    return next_x, i


def grad_desc_const_step(gam, prec, max_iter):
    """

    GRADIENT DESCENT ALGORITHM WITH A CONSTANT STEP SIZE.

    Arguments:
      gam:      Step size.
      prec:     Desired precision.
      max_iter: Maximum number of iterations.

    Returns:
      An array with an approximate result for the values that minimize the function f,
      and the number of iterations we had to perform to obtain this result.

    """

    # ASSIGNS the INITIAL VALUES to the independent variables of the function f:
    current_x = gdf.initial_x()

    # NUMBER OF ITERATIONS we performed:
    i = 0

    # ACTUAL IMPLEMENTATION OF THE ALGORITHM:
    while i < max_iter:

        # Performs an iteration:
        next_x = current_x - gam * gdf.grad(current_x)
        i += 1

        # CHECKS if after the last iteration we have the DESIRED PRECISION:
        cond = np.absolute(next_x - current_x) <= prec
        if np.all(cond):
            break
        else:
            current_x = next_x

    return next_x, i


def print_approx_res(x, i):
    """

    PRINTS THE RESULTS obtained by using the gradient descent algorithm.

    Arguments:
      x: Array with an approximate result for the values that minimize the function f.
      i: Number of iterations we had to perform to obtain this result.

    """

    print("\n************************************************************")
    print("APPROXIMATE RESULT FOR THE VALUES THAT MINIMIZE THE FUNCTION:\n")
    f_str = "The value of x_{:d} is {:f}"
    for j in range(cfg.n):
        print(f_str.format(j + 1, x[j]))
    f_str = "\nTo obtain these results, we had to iterate {:d} times"
    print(f_str.format(i))
    print("************************************************************\n")
