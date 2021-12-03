#!/usr/bin/env python3
import copy

# DFS maze solver
def walk(maze, v, h, path, goal):
    # add tile to the walked path
    path.append([v, h])
    # block current tile from being revisited
    maze[v][h] = 1

    # calculate offset
    for o in [[1,0],[0,1],[-1,0],[0,-1]]:
        _v = v+o[0]
        _h = h+o[1]

        # skip if index is out of bounds
        if _v < 0 or _h < 0 or _v >= len(maze) or _h >= len(maze[0]):
            continue

        # found goal
        if maze[_v][_h] == goal:
            path.append([_v, _h])
            return path

        # found valid tile; keep walking
        if maze[_v][_h] != 1:
            r = walk(maze, _v, _h, path.copy(), goal)
            # if we found the goal, pass it on to the parent caller
            if r is not None:
                return r

def main():
    maze = [[1, 0, 0, 2],
            [1, 0, 4, 1],
            [3, 0, 0, 0]]

    # find entrance
    for i, row in enumerate(maze):
        for j, cell in enumerate(row):
            if cell == 3:
                # find treasure
                path = walk(copy.deepcopy(maze), i, j, [], 4)
    
                # find exit, starting from the treasure
                k = path.pop()
                path.extend(walk(copy.deepcopy(maze), k[0], k[1], [], 2))
                break

    print(path)
    
    # path visualizer, just for fun :-)
    for i, j in path:
        print()
        for _i, row in enumerate(maze):
            for _j, cell in enumerate(row):
                if _i == i and _j == j:
                    print('@', end=' ')
                else:
                    print(cell, end=' ')
            print()

if __name__ == "__main__":
    main()
