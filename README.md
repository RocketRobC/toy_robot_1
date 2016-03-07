# Toy Robot
This application simulates a toy robot moving within a predefined environment. The robot accepts commands from a file and is free to move around and will prevent it's self from leaving the environment's boundary.

### Environments
This application was developed with Ruby version 2.2.2 and tested with rspec version 3.4.3.

### Installation Instructions
To install the required Gems please run `bundle install`.

### Operation Instructions
To run this application from the command line you will need to run the driver.rb file and pass in a command file as an argument.

`$ ruby driver.rb commands.txt`

The contents of the commands file needs to follow the following format

```
PLACE X,Y,CARDINAL
MOVE
LEFT
REPORT
```
Where `PLACE` puts the robot in the environment at the location specified by `X,Y` and facing the direction of the `CARDINAL`.

`MOVE` will move the robot 1 unit in the direction it's facing.

`LEFT` or `RIGHT` will turn the robot to face a new direction.

`REPORT` prints the current location of the robot within the environment.

### Testing Instructions
To test the application please run the rspec command.

`$ rspec`


### Overview
#### Design
The main functionality of this application comprises of 3 components, the driver, the robot and the environment.

When conceiving the application design it was important that the robot be self contained so didn't rely on other components for it's core operation. This allows the robot to negotiate different environments each with their own set of parameters by simply changing or supplying a new environment module.

...tbc.
