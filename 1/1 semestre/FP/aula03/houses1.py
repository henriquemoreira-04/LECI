import turtle

def rect(t, x, y, width, height):
    assert not t.isdown(), "Pen should be up!"
    t.goto(x, y)
    t.down()
    t.goto(x+width, y)
    t.goto(x+width, y+height)
    t.goto(x, y+height)
    t.goto(x, y)
    t.up()

def triang(t, x, y, width, height):
    t.goto(x, y)
    t.down()
    t.begin_fill()
    t.goto(x+0.5*width, y+height)
    t.goto(x+width, y)
    t.end_fill()
    t.up()

def house(t, x, y, width, height):
    rect(t, x, y, width, height)
    triang(t, x, y+height, width, height/2)
    door_width = width / 4
    door_height = height / 2
    door_x = x + (width - door_width) / 2
    door_y = y
    rect(t, door_x, door_y, door_width, door_height)
    win_width = width / 4
    win_height = height / 4
    win_x = x + width / 5
    win_y = y + height / 2
    rect(t, win_x, win_y, win_width, win_height)

def main():
    print("This program opens a window with a graphical user interface.")
    print("Click buttons on the mouse to draw stuff.")

    screen = turtle.Screen()
    t = turtle.Turtle()
    t.speed(0)
    t.up()

    w = 40
    h = 30

    def doclick1(x, y):
        rect(t, x, y, w, h)

    screen.onclick(doclick1, 1)

    def doclick3(x, y):
        house(t, x, y, w, h)

    screen.onclick(doclick3, 3)

    screen.mainloop()
    print("The window was closed. Bye!")

main()
