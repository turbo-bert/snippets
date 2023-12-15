import argparse

parser = argparse.ArgumentParser(description="description without newlines")
parser.add_argument("pos1", metavar="POS_1", type=str, help="Help for POS_1, type=str")
parser.add_argument("pos2", metavar="POS_2", type=int, help="Help for POS_2, type=int")
parser.add_argument("pos3", metavar="POS_3", type=float, help="Help for POS_3, type=float")
parser.add_argument("--bla1", nargs=1, type=str, metavar="BLA_1_STR", help="Help for BLA_1_STR")
parser.add_argument("--bla2", nargs=1, type=int, metavar="BLA_2_INT", help="Help for BLA_2_INT")
parser.add_argument("--bla3", nargs=1, type=float, metavar="BLA_3_FLOAT", help="Help for BLA_3_FLOAT")
parser.add_argument("--bla4", action="store_true", help="Help for BLA_4")


args = parser.parse_args()

from pprint import pprint as PP

PP(args)
