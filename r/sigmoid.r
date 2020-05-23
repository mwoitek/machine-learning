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
#  /$$$$$$$
# | $$__  $$
# | $$  \ $$
# | $$$$$$$/
# | $$__  $$
# | $$  \ $$
# | $$  | $$
# |__/  |__/
#
#
#
# Script for plotting a few graphs related to the sigmoid function.

# Function that computes the sigmoid function. I know there's a built-in
# function for performing this computation. I'm implementing my own function
# because I want to learn the basic R syntax.
sig_fun <- function(x) {

  temp <- 1 + exp(-x)
  return(temp ^ (-1))

}

# Function that computes the derivative of the sigmoid function.
der_sig_fun <- function(x) {

  return(sig_fun(x) * sig_fun(-x))

}

# Function that computes the second derivative of the sigmoid function.
sec_der_sig_fun <- function(x) {

  temp <- 1 - 2 * sig_fun(x)
  return(der_sig_fun(x) * temp)

}

# Function that plots the graph of the sigmoid function. The output is a PNG
# file.
plot_sig <- function() {

  # Opens the PNG file.
  png(file = "sigmoid.png", width = 1200, height = 800)
  par(mar = c(5.1, 6.1, 4.1, 2.1))

  # Creates the plot.
  x_lab <- "x"
  x_lim <- c(-10, 10)
  y_lab <- expression(sigma * "(x)")
  curve(sig_fun, xlab = x_lab, xlim = x_lim, ylab = y_lab, cex.axis = 1.5,
        cex.lab = 1.5)

  # Closes the PNG file.
  dev.off()

}

# Function that plots the graph of the derivative of the sigmoid function. The
# output is a PNG file.
plot_der_sig <- function() {

  # Opens the PNG file.
  png(file = "derivative_sigmoid.png", width = 1200, height = 800)
  par(mar = c(5.1, 6.1, 4.1, 2.1))

  # Creates the plot.
  x_lab <- "x"
  x_lim <- c(-10, 10)
  y_lab <- expression(frac(d * sigma * "(x)", dx))
  curve(der_sig_fun, xlab = x_lab, xlim = x_lim, ylab = y_lab, cex.axis = 1.5,
        cex.lab = 1.5)

  # Closes the PNG file.
  dev.off()

}

# Function that plots the graph of the second derivative of the sigmoid
# function. The output is a PNG file.
plot_sec_der_sig <- function() {

  # Opens the PNG file.
  png(file = "second_derivative_sigmoid.png", width = 1200, height = 800)
  par(mar = c(5.1, 6.1, 4.1, 2.1))

  # Creates the plot.
  x_lab <- "x"
  x_lim <- c(-10, 10)
  y_lab <- expression(frac(d ^ 2 * sigma * "(x)", d * x ^ 2))
  curve(sec_der_sig_fun, xlab = x_lab, xlim = x_lim, ylab = y_lab,
        cex.axis = 1.5, cex.lab = 1.5)

  # Closes the PNG file.
  dev.off()

}

plot_sig()
plot_der_sig()
plot_sec_der_sig()
