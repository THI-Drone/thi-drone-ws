# thi-drone-ws
ABC
## About this project

This project is about building software for the the companian computer of a drone on autopilot. The software is written using ROS and is intended to run on a Raspberry Pi 4/5. The software is intended to be used with a Pixhawk6C flight controller. The development is done in C++ and Python. The project is taking place in the context of a 6th semester student project of the [Aircraft and Vehicle Informatics (B. Sc.)](https://www.thi.de/en/computer-science/degree-programmes/aircraft-and-vehicle-informatics-bsc/) degree program at the [Technische Hochschule Ingolstadt](hhttps://www.thi.de/en/).

## About this repo

This repository contains the ROS workspace for the project. The workspace is structured as follows:

``` text
thi-drone-ws
.
├─── .devcontainer                      # Contains the devcontainer configuration
├─── .gitignore                         # Contains the gitignore configuration
├─── LICENSE                            # Contains the license information
├─── README.md                          # The file you are reading right now
└─── src                                # Source directory containing all the ROS packages
```

## Setup

### Prerequisites

You should be in one of the following three situations.

- You have Docker (or Docker Desktop for Windows and Mac) installed, see [the Docker documentation](https://docs.docker.com/get-docker/)
  - On Linux: Make sure you follow the post install guide for Docker, see [the Docker documentation](https://docs.docker.com/engine/install/linux-postinstall/)
- You have [Visual Studio Code](https://code.visualstudio.com/) installed
  - You have the [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension installed in Visual Studio Code
  - You have the [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) extension installed in Visual Studio Code
- You have [Git](https://git-scm.com/) installed

If you need help or troubleshooting tips, see [the Visual Studio Code documentation](https://code.visualstudio.com/docs/devcontainers/containers).

### Step by step

This assumes you have the [prerequisites](#prerequisites) installed.

1) Open a terminal and navigate to the directory where you want to clone the repository

2) Clone this repository (with all submodules)

    ``` bash
    git clone --recursive <project url>
    ```

    Get the project url by clicking on the green "Code" button on the GitHub page of this repository.

3) Open the repository in Visual Studio Code

    ``` bash
    code thi-drone-ws
    ```

    This can also be done by opening Visual Studio Code and selecting "Open Folder" from the start screen or the file menu.

4) Adapt default username in .devcontainer/devcontainer.json

    - Via bash script
      - cd into the .devcontainer directory
      - Make the bash script executable by running `chmod +x .devcontainer/devcontainer_setup_script.sh`
      - Run the bash script by running `./.devcontainer/devcontainer_setup_script.sh`
    - Manual
      - Replace "REPLACE_ME" with your username (that you are logged in with on your host) in the .devcontainer/devcontainer.json file. This needs to be the same for both occurrences of "REPLACE_ME".

5) Stop git from telling you about your local changes in the `devcontainer.json` file

    ```bash
    git update-index --assume-unchanged .devcontainer/devcontainer.json
    ```

6) Open the project in a devcontainer

    - Click the green button in the bottom left corner of the window
    - Select "Reopen in Container"
    - Wait for the devcontainer to build
    - Open a terminal in the devcontainer (by clicking the "+" in the VS Code terminal tab). This will be inside the devcontainer!

7) Build the workspace

    Now you are inside the devcontainer and can build the workspace.

    ``` bash
    chmod +x build.sh
    ./build.sh
    ```

## Contribution guidelines

### Working with the Workspace

See [ROS Workspace Developer Guide](https://docs.google.com/document/d/17nq2SS2DX0lrlWp5FjLQez1mpn0i5w_5APbjAiUk3j0/edit?usp=drive_link) for more information.

### Branching

We use the following branch hierarchy for development in this project:

``` text
├─── release                              
    ├─── pre-release                    
        ├─── dev                        
            ├─── feature-branches       
```

The different branches explained:

- release
  - Contains the commits that are ready to be released
- pre-release
  - Contains the commits that are ready to be tested before being released
- dev
  - Contains finished features that are ready to be integration tested
- feature-branch
  - Contains the development of a singular feature

### Coding Style/Convention

#### Autoformatting

We use the following code style guidelines for formatting the source code of this project:
C++ code should follow the [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html).
Python code should follow the [PEP 8 Style Guide](https://pep8.org/).

In order to ensure that the code style guidelines are followed, we use the following tools:

- clang-format for C++ code
- autopep8 for Python code

##### Visual Studio Code autoformatting

You can configure your Visual Studio Code to ensure that the code is automatically formatted on file save, in order to do this please see the documentation of the respective extensions:

- [clang-format](https://marketplace.visualstudio.com/items?itemName=xaver.clang-format)
- [autopep8](https://marketplace.visualstudio.com/items?itemName=ms-python.autopep8)

##### Manually formatting

Alternatively these tools can be run manually by executing the following commands in your packages root directory:

  ``` bash
  # Format Python code manually
  autopep8 --global-config=pep8 --max-line-length 80 --aggressive --aggressive --in-place --recursive .
  ```
  
  ``` bash
  # Format C++ code manually
  for file in $(find . -name "*.cpp" -o -name "*.cc" -o -name "*.cxx" -o -name "*.hpp" -o -name "*.hh" -o -name "*.h" -o -name "*.hxx" -o -name "*.c++"); do
    echo "Formatting: $file"
    clang-format -i $file
  done
  ```

## Contact

Unfortunately we are not able to provide contact data for this project, as we do not provide any external support. If you find a bug or want to contributeto this project, please open an issue on this GitHub repo or create a pull request.

## License

See the [LICENSE](LICENSE) file for license rights and limitations (MIT).
