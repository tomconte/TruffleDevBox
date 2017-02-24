# Install all pre-requisites for Ethereum Truffle
# Once complete, just open a new terminal window and run:
# npm install -g truffle
# If you want TestRPC:
# npm install -g testrpc

# N.B.: must be run as Administrator
# Also need to make sure the execution policy allows running scripts that aren't code-signed
# Set-ExecutionPolicy Unrestricted -Scope CurrentUser

###
### STEP 1: install generic tools, e.g. Node.JS and Git
###

# Download & install Node.JS

Set-Location $env:TEMP

$nodeVersion = "v6.7.0"
$nodeInstaller = "node-v6.7.0-x64.msi"

Invoke-WebRequest -UseBasicParsing -Uri "https://nodejs.org/dist/$nodeVersion/$nodeInstaller" -OutFile $nodeInstaller

Start-Process $nodeInstaller /quiet -Wait

# We will also need git

$gitInstaller = "Git-2.10.1-64-bit.exe"
Invoke-WebRequest -UseBasicParsing -Uri "https://github.com/git-for-windows/git/releases/download/v2.10.1.windows.1/$gitInstaller" -OutFile $gitInstaller
Start-Process $gitInstaller /silent -Wait

# Refresh the Path to pick up both node and git

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

###
### STEP 2: prepare Windows to install native (compiled) Node modules
###

# We need to instruct npm to install modules in a "real" global location instead of the user's %APPDATA% directory.
# Otherwise everything will be wiped out by sysprep.

mkdir C:\npm
Set-Content -Path $ENV:ProgramFiles\nodejs\node_modules\npm\npmrc -Value prefix=C:\npm
$env:Path += ";C:\npm"

# Install Windows Build Tools
# https://github.com/felixrieseberg/windows-build-tools
# This will take a LONG time but takes care of all node-gyp pre-requisites

npm install --global windows-build-tools

# Update to very latest version of npm

npm install --global npm@latest


###
### STEP 3: actually install the tools we are interested in, i.e. Truffle and TestRPC
### TODO: lock the versions?
###

# Now we can finally install Truffle

npm install --global truffle

# Install Ethereum testrpc

npm install --global ethereumjs-testrpc

###
### STEP 4: install other tools, utilities and libraries
###

# Install VS Code

$codeInstaller = "VSCodeSetup-stable.exe"
Invoke-WebRequest -UseBasicParsing -Uri "https://vscode-update.azurewebsites.net/latest/win32/stable" -OutFile $codeInstaller
Start-Process $codeInstaller "/verysilent /suppressmsgboxes /mergetasks=!runcode" -Wait

# Install OpenSSL libraries -- required by "secp256k1 Node module
# We NEED an older 1.0.2 version that includes libeay32.lib

$openSSLInstaller = "Win64OpenSSL-1_0_2k.exe"
Invoke-WebRequest -UseBasicParsing -Uri "https://slproweb.com/download/$openSSLInstaller" -OutFile $openSSLInstaller
Start-Process $openSSLInstaller /verysilent -Wait

###
### STEP 5: final environment preparations
###

# Update the system path to include the new npm location

$p = [Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
$p += ";C:\npm"
[Environment]::SetEnvironmentVariable("Path", $p, [System.EnvironmentVariableTarget]::Machine)

# The End

Write-Output "All done!"
