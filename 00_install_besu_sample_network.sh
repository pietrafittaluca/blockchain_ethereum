# Ubuntu 18.04
# Source: https://besu.hyperledger.org/en/stable/Tutorials/Examples/Private-Network-Example/

red=$(tput setaf 1)
reset=$(tput sgr0)
cd $HOME

###################################################################################################
# Dependences
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y build-essential
sudo apt-get install -y py-pip python-dev libffi-dev openssl-dev libc-dev
sudo apt-get install -y gcc
sudo apt-get install -y make
sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y vim

###################################################################################################
# Install Docker
sudo apt-get remove -y docker docker-engine docker.io containerd runc
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


sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose --version
read -p "$red Press enter to Clone Besu sample networks. $reset"

###################################################################################################
# Clone Besu sample networks source code
cd $HOME
git clone https://github.com/ConsenSys/besu-sample-networks.git
read -p "$red Press enter to Start network. $reset"

###################################################################################################
# Start the network
cd besu-sample-networks/
./run.sh
            # The script builds the images, and runs the containers.
            # It also scales the regular node container to four containers to simulate a network with enough peers to synchronize.
read -p "$red Press enter to display the list of endpoints. $reset"

###################################################################################################
# Display the list of endpoints
./list.sh

read -p "$red Install MetaMask on Browser and configure it $reset"
read -p "$red Import: 0xc87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3 $reset"