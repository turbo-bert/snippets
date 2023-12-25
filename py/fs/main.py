import os.path
import sys
import logging

if os.path.isdir("bla"):
    logging.error("Directory exists")
    sys.exit(1)

if os.path.isfile("bla"):
    logging.error("File exists")
    sys.exit(1)

os.makedirs(dcx_out, exist_ok=True)
