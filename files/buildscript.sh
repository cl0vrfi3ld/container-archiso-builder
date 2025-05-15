#!/bin/sh

#Placing terminal to the starting folder
cd /root/

# #Ask the user where are the archiso files
# echo "Type the repo URL where the archiso files are, followed by [ENTER]"
# echo "Example: https://github.com/nlhomme/lhoslite"
# read repository

Repo=""
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
git clone $Repo archisoimg

#Go to this new working folder
cd archisoimg

git checkout ${Branch}

chmod +x ./build.sh
chown $USER:$USER ./build.sh
#Run the script to build the ISO
./build.sh -v

#Move the final ISO to /tmp to be accessible from the host
mv out/*.iso /out
