# Install all pre-requisites for Ethereum Truffle
# Once complete, just open a new terminal window and run:
# npm install -g truffle
# If you want TestRPC:
# npm install -g testrpc

# N.B.: must be run as Administrator
# Also need to make sure the execution policy allows running scripts that aren't code-signed
# Set-ExecutionPolicy Unrestricted -Scope CurrentUser

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

# Install OpenSSL libraries -- required by secp256k1
# We need the older 1.0.2 version that includes libeay32.lib

$openSSLInstaller = "Win64OpenSSL-1_0_2k.exe"
Invoke-WebRequest -UseBasicParsing -Uri "https://slproweb.com/download/$openSSLInstaller" -OutFile $openSSLInstaller
Start-Process $openSSLInstaller /verysilent -Wait

# Install Windows Build Tools
# https://github.com/felixrieseberg/windows-build-tools
# This will take a LONG time but takes care of all node-gyp pre-requisites

npm install --global windows-build-tools

# Update to very latest version of npm

npm install --global npm@latest

# Now we can finally install Truffle

npm install --global truffle

# Install Ethereum testrpc

npm install --global ethereumjs-testrpc

# Install VS Code

$codeInstaller = "VSCodeSetup-stable.exe"
Invoke-WebRequest -UseBasicParsing -Uri "https://vscode-update.azurewebsites.net/latest/win32/stable" -OutFile $codeInstaller
Start-Process $codeInstaller "/verysilent /suppressmsgboxes /mergetasks=!runcode" -Wait

# The End

Write-Output "All done!"
