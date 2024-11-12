cd
wget -P $HOME/choreonoid_env_setup/shell_script https://www.algoryx.se/download/installers/old/agx-2.38.0.0-amd64-ubuntu_22.04.deb
sudo dpkg -i $HOME/choreonoid_env_setup/shell_script/agx-2.38.0.0-amd64-ubuntu_22.04.deb
sudo apt -y install gdebi-core
sudo gdebi $HOME/choreonoid_env_setup/shell_script/agx-2.38.0.0-amd64-ubuntu_22.04.deb
echo "source /opt/Algoryx/AGX-2.38.0.0/setup_env.bash" >> .bashrc
echo "export LD_LIBRARY_PATH=/opt/Algoryx/AGX-2.38.0.0/lib:$LD_LIBRARY_PATH" >> .bashrc
source ~/.bashrc

