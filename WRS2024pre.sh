cd
sudo apt install git
git clone https://github.com/choreonoid/choreonoid.git
git clone https://github.com/wrs-frei-simulation/WRS-Pre-2024.git choreonoid/ext/WRS2024PRE
git clone https://github.com/k38-suzuki/hairo-world-plugin.git choreonoid/ext/hairo-world-plugin
git clone https://github.com/yoshitaka-a-131/choreonoid_env_setup.git
git pull
cp choreonoid_env_setup/registration_preliminaries.yaml choreonoid/ext/WRS2024PRE/registration/registration_preliminaries.yaml
cp choreonoid_env_setup/registration_finals.yaml choreonoid/ext/WRS2024PRE/registration/registration_finals.yaml
cd choreonoid
misc/script/install-requisites-ubuntu-22.04.sh
mkdir build
cd build
cmake .. -DBUILD_AGX_DYNAMICS_PLUGIN=ON -DBUILD_AGX_BODYEXTENSION_PLUGIN=ON -DBUILD_WRS2018=ON -DBUILD_SCENE_EFFECTS_PLUGIN=ON -DBUILD_HAIRO_WORLD_PLUGIN=ON -DENABLE_INSTALL_RPATH_USE_LINK_PATH=ON
make
sudo make install

gnome-terminal -e 'bash -c "cd"'
sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt upgrade
sudo apt install ros-humble-desktop
sudo apt install ros-humble-compressed-image-transport
sudo apt install python3-colcon-common-extensions
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python3-colcon-common-extensions

gnome-terminal -e 'bash -c "cd"'
mkdir -p ~/ros2_ws/src
cd ros2_ws
cd src
git clone https://github.com/choreonoid/choreonoid.git
git clone https://github.com/choreonoid/choreonoid_ros.git
git clone https://github.com/choreonoid/choreonoid_ros2_mobile_robot_tutorial.git
git clone https://github.com/wrs-frei-simulation/WRS-Pre-2024.git choreonoid/ext/WRS2024PRE
git clone https://github.com/k38-suzuki/hairo-world-plugin.git choreonoid/ext/hairo-world-plugin
git clone https://github.com/k38-suzuki/choreonoid_ros2_sample_drone_tutorial.git
git clone https://github.com/yoshitaka-a-131/choreonoid_env_setup.git
cp $HOME/choreonoid_env_setup/registration_preliminaries.yaml $HOME/ros2_ws/src/choreonoid/ext/WRS2024PRE/registration/registration_preliminaries.yaml
cp $HOME/choreonoid_env_setup/registration_finals.yaml $HOME/ros2_wa/src/choreonoid/ext/WRS2024PRE/registration/registration_finals.yaml
cd choreonoid
misc/script/install-requisites-ubuntu-22.04.sh
rosdep install -y --from-paths ~/ros2_ws/src --ignore-src
cd ~/ros2_ws
colcon build --symlink-install --cmake-args -DBUILD_AGX_DYNAMICS_PLUGIN=ON -DBUILD_AGX_BODYEXTENSION_PLUGIN=ON -DBUILD_WRS2018=ON -DBUILD_SCENE_EFFECTS_PLUGIN=ON -DBUILD_HAIRO_WORLD_PLUGIN=ON -DENABLE_INSTALL_RPATH_USE_LINK_PATH=ON
echo "source $HOME/ros2_ws/install/setup.bash" >> ~/.bashrc
