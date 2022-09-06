#!/bin/zsh

#arguments:
# -i <.ova file path>: input OVA file
# --out: see -i
# -I <vmdk file path>: input VMDK file
# --vmdk: see -I
# -o <out file path>: output file, will be .qcow2
# --out: see -o

ova=file.ova #full path required

unzipped=/tmp/unzipped/ #Unzip OVA to a temp directory

#Check if file is OVA, if so
mkdir $unzipped #Create temp directory for unzipping OVA@
tar -xvf $ova $unzipped
VMDK=$(find $unzipped -type f -name "*.vmdk") #get vmdk for unzipping

#Finally:
qemu-img convert -O qcow2 $VMDK $output
