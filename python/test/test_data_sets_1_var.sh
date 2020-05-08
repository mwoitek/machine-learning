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
# This Bash script runs my Python code to PRODUCE SEVERAL DATA SETS.
# They can be used to TEST LINEAR REGRESSION ALGORITHMS.

DATA_FOLDER="./data_sets/lin_1_var/"
PY_SCRIPT="test_data_sets_1_var.py"
rm -f "${DATA_FOLDER}"*.dat
python3 "${PY_SCRIPT}" 0 1
python3 "${PY_SCRIPT}" 1 1
python3 "${PY_SCRIPT}" 2 1
python3 "${PY_SCRIPT}" 3 1
python3 "${PY_SCRIPT}" 4 1
python3 "${PY_SCRIPT}" 5 1
python3 "${PY_SCRIPT}" 6 1
python3 "${PY_SCRIPT}" 0 1.5
python3 "${PY_SCRIPT}" 1 1.5
python3 "${PY_SCRIPT}" 2 1.5
python3 "${PY_SCRIPT}" 3 1.5
python3 "${PY_SCRIPT}" 4 1.5
python3 "${PY_SCRIPT}" 5 1.5
python3 "${PY_SCRIPT}" 6 1.5
python3 "${PY_SCRIPT}" 0 -2
python3 "${PY_SCRIPT}" 1 -2
python3 "${PY_SCRIPT}" 2 -2
python3 "${PY_SCRIPT}" 3 -2
python3 "${PY_SCRIPT}" 4 -2
python3 "${PY_SCRIPT}" 5 -2
python3 "${PY_SCRIPT}" 6 -2
python3 "${PY_SCRIPT}" 0 -2.5
python3 "${PY_SCRIPT}" 1 -2.5
python3 "${PY_SCRIPT}" 2 -2.5
python3 "${PY_SCRIPT}" 3 -2.5
python3 "${PY_SCRIPT}" 4 -2.5
python3 "${PY_SCRIPT}" 5 -2.5
python3 "${PY_SCRIPT}" 6 -2.5
python3 "${PY_SCRIPT}" -1 1
python3 "${PY_SCRIPT}" -2 1
python3 "${PY_SCRIPT}" -3 1
python3 "${PY_SCRIPT}" -4 1
python3 "${PY_SCRIPT}" -5 1
python3 "${PY_SCRIPT}" -6 1
python3 "${PY_SCRIPT}" -1 1.5
python3 "${PY_SCRIPT}" -2 1.5
python3 "${PY_SCRIPT}" -3 1.5
python3 "${PY_SCRIPT}" -4 1.5
python3 "${PY_SCRIPT}" -5 1.5
python3 "${PY_SCRIPT}" -6 1.5
python3 "${PY_SCRIPT}" -1 -2
python3 "${PY_SCRIPT}" -2 -2
python3 "${PY_SCRIPT}" -3 -2
python3 "${PY_SCRIPT}" -4 -2
python3 "${PY_SCRIPT}" -5 -2
python3 "${PY_SCRIPT}" -6 -2
python3 "${PY_SCRIPT}" -1 -2.5
python3 "${PY_SCRIPT}" -2 -2.5
python3 "${PY_SCRIPT}" -3 -2.5
python3 "${PY_SCRIPT}" -4 -2.5
python3 "${PY_SCRIPT}" -5 -2.5
python3 "${PY_SCRIPT}" -6 -2.5
mv ./*.dat "${DATA_FOLDER}".
