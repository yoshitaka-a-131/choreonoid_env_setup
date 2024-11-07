cd
wget -P $HOME https://www.algoryx.se/download/installers/old/agx-2.38.0.0-amd64-ubuntu_22.04.deb
sudo dpkg -i agx-2.38.0.0-amd64-ubuntu_22.04.deb
sudo apt install gdebi-core
sudo gdebi agx-2.38.0.0-amd64-ubuntu_22.04.deb
echo "source /opt/Algoryx/AGX-2.38.0.0/setup_env.bash" >> .bashrc
echo "export LD_LIBRARY_PATH=/opt/Algoryx/AGX-2.38.0.0/lib:$LD_LIBRARY_PATH" >> .bashrc
source ~/.bashrc
gnome-terminal -- bash "$HOME/choreonoid_env_setup/WRS2024pre_without_ROS2.sh"
