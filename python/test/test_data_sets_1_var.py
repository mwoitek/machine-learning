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
This script creates data sets that I will use to test my linear regression code.
Here I'm considering only linear functions f with a single independent variable x.
This script produces data files with two columns.
The first column contains the values of x,
and the second column contains the corresponding values of y = f(x).
"""


import numpy as np
from sys import argv, exit


# A few constants:
NOISE_MAX = 0.05
NOISE_MIN = -NOISE_MAX
NOISE_VALS = 100
NUM_XS = 1001
X_MAX = 10
X_MIN = 0


def read_coeff():
    """

    READS from the command line the COEFFICIENTS OF THE LINEAR FUNCTION.

    """

    if len(argv) != 3:
        # Indicates a problem, because I'm expecting exactly two arguments.
        return 1
    else:
        try:
            return np.array([float(x) for x in argv[1:]], dtype=np.float_)
        except ValueError:
            # Indicates a problem, because I'm expecting the arguments to be floats.
            return 2


def produce_data(coeff):
    """

    Takes an array with coefficients, and
    PRODUCES DATA that is well described by the corresponding LINEAR FUNCTION.

    """

    global NOISE_MAX
    global NOISE_MIN
    global NOISE_VALS
    global NUM_XS
    global X_MAX
    global X_MIN

    # Set of values that will be assigned to the independent variable of the linear function.
    # Since I'm not trying to be general, I will just use NUM_XS evenly spaced values
    # in the closed interval from X_MIN to X_MAX.
    xs = np.linspace(X_MIN, X_MAX, NUM_XS, dtype=np.float_)

    # Computes the values of y corresponding to the values of x stored in the above array.
    # coeff[0] = y-intercept
    # coeff[1] = slope
    ys_exact = coeff[0] + coeff[1] * xs

    # I want data that the linear function describes well, but not perfectly.
    # Then I will add some noise to the above array.
    temp = np.linspace(NOISE_MIN, NOISE_MAX, NOISE_VALS, dtype=np.float_)
    noise = np.random.choice(temp, NUM_XS)
    ys_noisy = ys_exact + noise

    return xs, ys_noisy


def str_coeff(coeff):
    """

    Takes the array with the LINEAR REGRESSION COEFFICIENTS, and converts them into STRINGS.

    Argument:
      coeff: Array with the coefficients.

    Returns:
      A list with the coefficients as strings.

    """

    def gen_str(x):
        f_str = "{:.5f}"
        if x < 0:
            return "- " + f_str.format(abs(x))
        else:
            return "+ " + f_str.format(x)

    return [gen_str(x) for x in coeff]


def write_data(coeff, xs, ys):
    """

    WRITES THE DATA to a file.

    """

    global NUM_XS

    # CREATES THE NAME OF THE OUTPUT FILE from the values of the coefficients.
    file_name = "c0_" + str(coeff[0]) + "_c1_" + str(coeff[1]) + ".dat"

    with open(file_name, "w") as out_file:

        # WRITES the HEADER of the output file.
        out_file.write("# LINEAR FUNCTION WITH ONE INDEPENDENT VARIABLE\n")
        out_file.write("# DATA SET FOR TESTING\n#\n")
        out_file.write("# COEFFICIENTS OF THE LINEAR FUNCTION\n")
        f_str = "# theta_{:d}:".ljust(46) + "{:s}\n"
        scoeff = str_coeff(coeff)
        out_file.write(f_str.format(0, scoeff[0]))
        out_file.write(f_str.format(1, scoeff[1]) + "#\n")
        s = "# EXPRESSION FOR THE LINEAR FUNCTION:".ljust(43)
        s += "h(x) = " + scoeff[0] + " " + scoeff[1] + " * x_1\n#\n"
        out_file.write(s)
        out_file.write("# NUMBER OF POINTS IN THIS FILE\n")
        out_file.write("# " + str(NUM_XS) + "\n")

        # WRITES the VALUES OF X in the first column, and the VALUES OF Y in the second column.
        f_str = "{:>15.10f} {:>15.10f}\n"
        for i in range(NUM_XS):
            out_file.write(f_str.format(xs[i], ys[i]))


def main():

    # READS from the command line the COEFFICIENTS OF THE LINEAR FUNCTION.
    coeff = read_coeff()
    if type(coeff) is int:
        if coeff == 1:
            exit("You have to pass exactly two arguments!")
        else:
            exit("It isn't possible to convert all the arguments into floats!")
    elif coeff[1] == 0:
        exit("Choose a non-zero value for the slope!")

    # GENERATES TWO ARRAYS. The first one stores the VALUES OF X,
    # and the second one contains the corresponding VALUES OF Y (with some NOISE).
    xs, ys = produce_data(coeff)

    # WRITES THE DATA stored in the above arrays to the output file.
    write_data(coeff, xs, ys)


main()
