#!/usr/bin/bash
read line < select.txt

if echo "$line" | grep -q "1"; then
  gnome-terminal -- bash -c "bash $HOME/choreonoid_env_setup/shell_script/Install_AGX.sh;bash"
else
  :
fi

if echo "$line" | grep -q "2"; then
  gnome-terminal -- bash -c "bash $HOME/choreonoid_env_setup/shell_script/Install_ROS2.sh;bash"
else
  :
fi

if echo "$line" | grep -q "3"; then
  gnome-terminal -- bash -c "bash $HOME/choreonoid_env_setup/shell_script/WRS2024pre_without_ROS2.sh;bash"
else
  :
fi

if echo "$line" | grep -q "4"; then
  gnome-terminal -- bash -c "bash $HOME/choreonoid_env_setup/shell_script/WRS2024pre_with_ROS2.sh;bash"
else
  :
fi
