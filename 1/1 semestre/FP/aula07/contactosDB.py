import os
import sys
import shelve

# Check out the `shelve` documentation at:
# https://docs.python.org/3/library/shelve.html#module-shelve

# Import the code from contactos.py
import contactos


def main(argv):
    """Start the program."""

    # User must provide the name of a database file as an argument.
    # If not, show a usage message.
    if len(argv) != 2:
        print(f"Usage: python3 {argv[0]} DBFILE.db", file=sys.stderr)
        exit(1)
    
    # the first argument is the database file name
    dbfile = argv[1]

    # open (or create) the database for contact information
    with shelve.open(dbfile) as contactDB:
    
        # If data base is empty, fill in some initial contacts
        if len(contactDB) == 0:
            # The list of contacts (it's actually a dictionary!):
            contactDB = {
                "234370200": "Universidade de Aveiro",
                "234370355": "DETI/UA",
                "234370356": "DFis/UA",
                "800242424": "SNS Saúde 24",
                }
        
        # Enter loop to interact with the user
        contactos.mainloop(contactDB)

    return


# O programa começa aqui
if __name__ == "__main__":
    main(sys.argv)

