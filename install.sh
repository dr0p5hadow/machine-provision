#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade


sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs
sudo apt install snapd


echo "installing bash_profile aliases from recon_profile"
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
echo "done bash_profile installed"

#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
					sudo tar -xvf go1.13.4.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "Aquatone installed"

#install chromium
echo "Installing Chromium"
sudo snap install chromium
echo "Chromium installed"

echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "JSParser installed"

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "Sublist3r installed"

echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo "wpscan installed"

echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "dirsearch installed"

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "discovery installed"

echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "sqlmap installed"

echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo "knock.py installed"

echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "lazyrecon installed"

echo "installing nmap"

apt-get install -y nmap
echo "nmap installed"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "massdns installed"

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "asnlookup installed"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "httprobe installed"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "unfurl installed"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "waybackurls installed"

echo "installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "crtndstry installed"

echo "downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "Seclists Downloaded"

echo "installing Postman"
sudo snap install postman
echo "Postam Installed"

echo "installing Amass"
sudo snap install amass
echo "Amass Installed"

echo "installing VS Code"
sudo snap install code --classic
echo "VS Code Installed"

echo "installing Pycharm community"
sudo snap install pycharm-community --classic
echo "Pycharm community Installed"

echo "installing OWASP zaproxy"
sudo snap install zaproxy --classic
echo "zaproxy ZAP Installed"

echo "installing Cacher"
sudo snap install zaproxy --classic
echo "Cacher Installed"

echo "installing CURL"
sudo snap install curl
echo "CURL installed"

echo "installing NVM"
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
echo "NVM installed"

echo "Reloading ~./profile"
source ~/.profile
echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
