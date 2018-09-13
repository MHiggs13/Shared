from argparse import ArgumentParser
import math

parser = ArgumentParser()

parser.add_argument("r")
parser.add_argument("g")
parser.add_argument("b")

args = parser.parse_args()

r = int(args.r)
g = int(args.g)
b = int(args.b)

v = (r*256 + g + b/256) - 32678

print("elevation: {0}".format(v))
