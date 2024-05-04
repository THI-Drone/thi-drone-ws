FROM general_devcontainer:latest
ADD https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.deb /tmp/
RUN sudo dpkg-i /tmp/jdk-22_linux-x64_bin.deb && rm /tmp/jdk-22_linux-x64_bin.deb

RUN sudo rosdep fix-permissions && rosdep update && rosdep install --from-paths /home/ws/src --ignore-src -y

RUN python3 -m pip install symforce kconfiglib
RUN /home/PX4-Autopilot/Tools/setup/ubuntu.sh
