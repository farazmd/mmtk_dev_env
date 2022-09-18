# Template to setup jikesrvm and mmtk for development


## Prerequisites
- VScode extentsion for [remote-containers](vscode:extension/ms-vscode-remote.remote-containers)


## Setup
- Open VS code and open the command palette.
- Type `Rebuild and reopen folder in containers` and run the command.
- After the workspace opens witin the container, run `make setup-repo`
- Run the following to setup and build the project:
    ```shell
        make setup-java8
        make checkout-rvm
        make setup-mmtk
        make build
    ```