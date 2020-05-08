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
Module for COMPUTING and PRINTING some important STATISTICAL QUANTITIES.
This code is useful only when there's a SINGLE INDEPENDENT VARIABLE.
"""


from math import sqrt
import numpy as np


def load_stat_quan(x, y):
    """

    COMPUTES some important STATISTICAL QUANTITIES for the data in the input file.

    Arguments:
      x: Array with the values of the INDEPENDENT variable.
      y: Array with the values of the DEPENDENT variable.

    Returns:
      A dictionary containing the statistical quantities.

    """

    m = x.size
    stat_quan = {}

    # Averages of x and y.
    stat_quan["av_x"] = np.average(x)
    stat_quan["av_y"] = np.average(y)

    # Variances of x and y.
    diff_x = x - stat_quan["av_x"]
    diff_y = y - stat_quan["av_y"]
    stat_quan["vr_x"] = np.inner(diff_x, diff_x) / m
    stat_quan["vr_y"] = np.inner(diff_y, diff_y) / m

    # Standard deviations of x and y.
    stat_quan["sd_x"] = sqrt(stat_quan["vr_x"])
    stat_quan["sd_y"] = sqrt(stat_quan["vr_y"])

    # Covariance.
    stat_quan["cov"] = np.inner(diff_x, diff_y) / m

    # Correlation coefficient between x and y.
    temp = stat_quan["sd_x"] * stat_quan["sd_y"]
    stat_quan["cc"] = stat_quan["cov"] / temp

    return stat_quan


def write_stat_quan(stat_quan, file_obj):
    """

    WRITES to the output file the results for some important STATISTICAL QUANTITIES
    related to the data in the input file.

    Arguments:
      stat_quan: Dictionary containing the statistical quantities.
      file_obj:  File object corresponding to the output file.

    """

    file_obj.write("STATISTICAL QUANTITIES RELATED TO THE DATA SET\n")

    s = "Average of x:".ljust(41) + "{:.5f}\n"
    file_obj.write(s.format(stat_quan["av_x"]))
    s = "Average of y:".ljust(41) + "{:.5f}\n"
    file_obj.write(s.format(stat_quan["av_y"]))

    s = "Variance of x:".ljust(41) + "{:.5f}\n"
    file_obj.write(s.format(stat_quan["vr_x"]))
    s = "Variance of y:".ljust(41) + "{:.5f}\n"
    file_obj.write(s.format(stat_quan["vr_y"]))

    s = "Standard deviation of x:".ljust(41) + "{:.5f}\n"
    file_obj.write(s.format(stat_quan["sd_x"]))
    s = "Standard deviation of y:".ljust(41) + "{:.5f}\n"
    file_obj.write(s.format(stat_quan["sd_y"]))

    s = "Covariance:".ljust(41) + "{:.5f}\n"
    file_obj.write(s.format(stat_quan["cov"]))

    s = "Correlation coefficient between x and y:".ljust(41) + "{:.5f}\n"
    file_obj.write(s.format(stat_quan["cc"]))
