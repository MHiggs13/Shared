from argparse import ArgumentParser
import math

parser = ArgumentParser()

parser.add_argument("elev")

args = parser.parse_args()

v = float(args.elev)

v += 32678

r = int(math.floor(v/256))
g = int(math.floor(v%256))
b = int(math.floor((v-math.floor(v))*256))

print("r: {0}, g: {1}, b: {2}".format(r,g,b))
print("rgb({0}, {1}, {2})".format(r,g,b))
