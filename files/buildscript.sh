#!/bin/sh

#Placing terminal to the starting folder
cd /root/

# #Ask the user where are the archiso files
# echo "Type the repo URL where the archiso files are, followed by [ENTER]"
# echo "Example: https://github.com/nlhomme/lhoslite"
# read repository

Repo="https://github.com/cl0vrfi3ld/clos-image-builder.git"
Branch="main"

# parse args
while getopts "r:b:" o; do
    case "${o}" in
        r)
            Repo=${OPTARG}
            ;;
        b)
            Branch=${OPTARG}
            ;;
        *)
            exit
            ;;
    esac
done

#Clone the provided repo
git clone $Repo

#Go to this new working folder
cd $(echo $Repo|grep -oP '/([A-Za-z0-9]+\.[A-Za-z]+\/[A-Za-z0-9]+\/)\K([A-Za-z0-9]+(?:-[A-Za-z0-9]+)+)(?=\.git)')

git checkout ${Branch}

#Run the script to build the ISO
./build.sh -v

#Move the final ISO to /tmp to be accessible from the host
mv out/*.iso /out
