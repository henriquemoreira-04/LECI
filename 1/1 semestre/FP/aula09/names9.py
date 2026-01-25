import bisect
import sys


def loadNames(fname):
    """Read names from file and return list of 'lastname, firstname'."""
    ...


# MAXCHAR = The character with the largest possible unicode codepoint!
MAXCHAR = chr(sys.maxunicode)

# NOTE that ',' < 'A' < any letter < MAXCHAR


def findSurname(names, surname):
    """Find and display list of names containing given surname."""

    # Find the index before the first name with given surname
    idx1 = bisect.bisect_left(names, surname)  # YOU MUST FIX THIS!

    # Find the index after the last name with given surname
    idx2 = bisect.bisect_right(names, ...)  # COMPLETE THIS!
    
    # Show searched surname and limits found
    print(f"Searching {surname!r} --> [{idx1}:{idx2}]")

    # Show name BEFORE first name found
    print(f"names[{idx1-1}:{idx1}] = ", names[idx1-1:idx1])
    # Show list of names found
    print(f"names[{idx1}:{idx2}] = ", names[idx1:idx2])
    # Show name AFTER last name found
    print(f"names[{idx2}:{idx2+1}] = ", names[idx2:idx2+1])


def main():
    names = loadNames("names.txt")

    # Sort the names
    names.sort()
    #names.sort(key=len)

    # Show first names in list
    print(names[:4])

    # Test program to look for "SANTOS", "SA", "ESTRANHO"
    while True:
        surname = input("Surname? (ENTER to stop) ").upper()
        if surname == "": break
        findSurname(names, surname)

    return


if __name__ == "__main__":
    main()

