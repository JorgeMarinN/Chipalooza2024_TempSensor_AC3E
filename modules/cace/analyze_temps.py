import warnings

warnings.filterwarnings("ignore", category=DeprecationWarning)

import json

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

import logging

logging.basicConfig(
    filename="log_analyze_temps.log",
    filemode="w",
    format="%(asctime)s,%(msecs)d %(name)s %(levelname)s %(message)s",
    datefmt="%H:%M:%S",
    level=logging.DEBUG,
)

thres = 0.2


def func(filename: str):
    logger = logging.getLogger("func")
    
    df: pd.DataFrame = None

    with open(filename) as f:
        content = f.read()
        
        # logger.info(content) # Too much info
        
        df = pd.read_fwf(filename)
        logger.info(df)

    # df.plot()
    logger.info(f"Measure without filtering {df['v(out)'].mean()}")
    df.loc[df["v(out)"] >  thres, "v(out)"] = 1.8
    df.loc[df["v(out)"] <= thres, "v(out)"] = 0
    logger.info(f"Measure with filtering {df['v(out)'].mean()}")

    print(df['v(out)'].mean())


import sys

if __name__ == "__main__":
    logging.info("Running the program")
    logging.info(f"Argv: {sys.argv}")

    if len(sys.argv) < 1:
        raise ValueError("Usage: python analyze_temps.py <filename>")

    # I'm ignoring totally the output of cace, and using the .data file
    file = Path(sys.argv[1]).with_suffix(".data")

    if not file.exists():
        raise ValueError("filename doesn't exists")

    func(file)
