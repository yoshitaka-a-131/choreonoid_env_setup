#!/bin/bash
gnome-terminal -- bash -c "echo 'シェルスクリプト実効完了！';ros2 launch choreonoid_ros WRS2024pre_preliminaries.launch.xml; bash"
ros2 launch choreonoid_ros WRS2024pre_preliminaries.launch.xml
