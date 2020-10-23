# Ubuntu 18.04
# Source: https://besu.hyperledger.org/en/stable/Tutorials/Examples/Private-Network-Example/

red=$(tput setaf 1)
reset=$(tput sgr0)
cd $HOME

###################################################################################################
# Dependences
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install py-pip python-dev libffi-dev openssl-dev gcc libc-dev -y
sudo apt-get install dh-autoreconf libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev -y
sudo apt-get install asciidoc xmlto docbook2x -y
sudo apt-get install install-info -y
sudo apt-get install curl -y
sudo apt-get install git -y
sudo apt-get install git-all -y

###################################################################################################
# Install Docker
# sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get install apt-transport-https ca-certificates gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo apt-get install docker docker.io containerd runc -y

sudo docker run hello-world
read -p "$red Press enter to install docker-compose. $reset"

###################################################################################################
# Install Compose on Linux systems
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
read -p "$red Press enter to Clone Besu sample networks. $reset"

###################################################################################################
# Clone Besu sample networks source code
cd $HOME
git clone https://github.com/PegaSysEng/besu-sample-networks.git
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