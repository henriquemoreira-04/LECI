# Documentation on random.randrange:
# https://docs.python.org/3/library/random.html#random.randrange
import random


def rand_list():
    """Return a list with 10 random ints between 1 and 20."""
    lst = []
    for i in range(10):
        num = random.randrange(1,21)
        lst.append(num)
    return lst


# ...


def main():
    lst = rand_list()
    print(lst)


if __name__ == "__main__":
    main()

