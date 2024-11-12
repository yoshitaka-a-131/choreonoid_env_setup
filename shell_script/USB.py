import os
import subprocess

dir_path = "/media/ubuntu/"

USB=os.listdir(dir_path)[0]
print(os.listdir(dir_path)[0] )

subprocess.run(["sudo", "cp", "/media/ubuntu/"+str(USB)+"/agx.lic","/opt/Algoryx/AGX-2.38.0.0/agx.lic"])
