cd
mkdir -p ~/ros2_ws/src
cd ros2_ws
cd src
git clone https://github.com/choreonoid/choreonoid.git
git clone https://github.com/choreonoid/choreonoid_ros.git
git clone https://github.com/choreonoid/choreonoid_ros2_mobile_robot_tutorial.git
git clone https://github.com/wrs-frei-simulation/WRS-Pre-2024.git choreonoid/ext/WRS2024PRE
git clone https://github.com/k38-suzuki/hairo-world-plugin.git choreonoid/ext/hairo-world-plugin
git clone https://github.com/k38-suzuki/choreonoid_ros2_sample_drone_tutorial.git
cp $HOME/choreonoid_env_setup/registration_preliminaries.yaml $HOME/ros2_ws/src/choreonoid/ext/WRS2024PRE/registration/registration_preliminaries.yaml
cp $HOME/choreonoid_env_setup/registration_finals.yaml $HOME/ros2_ws/src/choreonoid/ext/WRS2024PRE/registration/registration_finals.yaml
cp $HOME/choreonoid_env_setup/WRS2024pre_preliminaries.launch.xml $HOME/ros2_ws/src/choreonoid_ros/launch/ros2/WRS2024pre_preliminaries.launch.xml
cp $HOME/choreonoid_env_setup/WRS2024pre_finals.launch.xml $HOME/ros2_ws/src/choreonoid_ros/launch/ros2/WRS2024pre_finals.launch.xml
cd choreonoid
misc/script/install-requisites-ubuntu-22.04.sh
rosdep install -y --from-paths ~/ros2_ws/src --ignore-src
cd ~/ros2_ws
colcon build --symlink-install --cmake-args -DBUILD_AGX_DYNAMICS_PLUGIN=ON -DBUILD_AGX_BODYEXTENSION_PLUGIN=ON -DBUILD_WRS2018=ON -DBUILD_SCENE_EFFECTS_PLUGIN=ON -DBUILD_HAIRO_WORLD_PLUGIN=ON -DENABLE_INSTALL_RPATH_USE_LINK_PATH=ON
echo "source $HOME/ros2_ws/install/setup.bash" >> ~/.bashrc
source ~/.bashrc
cp $HOME/choreonoid_env_setup/WRS2024pre_preliminaries.desktop $HOME/デスクトップ/WRS2024pre_preliminaries.desktop
cp $HOME/choreonoid_env_setup/WRS2024pre_finals.desktop $HOME/デスクトップ/WRS2024pre_finals.desktop
chmod 774 $HOME/choreonoid_env_setup/WRS2024pre_preliminaries.sh
chmod 774 $HOME/choreonoid_env_setup/WRS2024pre_finals.sh
gio set $HOME/デスクトップ/WRS2024pre_preliminaries.desktop metadata::trusted true
chmod 774 $HOME/デスクトップ/WRS2024pre_preliminaries.desktop
gio set $HOME/デスクトップ/WRS2024pre_finals.desktop metadata::trusted true
chmod 774 $HOME/デスクトップ/WRS2024pre_finals.desktop
