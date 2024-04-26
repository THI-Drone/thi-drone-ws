FROM ros:humble
ARG USERNAME=USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG BASHRCPATH=/home/$USERNAME/.bashrc

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # Add sudo support.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Upgrade Ubuntu packages to latest version
RUN apt-get update && apt-get upgrade -y

# Install python3
RUN apt-get install -y python3-pip
# Install useful tooling
RUN apt-get install -y ssh vim

# C++ JSON lib
RUN apt-get install -y nlohmann-json3-dev

# Python OpenCV Lib
RUN pip install opencv-python

# LibGL Dependency
RUN apt-get install -y libgl1-mesa-glx

# Autoformatter for C++ / Python
RUN apt-get install -y clang-format
RUN apt-get install -y python3-autopep8

# Make sure ROS is sourced in every bash shell in the container
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> $BASHRCPATH
# Set the default shell to bash (rather than sh)
ENV SHELL /bin/bash

# Fix Python deprecated warnings when using ROS2
RUN pip install setuptools==58.2.0

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# Set the default user. (Can be omitted if you want to keep the default as root)
USER $USERNAME
CMD ["/bin/bash"]