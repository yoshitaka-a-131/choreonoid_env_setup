#!/bin/bash
cd
source /opt/Algoryx/AGX-2.38.0.0/setup_env.bash
git clone https://github.com/choreonoid/choreonoid.git
git clone https://github.com/wrs-frei-simulation/WRS-Pre-2024.git choreonoid/ext/WRS2024PRE
git clone https://github.com/k38-suzuki/hairo-world-plugin.git choreonoid/ext/hairo-world-plugin
git pull
cd choreonoid
misc/script/install-requisites-ubuntu-22.04.sh
mkdir build
cd build
cmake .. -DBUILD_AGX_DYNAMICS_PLUGIN=ON -DBUILD_AGX_BODYEXTENSION_PLUGIN=ON -DBUILD_WRS2018=ON -DBUILD_SCENE_EFFECTS_PLUGIN=ON -DBUILD_HAIRO_WORLD_PLUGIN=ON -DENABLE_INSTALL_RPATH_USE_LINK_PATH=ON
make
sudo make install
