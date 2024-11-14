#!/bin/bash
source /opt/Algoryx/AGX-2.38.0.0/setup_env.bash
export LD_LIBRARY_PATH=/opt/Algoryx/AGX-2.38.0.0/lib:
source /opt/ros/humble/setup.bash
source /home/ubuntu/ros2_ws/install/setup.bash
ros2 launch WRS2024pre_ROS2 WRS2024pre_finals.launch.xml
