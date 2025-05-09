##
# NAME             : nlhomme/archiso-builder
# TO_BUILD         : docker build --rm -t nlhomme/archiso-builder:latest .
# TO_RUN           : docker run --rm -v /tmp:/tmp -t -i --privileged nlhomme/archiso-builder:latest
##

FROM archlinux:latest
#MAINTAINER nlhomme (https://github.com/nlhomme/archiso-builder)

#Sync package databases and update
RUN pacman -Syu --noconfirm

#Install git and archiso
RUN pacman -S git grub archiso --noconfirm

#Copy the build script and allow him to be executed
COPY files/buildscript.sh root/

#Place the terminal in the home folder
RUN ["chmod", "+x", "root/buildscript.sh"]

#Create the out dir at the root level
RUN ["mkdir", "/out"]

ENTRYPOINT ["./root/buildscript.sh"]

