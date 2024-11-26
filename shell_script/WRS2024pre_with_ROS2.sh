#!/bin/bash
cd
source /opt/Algoryx/AGX-2.38.0.0/setup_env.bash
export LD_LIBRARY_PATH=/opt/Algoryx/AGX-2.38.0.0/lib:$LD_LIBRARY_PATH
source /opt/ros/humble/setup.bash
mkdir -p ~/ros2_ws/src
cd ros2_ws
cd src
git clone https://github.com/choreonoid/choreonoid.git
git clone https://github.com/choreonoid/choreonoid_ros.git
git clone https://github.com/choreonoid/choreonoid_ros2_mobile_robot_tutorial.git
git clone https://github.com/wrs-frei-simulation/WRS-Pre-2024.git choreonoid/ext/WRS2024PRE
git clone https://github.com/k38-suzuki/hairo-world-plugin.git choreonoid/ext/hairo-world-plugin
git clone https://github.com/k38-suzuki/choreonoid_ros2_sample_drone_tutorial.git
cp -r $HOME/choreonoid_env_setup/choreonoid_ros2_sample_wrs2024pre $HOME/ros2_ws/src
cd choreonoid
misc/script/install-requisites-ubuntu-22.04.sh
cd ~/ros2_ws
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

