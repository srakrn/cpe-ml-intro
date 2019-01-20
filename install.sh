#!/bin/bash
if ! [ -d ~/cpe-ml-intro/ -o -f ~/cpe-ml-intro/ ]; then
    git clone https://github.com/srakrn/cpe-ml-intro.git ~/cpe-ml-intro
fi
cd ~/cpe-ml-intro
if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
    DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'// | tr "[:upper:]" "[:lower:]")
    VERSION=$(lsb_release -r | cut -d: -f2 | sed s/'^\t'// | tr "[:upper:]" "[:lower:]")
else
    echo "not found"; exit 7
fi
if [ "$DISTRO" = "ubuntu" ]; then
    echo "$DISTRO $VERSION found"
    if [ "$VERSION" = "17.10" -o "$VERSION" = "18.04" -o "$VERSION" = "18.10" ]; then
        curl https://bootstrap.pypa.io/get-pip.py | sudo -H python3.6
        sudo pip3 install -r utilities/requirements.txt
        python3.6 ~/cpe-ml-intro/utilities/reqs_check.py
    elif [ "$VERSION" = "16.10" -o "$VERSION" = "17.04" ]; then
        sudo apt-get update
        sudo apt-get install -y python3.6
        curl https://bootstrap.pypa.io/get-pip.py | sudo -H python3.6
        sudo pip3 install -r utilities/requirements.txt
        python3.6 ~/cpe-ml-intro/utilities/reqs_check.py
    elif [ "$VERSION" = "14.04" -o "$VERSION" = "16.04" ]; then
        sudo add-apt-repository ppa:jonathonf/python-3.6
        sudo apt-get update
        sudo apt-get install -y python3.6
        curl https://bootstrap.pypa.io/get-pip.py | sudo -H python3.6
        sudo pip3 install -r utilities/requirements.txt
        python3.6 ~/cpe-ml-intro/utilities/reqs_check.py
    else
        echo "Invalid version"; exit 7
    fi
else
    echo "Invalid OS"; exit 7
fi