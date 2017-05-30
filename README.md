# MonkeyBusiness
## Marcus Ng, Ishtiaque Mahdi, and Xing Tao Shi
# ShootyTD
The goal of the game is to survive as many waves of enemies as possible while staying alive and protecting your nexus. You can use WASD, or the arrow keys, to move and the mouse to shoot bullets. Enemies drop gold on death and vary in damage. A shop is displayed at the bottom of the screen where you are able to buy new weapons, towers, or traps with gold. As the game progresses, stronger enemies spawn forcing you to buy better weapons and structures. You lose when your health or the nexus' health reaches 0.

## How It Works
The player spawns next to the nexus and enemies are added to an ArrayList of enemy queues, specific to each wave. Enemies are spawned on the map when they are dequeued from their queue. When an enemy comes into a certain vicinity of a tower or nexus, it targets the closer structure instead of the player. Towers and traps are placed by the player on a grid map. Towers cannot be stacked on top of one another. However, the user is able to place multiple traps onto the same position because traps are stored in a unique stack based on the position. If an enemy steps on a position with a stack of traps, the top-most trap will be popped out of the stack. The game is over when the user or nexus' health reaches 0 health. The user's highscore is added to a CSV to save highscores.

## Launch Instructions

Download & install [Processing 3.3.x](https://processing.org/download/)


Clone this repo
```
$ git clone git@github.com:imahdi2000/ShootyTD.git
```

Go into the folder GameManager
```
$ cd ShootyTD/GameManager
```

Run the program
```
$ processing GameManager.pde
```

Click the play button in the top-left corner
