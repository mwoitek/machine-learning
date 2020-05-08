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
# These coefficients are obtained from the solution to the NORMAL EQUATION.

# PATH to the DATA DIRECTORY.
DATA_FOLDER="../test/data_sets/lin_1_var/"
NORMAL="normal_eq/"

IND_VARS=1
PY_SCRIPT="main.py"
rm -f "${DATA_FOLDER}${NORMAL}"*.dat
for file in "${DATA_FOLDER}"*.dat
do
    python3 "${PY_SCRIPT}" "${file}" "${IND_VARS}"
done
mv ./*.dat "${DATA_FOLDER}${NORMAL}".
