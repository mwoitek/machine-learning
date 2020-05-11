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
#   ____      __
#  / __ \____/ /____ __  _____
# / /_/ / __/ __/ _ `/ |/ / -_)
# \____/\__/\__/\_,_/|___/\__/
#
#
#
# Code for obtaining the possible answers to the 1st question of the quiz on
# linear regression with multiple variables.

clear;
close all;
clc

# Loads the features.
x_1 = [89 72 94 69];
x_2 = x_1 .^ 2;

# Computes the averages.
m_1 = mean (x_1);
m_2 = mean (x_2);

# Computes the amplitudes.
a_1 = max (x_1) - min (x_1);
a_2 = max (x_2) - min (x_2);

# Normalizes the features.
x_1_norm = (x_1 - m_1) / a_1;
x_2_norm = (x_2 - m_2) / a_2;

# Prints the normalized features.
printf ("Normalized values of x_1: [%.2f %.2f %.2f %.2f]\n", x_1_norm);
printf ("Normalized values of x_2: [%.2f %.2f %.2f %.2f]\n", x_2_norm);
