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
# Function that finds the best threshold (epsilon) for selecting the outliers,
# and the largest F1 score. This function receives two m-dimensional column
# vectors yval and pval. Here m is the number of examples in the cross
# validation set. yval(i) is the label (anomalous or normal) of the i-th
# example. pval(i) is the probability density function for the i-th example.
function [bestEpsilon bestF1] = selectThreshold (yval, pval)

  warning ("off");

  # Initializes a few important variables.
  bestEpsilon = 0;
  bestF1 = 0;
  F1 = 0;
  max_pval = max (pval);
  min_pval = min (pval);
  stepsize = (max_pval - min_pval) / 1000;

  for epsilon = min_pval:stepsize:max_pval

    # Uses the current epsilon to label the examples in the cross validation
    # set.
    y = (pval < epsilon);

    # Finds the indexes of the positive and negative examples in yval.
    pos = find (yval == 1);
    neg = find (yval == 0);

    # Computes the total of positive and negative labels (anomalous or normal)
    # in y.
    tot_pos = sum (y == 1);
    tot_neg = sum (y == 0);

    # Computes the number of true positives.
    tp = sum (y(pos) == 1);

    # Computes the number of true negatives.
    tn = sum (y(neg) == 0);

    # Computes the number of false positives.
    fp = tot_pos - tp;

    # Computes the number of false negatives.
    fn = tot_neg - tn;

    # Precision and recall.
    prec = tp / (tp + fp);
    rec = tp / (tp + fn);

    # Computes the F1 score.
    F1 = (2 * prec * rec) / (prec + rec);

    # Compares the current F1 score to the current best F1 score. If the score
    # we just calculated is larger, then it becomes the new best score.
    # Moreover, the current epsilon becomes the new best epsilon.
    if (F1 > bestF1)
     bestF1 = F1;
     bestEpsilon = epsilon;
    endif

  endfor

endfunction
