# Exercise 5 on "How to think like a computer scientist", ch. 11.

import turtle

def main():
    screen = turtle.Screen()
    t = turtle.Turtle()

    # Use t.up(), t.down() and t.goto(x, y)

    # Put your code here
    t.up()
    t.goto(-100,0)
    t.down()
    t.goto(0,100)
    t.goto(100,0)
    t.goto(0,-100)
    t.goto(-100,0)
    t.up()  

    # Wait until window is closed
    screen.mainloop()


if __name__ == "__main__":
    main()

