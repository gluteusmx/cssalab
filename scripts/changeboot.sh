#!/bin/bash

win=$(efibootmgr |grep Win | awk -F ' ' '{ print $1 }' | cut -c 5-8)
lin=$(efibootmgr |grep Fed | awk -F ' ' '{ print $1 }' | cut -c 5-8 | head -n 1)

efibootmgr -qo $lin,$win

mv /etc/grub.d/10_linux /etc/grub.d/11_linux
mv /etc/grub.d/30_os-prober /etc/grub.d/10_os-prober
grub2-mkconfig -o /boot/grub2/grub.cfg
