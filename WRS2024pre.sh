#!/bin/bash
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




