#!/bin/bash
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
# ,-----.                 ,--.
# |  |) /_  ,--,--. ,---. |  ,---.
# |  .-.  \' ,-.  |(  .-' |  .-.  |
# |  '--' /\ '-'  |.-'  `)|  | |  |
# `------'  `--`--'`----' `--' `--'
#
#
#
# This Bash script runs my Python code to compute LINEAR REGRESSION COEFFICIENTS.
# These coefficients are obtained by using the GRADIENT DESCENT algorithm.

# PATH to the DATA DIRECTORY.
DATA_FOLDER="../test/data_sets/lin_1_var/"
GRAD="grad_desc/"
ADAPT="adapt_step/"
CONST="const_step/"

# PARAMETERS of the GRADIENT DESCENT algorithm.
GAM=0.01
PREC=0.00001
MAX_ITER=10000
IND_VARS=2

# GRADIENT DESCENT algorithm with an ADAPTIVE STEP SIZE.
PY_SCRIPT="gradient_descent_adapt_step.py"
rm -f "${DATA_FOLDER}${GRAD}${ADAPT}"*.dat
for file in "${DATA_FOLDER}"*.dat
do
    python3 "${PY_SCRIPT}" "${GAM}" "${PREC}" "${MAX_ITER}" "${IND_VARS}" "${file}"
done
mv ./*.dat "${DATA_FOLDER}${GRAD}${ADAPT}".

# GRADIENT DESCENT algorithm with a CONSTANT STEP SIZE.
PY_SCRIPT="gradient_descent_const_step.py"
rm -f "${DATA_FOLDER}${GRAD}${CONST}"*.dat
for file in "${DATA_FOLDER}"*.dat
do
    python3 "${PY_SCRIPT}" "${GAM}" "${PREC}" "${MAX_ITER}" "${IND_VARS}" "${file}"
done
mv ./*.dat "${DATA_FOLDER}${GRAD}${CONST}".
