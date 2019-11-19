#!/bin/bash
as Proyecto.s -o Proyecto.o
ld -Ttext 0x7c00 --oformat=binary Proyecto.o -o Proyecto.bin
dd if=/dev/zero of=Proyecto.img bs=512 count=2880
dd if=Proyecto.bin of=Proyecto.img
qemu-system-x86_64 -fda Proyecto.img
