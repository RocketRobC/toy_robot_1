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

When designing the application it was important that the robot be self sufficient and not have reliance on other components for it's actions. This allows the robot to negotiate different environments each with their own set of parameters by simply changing or supplying a new environment module.

The robot is started by the driver which takes the received commands file and passes it to the read_commands method in the robot. From here the robot  reads the commands looking for the first valid PLACE command to set the initial position. A valid place command must be within the boundaries defined by the environment.

Once the robot has been placed, subsequent MOVE, LEFT, RIGHT and REPORT commands will be processed. The robot will check each move to confirm that it stays within the environment ignoring any commands that would take it out of bounds.

The REPORT command will print the current location and direction of the robot.
