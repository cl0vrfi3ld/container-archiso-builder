# container-archiso-builder
Build Arch images in a tidy and convenient containerized environment.

Check out archiso on the [ArchLinux wiki](https://wiki.archlinux.org/index.php/archiso)

## Usage
Make sure you've published your archiso files to a publicly accessible git repository before continuing.

To build the image, run:

    `podman build --rm -t container-archiso-builder:latest .`

You can also pull the latest image available by running:

    `podman pull nlhomme/archiso-builder`

Run the container with the command below and archiso will start building your image:

    `sudo podman run --rm -v ./out:/out -t -i --privileged ghcr.io/cl0vrfi3ld/archiso-builder:latest "https://gitsomething.com/your/os-image-repo.git"`
    
Note that `sudo` or `pkexec` is required for podman to access various privileged interfaces (hence the `--privileged` flag)!

Once the image build is done, go to the new `./out` directory to find your iso image!
