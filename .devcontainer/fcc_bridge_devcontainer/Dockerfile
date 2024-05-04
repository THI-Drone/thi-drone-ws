FROM general_devcontainer:latest

# install jdk for running jmavsim
ADD https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.deb /tmp/
RUN sudo dpkg -i /tmp/jdk-22_linux-x64_bin.deb && sudo rm /tmp/jdk-22_linux-x64_bin.deb

# install jmavsim build requirements
RUN python3 -m pip install symforce kconfiglib
ADD https://raw.githubusercontent.com/PX4/PX4-Autopilot/main/Tools/setup/ubuntu.sh /tmp/setup/
ADD https://raw.githubusercontent.com/PX4/PX4-Autopilot/main/Tools/setup/requirements.txt /tmp/setup/
RUN sudo chmod 777 /tmp/setup/*
RUN /tmp/setup/ubuntu.sh
