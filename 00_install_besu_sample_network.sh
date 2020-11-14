# For Ubuntu 18.04 LTS
# Source: https://besu.hyperledger.org/en/stable/Tutorials/Examples/Private-Network-Example/

# Quorum Developer Quickstart tutorial
# The Quorum Developer Quickstart uses the Hyperledger Besu Docker image to run a private network of Besu nodes managed by Docker Compose.

red=$(tput setaf 1)
reset=$(tput sgr0)
cd $HOME

###################################################################################################
# Dependences
###################################################################################################
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y build-essential
sudo apt-get install -y python python-dev libffi-dev libc-dev
sudo apt-get install -y gcc
sudo apt-get install -y make
sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y vim

read -p "$red Press enter to install Docker. $reset"

###################################################################################################
# Install Docker
###################################################################################################
# Remove old versions
sudo apt-get remove -y docker docker-engine docker.io containerd runc

# Install Docker Engine on Ubuntu
sudo apt-get update -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo docker run hello-world
read -p "$red Press enter to install Docker Compose. $reset"

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose --version
read -p "$red Press enter to Install Nodejs, npm and Truffle. $reset"

###################################################################################################
# Install Nodejs, npm and Truffle
###################################################################################################
sudo apt-get install -y nodejs
sudo apt-get install -y nodejs-dev

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install npm
sudo apt-get install -y npm

# Install truffle
sudo npm install -g express
sudo npm install -g truffle

# Install web3
sudo npm install web3

truffle version

read -p "$red Press enter to Create Docker-compose file. $reset"

###################################################################################################
# Create Docker-compose file
###################################################################################################
npx quorum-dev-quickstart

read -p "$red Press enter to Start the network. $reset"

###################################################################################################
# Start the network
###################################################################################################
cd $HOME/quorum-test-network/
./run.sh

###################################################################################################
# Display the list of endpoints
###################################################################################################
./list.sh

###################################################################################################
# Run JSON-RPC requests
###################################################################################################
read -p "$red Press enter to Request the node version. $reset"
curl -X POST --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":1}' http://localhost:8545

read -p "$red Press enter to Count the peers. $reset"
curl -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' http://localhost:8545

read -p "$red Press enter to Request the most recent block number. $reset"
curl -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' http://localhost:8545

###################################################################################################
# Create a transaction using MetaMask
###################################################################################################
read -p "$red !!! ATTENTION !!! Install MetaMask on your Browser and configure it. $reset"
read -p "$red !!! ATTENTION !!! Import: 0xc87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3 $reset"

read -p "$red !!! ATTENTION !!! In the MetaMask network list, select Custom RPC. $reset"
read -p "$red !!! ATTENTION !!! In the New RPC URL field, enter the JSON-RPC HTTP service endpoint. $reset"
