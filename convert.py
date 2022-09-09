import os, math, time, sys, argparse

from subprocess import check_output as cout

def main():
    parser = init_argparse()
    args = parser.parse_args()
    print(f"{args}")

def init_argparse() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        usage="%(prog)s [OPTION] [FILE]...",
        description="Convert VMWare VMs to a QEMU-compatible file format."
    )
    parser.add_argument(
        "-v", "--version", action="version",
        version = f"{parser.prog} version 0.1"
    )
    parser.add_argument(
        "-o", "--outfile", action="out_file",
        out_file = f"{parser.prog}"
    )
    parser.add_argument(
        "-i", "--inputova", action="input_ova",
        input_ova = f"{parser.prog}"
    )
    parser.add_argument(
        "-I", "--inputvmdk", action="input_vmdk",
        input_vmdk = f"{parser.prog}"
    )
    return parser

