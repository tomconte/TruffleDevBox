# Truffle Development Box

Use this Vagrant box configuration to start a fully operational Truffle development environment on Windows.

It includes:

- Git for Windows
- All the necessary pre-requisites for the Node.JS-based tools that require a working node-gyp, using Felix Rieseberger's amazing windows-build-tools package.
- The latest version of npm (required to use node-gyp with Visual Studio 2015 Build Tools)
- Win64 OpenSSL libraries (required by the native secp256k1 library)

The installer automatically installs Truffle, however the environment is ready for you to install any other Node.JS-based blockchain development environment, like TestRPC or BlockApp's bloc.

A word of caution: the script takes a very long time to install all the pre-requisites. 

## TODO

- Install Visual Studio Code
- Install Solidity plug-in for Visual Studio Code
- Add VirtualBox provider configuration
- Add Azure provider configuration
- Packer configuration to generate pre-built image with all pre-requisites on Hyper-V, Azure and VirtualBox
