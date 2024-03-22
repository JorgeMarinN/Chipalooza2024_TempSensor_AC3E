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

    with open(filename) as f:
        json_content = logger.info(json.loads(f.read()))

    # logger.info(json_content)
    df: pd.DataFrame = None

    with open(filename) as f:
        df = pd.read_json(f.read())
        # df = pd.read_json(json_content)

    logger.info(df)

    # df.plot()

    return

    logger.info(f"Measure without filtering {df['dout'].mean()}")

    df.loc[df["dout"] > thres, "dout"] = 1.8
    df.loc[df["dout"] <= thres, "dout"] = 0

    logger.info(f"Measure with filtering {df['dout'].mean()}")


import sys

logging.info("Running the program")
logging.info(f"Argv: {sys.argv}")

if len(sys.argv) < 1:
    raise ValueError("Usage: python analyze_temps.py <filename>")

file = Path(sys.argv[1])

if not file.exists():
    raise ValueError("filename doesn't exists")


func(file)
