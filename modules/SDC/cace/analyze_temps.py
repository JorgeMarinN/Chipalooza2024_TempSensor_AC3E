import warnings

warnings.filterwarnings("ignore", category=DeprecationWarning)

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

thres = 0.2


def func(filename: str):
    df = pd.read_fwf(filename)

    print(f"Measure without filtering {df['dout'].mean()}")

    df.loc[df["dout"] > thres, "dout"] = 1.8
    df.loc[df["dout"] <= thres, "dout"] = 0

    print(f"Measure with filtering {df['dout'].mean()}")


import sys

print(sys.argv)

if len(sys.argv) < 1:
    raise ValueError("Usage: python analyze_temps.py <filename>")

func(sys.argv[1])
