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
Module for performing the FILE OPERATIONS involved in the data analysis.
"""


import cfg
import mod_stat_quan as msq
import numpy as np


def extract_header(ext_list, header_char, file_obj):
    """

    EXTRACTS information from the HEADER of the input data file.

    Arguments:
      ext_list:    List with the numbers of the header lines that are to be extracted.
      header_char: Character that identifies a header line.
      file_obj:    File object corresponding to the input data file.

    Returns:
      (1) The number of header lines in the data file.
      (2) A list with the header lines that were extracted.
      They don't contain the character that identifies a header line.

    """

    header_end = False
    header_lines = []
    num_lines = 0

    # Reads the file until it finds a line not starting with header_char.
    while header_end is False:
        line = file_obj.readline()
        if line[0] == header_char:
            num_lines += 1
            if num_lines in ext_list:
                header_lines.append(line[2:])
        else:
            header_end = True

    return num_lines, header_lines


def read_data_file(file_name):
    """

    READS from a data file the DESIGN MATRIX and the values of the model's DEPENDENT VARIABLE.

    Argument:
      file_name: Name of the data file.

    Returns:
      If the file named file_name doesn't exist, returns 3 0's.
      If the file exists, returns the following:
        (1) an array corresponding to the design matrix X;
        (2) an array with the values of the model's dependent variable;
        (3) a list with strings extracted from the header of the file.

    """

    try:
        file_obj = open(file_name, "r")
    except FileNotFoundError:
        return 0, 0, 0

    # Determines the number of header lines, and extracts some of them.
    num_lines, header_lines = extract_header(cfg.EXT_LIST, "#", file_obj)
    file_obj.close()

    # LOADS the array with the values of the MODEL'S DEPENDENT VARIABLE.
    # The values of the dependent variable are in the last column of the file.
    y = np.loadtxt(file_name, dtype=np.float_, skiprows=num_lines, usecols=cfg.N)

    # LOADS the array corresponding to the DESIGN MATRIX X.
    cols = tuple(i for i in range(cfg.N))
    X = np.loadtxt(file_name, dtype=np.float_, skiprows=num_lines, usecols=cols)
    temp = np.ones(y.size, dtype=np.float_)
    stack_fun = np.column_stack if cfg.N == 1 else np.hstack
    X = stack_fun((temp, X))

    return X, y, header_lines


def str_theta(theta):
    """

    Takes the array with the LINEAR REGRESSION COEFFICIENTS, and converts them into STRINGS.

    Argument:
      theta: Array with the coefficients.

    Returns:
      A list with the coefficients as strings.

    """

    def gen_str(x):
        f_str = "{:.5f}"
        if x < 0:
            return "- " + f_str.format(abs(x))
        else:
            return "+ " + f_str.format(x)

    return [gen_str(x) for x in theta]


def write_theta(theta, file_obj):
    """

    WRITES to the output file the LINEAR REGRESSION COEFFICIENTS.

    Arguments:
      theta:    Array with the linear regression coefficients.
      file_obj: File object corresponding to the output file.

    """

    # Number of linear regression coefficients.
    num_coeff = cfg.N + 1

    # Writes the linear regression coefficients.
    f_str = "theta_{:d}:".ljust(44) + "{:s}\n"
    stheta = str_theta(theta)
    for i in range(num_coeff):
        file_obj.write(f_str.format(i, stheta[i]))

    # Writes the expression for the linear function.
    f_str = " {:s} * x_{:d}"
    s = "EXPRESSION FOR THE LINEAR FUNCTION:".ljust(41)
    s += "h(x) = " + stheta[0]
    for i in range(1, num_coeff):
        s += f_str.format(stheta[i], i)
    file_obj.write(s + "\n")


def write_header_lines(header_lines, file_obj):
    """

    WRITES to the output file the information that was extracted
    from the HEADER of the input data file.

    Arguments:
      header_lines: List with strings that were extracted from the header of the input data file.
      file_obj:     File object corresponding to the output file.

    """

    file_obj.write("LINEAR FUNCTION THAT SHOULD DESCRIBE THE DATA SET\n")
    file_obj.writelines(header_lines)


def write_output(theta, theta_alt, header_lines, stat_quan, file_name):
    """

    WRITES to the output file ALL THE RESULTS.

    Arguments:
      theta:        Array with the linear regression coefficients.
      theta_alt:    Array with the linear regression coefficients (computed by using an ALTERNATIVE METHOD).
      header_lines: List with strings that were extracted from the header of the input data file.
      stat_quan:    Dictionary with some important statistical quantities related to the data in the input file.
      file_name:    Name of the input data file.

    """

    # Creates the name of the output file.
    temp = file_name.split("/")[-1]
    out_name = "lin_reg_" + temp

    with open(out_name, "w") as out_file:

        # Writes the header of the output file.
        s = " AND STATISTICAL ANALYSIS" if cfg.N == 1 else ""
        out_file.write("LINEAR REGRESSION" + s + "\n")
        out_file.write("Name of the input data file: " + temp + "\n\n")
        out_file.write("LINEAR REGRESSION COEFFICIENTS\n")
        out_file.write("Method used to compute the coefficients: NORMAL EQUATION\n\n")

        # Writes the linear regression coefficients.
        if cfg.N == 1:
            out_file.write("FIRST APPROACH\n")
        write_theta(theta, out_file)
        out_file.write("\n")

        # Writes the linear regression coefficients computed by using an ALTERNATIVE METHOD.
        # This computation is performed only when there's a SINGLE INDEPENDENT VARIABLE.
        if type(theta_alt) is not int:
            out_file.write("SECOND APPROACH\n")
            write_theta(theta_alt, out_file)
            out_file.write("\n")

        # Writes the lines extracted from the header of the input data file.
        write_header_lines(header_lines, out_file)
        out_file.write("\n")

        # Writes some important statistical quantities related to the data in the input file.
        # This is done only when there's a SINGLE INDEPENDENT VARIABLE.
        if type(stat_quan) is not int:
            msq.write_stat_quan(stat_quan, out_file)
