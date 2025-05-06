#!/bin/sh

#Placing terminal to the starting folder
cd /root/

# #Ask the user where are the archiso files
# echo "Type the repo URL where the archiso files are, followed by [ENTER]"
# echo "Example: https://github.com/nlhomme/lhoslite"
# read repository

#Clone the provided repo
git clone $@

#Go to this new working folder
cd $(echo $@|grep -oP '/([A-Za-z0-9]+\.[A-Za-z]+\/[A-Za-z0-9]+\/)\K([A-Za-z0-9]+(?:-[A-Za-z0-9]+)+)(?=\.git)')

#Run the script to build the ISO
./build.sh -v

#Move the final ISO to /tmp to be accessible from the host
mv out/*.iso /out
