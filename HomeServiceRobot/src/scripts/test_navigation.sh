 
#!/bin/sh

# test_navigation.sh shell
# turtlebot_world.launch: to deploy a turtlebot in your environment
# amcl_demo.launch: to localize the turtlebot
# view_navigation.launch: observe the map in rviz


path_catkin_ws="/home/workspace/catkin_ws"

# Open the workspace, source and launch turtlebot_world.launch
xterm -e "cd ${path_catkin_ws} && source devel/setup.bash && roslaunch turtlebot_gazebo turtlebot_world.launch" &
sleep 5
# Open the workspace, source and launch amcl_demo.launch
xterm -e "cd ${path_catkin_ws} && source devel/setup.bash && roslaunch turtlebot_gazebo amcl_demo.launch" &
sleep 5
# Open the workspace, source and launch view_navigation.launch
xterm -e "cd ${path_catkin_ws} && source devel/setup.bash && roslaunch turtlebot_rviz_launchers view_navigation.launch"