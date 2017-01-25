# Truffle Development Box

Use this Vagrant box configuration to start a fully operational Truffle development environment on Windows.

It includes:

- Git for Windows
- All the necessary pre-requisites for the Node.JS-based tools that require a working node-gyp, using Felix Rieseberger's amazing windows-build-tools package.
- The latest version of npm (required to use node-gyp with Visual Studio 2015 Build Tools)
- Win64 OpenSSL libraries (required by the native secp256k1 library)
- Visual Studio Code

The script automatically installs Truffle and TestRPC, however the environment is ready for you to install any other Node.JS-based blockchain development environment, like BlockApp's bloc.

A word of caution: the script takes a very long time to install all the pre-requisites. 

## Packer

`truffle-packer.json` contains a Packer configuration to generate a pre-built VM image in Azure with all pre-requisites and Truffle itself installed. Please read the [Azure Resource Manager Builder](https://www.packer.io/docs/builders/azure-arm.html) documentation in the Packer docs for the details on how to use Packer with Azure.

## TODO

- Install Solidity plug-in for Visual Studio Code
