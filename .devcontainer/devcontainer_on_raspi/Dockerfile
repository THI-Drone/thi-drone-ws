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

# Install required dependencies so that picamera2 can used
RUN apt update && apt install -y --no-install-recommends gnupg
RUN apt update && apt install -y --no-install-recommends \
    meson \
    ninja-build \
    pkg-config \
    libyaml-dev \
    python3-yaml \
    python3-ply \
    python3-jinja2 \
    libevent-dev \
    libdrm-dev \
    libcap-dev \
    python3-opencv \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/*

# Install libcamera from source
RUN git clone https://github.com/raspberrypi/libcamera.git
RUN meson setup libcamera/build libcamera/
RUN ninja -C libcamera/build/ install


# Install kmsxx from source
RUN git clone https://github.com/tomba/kmsxx.git
RUN meson setup kmsxx/build kmsxx/
RUN ninja -C kmsxx/build/ install 

# Add the new installations to the python path so that picamera2 can find them
ENV PYTHONPATH $PYTHONPATH/usr/local/lib/aarch64-linux-gnu/python3.10/site-packages:/app/kmsxx/build/py

# Finally install picamera2 using pip
RUN pip3 install picamera2

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# Set the default user. (Can be omitted if you want to keep the default as root)
USER $USERNAME
CMD ["/bin/bash"]