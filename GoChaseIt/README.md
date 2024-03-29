# RoboND Go Chase It!
Project 2 of Udacity Robotics Software Engineer Nanodegree Program
![Overview](GIF_GoChaseIt.gif)  

## Overview  
In this project I created two ROS packages inside `catkin_ws/src`: the `drive_bot` and the `ball_chaser` which were used in Gazebo for all upcoming projects in the [Udacity Robotics Software Engineer Nanodegree Program](https://www.udacity.com/course/robotics-software-engineer--nd209). These were the steps to design the robot, house it inside world, and program it to chase white-colored balls:  
1. `drive_bot`:  
* Create a `my_robot` ROS package to hold robot, the white ball, and the world.
* Design a differential drive robot with the Unified Robot Description Format. Add two sensors to robot: a lidar and a camera. Add Gazebo plugins for robot’s differential drive, lidar, and camera. The robot you design should be significantly different from the one presented in the project lesson. Implement significant changes such as adjusting the color, wheel radius, and chassis dimensions. Or completely redesign the robot model!
* House robot inside the world you built in the **Build My World** project.
* Add a white-colored ball to Gazebo world and save a new copy of this world.
* The `world.launch` file should launch world with the white-colored ball and robot.
2. `ball_chaser`:
* Create a `ball_chaser` ROS package to hold C++ nodes.
* Write a `drive_bot` C++ node that will provide a `ball_chaser/command_robot` service to drive the robot by controlling its linear x and angular z velocities. The service should publish to the wheel joints and return back the requested velocities.
* Write a `process_image` C++ node that reads robot’s camera image, analyzes it to determine the presence and position of a white ball. If a white ball exists in the image, node should request a service via a client to drive the robot towards it.
* The `ball_chaser.launch` should run both the `drive_bot` and the `process_image` nodes.  
## Prerequisites/Dependencies  
* Gazebo >= 7.0  
* ROS Kinetic  
* make >= 4.1(mac, linux), 3.81(Windows)
  * Linux: make is installed by default on most Linux distros
  * Mac: [install Xcode command line tools to get make](https://developer.apple.com/xcode/features/)
  * Windows: [Click here for installation instructions](http://gnuwin32.sourceforge.net/packages/make.htm)
* gcc/g++ >= 5.4
  * Linux: gcc / g++ is installed by default on most Linux distros
  * Mac: same deal as make - [install Xcode command line tools]((https://developer.apple.com/xcode/features/)
  * Windows: recommend using [MinGW](http://www.mingw.org/)
## Setup Instructions (abbreviated)  
1. Meet the `Prerequisites/Dependencies`  
2. Open Ubuntu Bash and clone the project repository  
3. On the command line execute  
```bash
sudo apt-get update && sudo apt-get upgrade -y
```
4. Build and run code.  
## Project Description  
Directory Structure  
```
.Go-Chase-It                                   # Go Chase It Project
├── catkin_ws                                  # Catkin workspace
│   ├── src
│   │   ├── ball_chaser                        # ball_chaser package        
│   │   │   ├── launch                         # launch folder for launch files
│   │   │   │   ├── ball_chaser.launch
│   │   │   ├── src                            # source folder for C++ scripts
│   │   │   │   ├── drive_bot.cpp
│   │   │   │   ├── process_images.cpp
│   │   │   ├── srv                            # service folder for ROS services
│   │   │   │   ├── DriveToTarget.srv
│   │   │   ├── CMakeLists.txt                 # compiler instructions
│   │   │   ├── package.xml                    # package info
│   │   ├── my_robot                           # my_robot package        
│   │   │   ├── launch                         # launch folder for launch files   
│   │   │   │   ├── robot_description.launch
│   │   │   │   ├── world.launch
│   │   │   ├── meshes                         # meshes folder for sensors
│   │   │   │   ├── hokuyo.dae
│   │   │   ├── urdf                           # urdf folder for xarco files
│   │   │   │   ├── my_robot.gazebo
│   │   │   │   ├── my_robot.xacro
│   │   │   ├── worlds                         # world folder for world files
│   │   │   │   ├── empty.world
│   │   │   │   ├── myoffice.world
│   │   │   ├── CMakeLists.txt                 # compiler instructions
│   │   │   ├── package.xml                    # package info
├── my_ball                                    # Model files 
│   ├── model.config
│   ├── model.sdf
├── GIF_GoChaseIt.gif    # Demo video
```

## Run the project  
* Clone this repository
* Open the repository and make  
```
cd /home/catkin_ws/
catkin_make
```
* Launch my_robot/my_gokart in Gazebo to load both the world and plugins  
```
roslaunch my_robot world.launch
```  
* Launch ball_chaser and process_image nodes  
```
cd /home/catkin_ws/
source devel/setup.bash
roslaunch ball_chaser ball_chaser.launch
```  
* Visualize  
```
cd /home/catkin_ws/
source devel/setup.bash
rosrun rqt_image_view rqt_image_view  
```  

## Tips  
1. It's recommended to update and upgrade your environment before running the code.  
```bash
sudo apt-get update && sudo apt-get upgrade -y
```
