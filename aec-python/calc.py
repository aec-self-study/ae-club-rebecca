# calc.py
import argparse

parser = argparse.ArgumentParser(description="CLI Calculator")

subparsers = parser.add_subparsers(help="sub-command help", dest="command")

add = subparsers.add_parser("add", help="add integers")
add.add_argument("ints_to_sum", nargs="*", type=int)

sub = subparsers.add_parser("sub", help="subtract integers")
sub.add_argument("ints_to_sub", nargs=2, type=int)

mult = subparsers.add_parser("mult", help="multiply integers")
mult.add_argument("ints_to_mult", nargs=2, type=int)

div = subparsers.add_parser("div", help="divide integers")
div.add_argument("ints_to_div", nargs=2, type=int)


def aec_subtract(ints_to_sub):
    our_sub = ints_to_sub[0] - ints_to_sub[1]
    if our_sub < 0:
        our_sub = 0
    print(f"the difference is {our_sub}")
    return our_sub


def aec_divide(ints_to_div):
    if ints_to_div[1] == 0:
        print(f"The denominator is 0")
        our_division = 0
    else:
        our_division = ints_to_div[0] / ints_to_div[1]
        print(f"the quotient result is : {our_division}")

    return our_division


if __name__ == "__main__":
    args = parser.parse_args()

    if args.command == "add":
        our_sum = sum(args.ints_to_sum)
        print(f"the sum of values is {our_sum}")

    if args.command == "sub":
        aec_subtract(args.ints_to_sub)
    if args.command == "mult":
        our_prod = args.ints_to_mult[0] * args.ints_to_mult[1]
        print(f"the product is {our_prod}")
    if args.command == "div":
        aec_divide(args.ints_to_div)
