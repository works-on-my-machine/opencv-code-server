# opencv-code-server
Code Server Docker image for OpenCV with C++ development on the browser. Contains OpenCV, NLopt and R libraries.


## Prerequisites
- git
- docker
- docker-compose


## Clone
```bash
git clone https://github.com/works-on-my-machine/opencv-code-server.git
```

## Modify
By default, uses:
- Eclipse key bindings
- Github Light Theme

In order to change default settings modify following files:
```bash
./opencv-code-server/settings/extensions.csv # Add remove vscode extensions
./opencv-code-server/settings/settings.json # Add remove vscode settings
```

## Install
```bash

```


## Advanced
Modify `Dockerfile` in order to add or remove libraries to container where code-server is running. Following are installed:
- OpenCV
- NLopt
- R
- clangd
