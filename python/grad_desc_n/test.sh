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
# This Bash script runs my Python implementation of the GRADIENT DESCENT ALGORITHM.

# PARAMETERS OF THE GRADIENT DESCENT ALGORITHM.
GAM=0.01
PREC=0.00001
MAX_ITER=10000

# RANGE OF THE NUMBER OF INDEPENDENT VARIABLES.
MIN_N=5
MAX_N=20

# GRADIENT DESCENT ALGORITHM WITH AN ADAPTIVE STEP SIZE.
PY_SCRIPT="gradient_descent_adapt_step.py"
OUT_FILE="adapt_step.txt"
echo "GRADIENT DESCENT ALGORITHM WITH AN ADAPTIVE STEP SIZE" > "${OUT_FILE}"
echo "" >> "${OUT_FILE}"
echo "INITIAL VALUE OF THE STEP SIZE: ${GAM}" >> "${OUT_FILE}"
echo "DESIRED PRECISION: ${PREC}" >> "${OUT_FILE}"
echo "MAXIMUM NUMBER OF ITERATIONS: ${MAX_ITER}" >> "${OUT_FILE}"
echo "" >> "${OUT_FILE}"
for ((i=MIN_N ; i<=MAX_N ; i++)); do
    echo "NUMBER OF INDEPENDENT VARIABLES: ${i}" >> "${OUT_FILE}"
    python3 "${PY_SCRIPT}" "${GAM}" "${PREC}" "${MAX_ITER}" "${i}" >> "${OUT_FILE}"
done
head -n -1 "${OUT_FILE}" > temp.txt
mv -f temp.txt "${OUT_FILE}"

# GRADIENT DESCENT ALGORITHM WITH A CONSTANT STEP SIZE.
PY_SCRIPT="gradient_descent_const_step.py"
OUT_FILE="const_step.txt"
echo "GRADIENT DESCENT ALGORITHM WITH A CONSTANT STEP SIZE" > "${OUT_FILE}"
echo "" >> "${OUT_FILE}"
echo "STEP SIZE: ${GAM}" >> "${OUT_FILE}"
echo "DESIRED PRECISION: ${PREC}" >> "${OUT_FILE}"
echo "MAXIMUM NUMBER OF ITERATIONS: ${MAX_ITER}" >> "${OUT_FILE}"
echo "" >> "${OUT_FILE}"
for ((i=MIN_N ; i<=MAX_N ; i++)); do
    echo "NUMBER OF INDEPENDENT VARIABLES: ${i}" >> "${OUT_FILE}"
    python3 "${PY_SCRIPT}" "${GAM}" "${PREC}" "${MAX_ITER}" "${i}" >> "${OUT_FILE}"
done
head -n -1 "${OUT_FILE}" > temp.txt
mv -f temp.txt "${OUT_FILE}"
