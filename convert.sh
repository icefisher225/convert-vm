#!/bin/zsh

#arguments:
# -i <.ova file path>: input OVA file
# --out: see -i
# -I <vmdk file path>: input VMDK file
# --vmdk: see -I
# -o <out file path>: output file, will be .qcow2
# --out: see -o

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -v|--ova)
      EXTENSION="$2"
      shift # past argument
      shift # past value
      ;;
    -i|--vmdk)
      SEARCHPATH="$2"
      shift # past argument
      shift # past value
      ;;
      -o|--outfile)
      SEARCHPATH="$2"
      shift # past argument
      shift # past value
      ;;
    --default)
      DEFAULT=YES
      shift # past argument
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters







ova=file.ova #full path required

unzipped=/tmp/unzipped/ #Unzip OVA to a temp directory

#Check if file is OVA, if so
mkdir $unzipped #Create temp directory for unzipping OVA@
tar -xvf $ova $unzipped
VMDK=$(find $unzipped -type f -name "*.vmdk") #get vmdk for unzipping

#Finally:
qemu-img convert -O qcow2 $VMDK $output
