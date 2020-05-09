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
# Commands for performing the following tasks:
# 1 - Reading data from a file;
# 2 - Writing data to a file;
# 3 - Plotting data.
echo on

# READING DATA FROM A FILE.

# Changing the current working directory:
cd data_files/

# Loading data files with a single column:
load ("data_file_4.dat")
load ("data_file_5.dat")

# Checking that the loaded data is in the current scope:
whos "data_file_4"
whos "data_file_5"

# Loading data files with multiple columns:
load ("data_file_1.dat")
load ("data_file_2.dat")
load ("data_file_3.dat")

# Checking that the loaded data is in the current scope:
whos "data_file_1"
whos "data_file_2"
whos "data_file_3"

# WRITING DATA TO A FILE.

# Extracting the first 20 components of the vector data_file_4:
v1 = data_file_4(1:20)

# Extracting components 30 to 50 of the vector data_file_5:
v2 = data_file_5(30:50)

# Writing the content of the vector v1 to a file:
save ("-ascii", "vector_v1.dat", "v1")

# Writing the content of the vector v2 to a file:
save ("-ascii", "vector_v2.dat", "v2")

# PLOTTING DATA.

# Separating the columns of the matrix data_file_1:
c1 = data_file_1(:,1)
c2 = data_file_1(:,2)
c3 = data_file_1(:,3)

clear data_file_*
clear v*

# Plotting the data using red diamonds:
plot (c1, c2, "dr")

# Setting the labels of the axes:
xlabel ("x Axis")
ylabel ("y Axis")

# Setting the title of the plot:
title ("My Plot")

# Saving the plot as a PNG file:
cd ../image_files/
print ("my_plot_1", "-dpng")

# Saving the plot as a SVG file:
print ("my_plot_1", "-dsvg")

echo off
