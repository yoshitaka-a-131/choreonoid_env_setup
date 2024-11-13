#!/bin/bash
cd
sudo apt install -y python3-rosdep
mkdir -p ~/ros2_ws/src
cd ros2_ws
cd src
git clone https://github.com/choreonoid/choreonoid.git
git clone https://github.com/choreonoid/choreonoid_ros.git
git clone https://github.com/choreonoid/choreonoid_ros2_mobile_robot_tutorial.git
git clone https://github.com/wrs-frei-simulation/WRS-Pre-2024.git choreonoid/ext/WRS2024PRE
git clone https://github.com/k38-suzuki/hairo-world-plugin.git choreonoid/ext/hairo-world-plugin
git clone https://github.com/k38-suzuki/choreonoid_ros2_sample_drone_tutorial.git
cd choreonoid
misc/script/install-requisites-ubuntu-22.04.sh
cd ~/ros2_ws/src
ros2 pkg create WRS2024pre_ROS2
cd WRS2024pre_ROS2
mkdir launch
cp $HOME/choreonoid_env_setup/launch/WRS2024pre_preliminaries.launch.xml $HOME/ros2_ws/src/WRS2024pre_ROS2/launch/WRS2024pre_preliminaries.launch.xml
cp $HOME/choreonoid_env_setup/launch/WRS2024pre_finals.launch.xml $HOME/ros2_ws/src/WRS2024pre_ROS2/launch/WRS2024pre_finals.launch.xml
cd ~/ros2_ws/src/WRS2024pre_ROS2
sed -i '12a  <exec_depend>ros2launch</exec_depend>' package.xml
sed -i '10a # install launch files ' CMakeLists.txt
sed -i '11a install(' CMakeLists.txt 
sed -i '12a DIRECTORY launch' CMakeLists.txt 
sed -i '13a DESTINATION share/${PROJECT_NAME}/' CMakeLists.txt 
sed -i '14a )' CMakeLists.txt 
cd ~/ros2_ws
sudo rosdep init
rosdep update
rosdep install -y --from-paths ~/ros2_ws/src --ignore-src
colcon build --symlink-install --cmake-args -DBUILD_AGX_DYNAMICS_PLUGIN=ON -DBUILD_AGX_BODYEXTENSION_PLUGIN=ON -DBUILD_WRS2018=ON -DBUILD_SCENE_EFFECTS_PLUGIN=ON -DBUILD_HAIRO_WORLD_PLUGIN=ON -DENABLE_INSTALL_RPATH_USE_LINK_PATH=ON
echo "source $HOME/ros2_ws/install/setup.bash" >> ~/.bashrc
source ~/.bashrc
cp $HOME/choreonoid_env_setup/desktop/WRS2024pre_preliminaries.desktop $HOME/デスクトップ/WRS2024pre_preliminaries.desktop
cp $HOME/choreonoid_env_setup/desktop/WRS2024pre_finals.desktop $HOME/デスクトップ/WRS2024pre_finals.desktop
chmod 774 $HOME/choreonoid_env_setup/desktop/WRS2024pre_preliminaries.sh
chmod 774 $HOME/choreonoid_env_setup/desktop/WRS2024pre_finals.sh
gio set $HOME/デスクトップ/WRS2024pre_preliminaries.desktop metadata::trusted true
chmod 774 $HOME/デスクトップ/WRS2024pre_preliminaries.desktop
gio set $HOME/デスクトップ/WRS2024pre_finals.desktop metadata::trusted true
chmod 774 $HOME/デスクトップ/WRS2024pre_finals.desktop

