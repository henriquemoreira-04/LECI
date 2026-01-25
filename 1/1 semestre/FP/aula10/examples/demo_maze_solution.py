# Demonstration of maze solution.
# FP 2025-2026
# AJST@ua.pt

import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np

# 10x10 Maze: 0 = open, 1 = wall
maze = [
    [0, 1, 1, 0, 0, 1, 0, 0, 0, 0],
    [0, 1, 0, 1, 0, 1, 0, 1, 1, 0],
    [0, 1, 0, 1, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 1, 0, 1, 0, 1, 0, 1],
    [1, 1, 0, 0, 0, 0, 0, 1, 0, 1],
    [0, 0, 1, 1, 1, 1, 0, 0, 0, 0],
    [0, 1, 1, 1, 0, 0, 0, 1, 1, 0],
    [0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
    [1, 1, 1, 1, 0, 1, 1, 1, 1, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
]

start = (0, 0)
goal = (9, 9)
rows, cols = len(maze), len(maze[0])
visited = [[False]*cols for _ in range(rows)]
path = []
frames = []

def snapshot():
    frame = np.zeros((rows, cols))
    for i in range(rows):
        for j in range(cols):
            if maze[i][j] == 1:
                frame[i][j] = -1  # wall
            elif visited[i][j]:
                frame[i][j] = 0.5  # visited
    for x, y in path:
        frame[x][y] = 1  # path
    frame[start[0]][start[1]] = 0.75  # start
    frame[goal[0]][goal[1]] = 0.9    # goal
    frames.append(frame.copy())

def find_path(x, y):
    if x < 0 or x >= rows or y < 0 or y >= cols:
        return False
    if maze[x][y] == 1 or visited[x][y]:
        return False
    visited[x][y] = True
    path.append((x, y))
    snapshot()

    if (x, y) == goal:
        return True

    if (find_path(x+1, y) or find_path(x-1, y) or
        find_path(x, y+1) or find_path(x, y-1)):
        return True

    path.pop()
    snapshot()
    return False

# Solve the maze
find_path(*start)

# Animate
fig, ax = plt.subplots(figsize=(6, 6))
img = ax.imshow(frames[0], cmap='viridis', vmin=-1, vmax=1)
ax.set_title("Recursive Maze Solver Animation")
ax.set_xticks([])
ax.set_yticks([])

def update(frame):
    img.set_data(frame)
    return [img]

ani = animation.FuncAnimation(fig, update, frames=frames,
                              interval=200, repeat=False)
plt.show()

