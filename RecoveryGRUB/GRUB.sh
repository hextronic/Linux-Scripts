#!/bin/bash

#RecoveryGrub v0.1
#By hextronic

dependencies() {
command -v grub > /dev/null 2>&1 || { echo >&2 "GRUB is not installed ! Install it."; exit 1; }
}

loading() {
clear
printf "\e[1;91m"

printf "\n▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒ Loading ...\n"
sleep 0.1
clear
printf "\n▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ Loading ...\n"
sleep 0.1
}

banner() {
loading
clear
printf "\n"
printf "\e[1;92m  _______  _______  _______  _______           _______  _______             _______  _______           ______ \e[0m\n" 
printf "\e[1;92m (  ____ )(  ____ \(  ____ \(  ___  )|\     /|(  ____ \(  ____ )|\     /|  (  ____ \(  ____ )|\     /|(  ___ \ \e[0m\n"
printf "\e[1;92m | (    )|| (    \/| (    \/| (   ) || )   ( || (    \/| (    )|( \   / )  | (    \/| (    )|| )   ( || (   ) ) \e[0m\n"
printf "\e[1;92m | (____)|| (__    | |      | |   | || |   | || (__    | (____)| \ (_) /   | |      | (____)|| |   | || (__/ /  \e[0m\n"
printf "\e[1;92m |     __)|  __)   | |      | |   | |( (   ) )|  __)   |     __)  \   /    | | ____ |     __)| |   | ||  __ (   \e[0m\n"
printf "\e[1;92m | (\ (   | (      | |      | |   | | \ \_/ / | (      | (\ (      ) (     | | \_  )| (\ (   | |   | || (  \ \   \e[0m\n"
printf "\e[1;92m | ) \ \__| (____/\| (____/\| (___) |  \   /  | (____/\| ) \ \__   | |     | (___) || ) \ \__| (___) || )___) )  \e[0m\n"
printf "\e[1;92m |/   \__/(_______/(_______/(_______)   \_/   (_______/|/   \__/   \_/     (_______)|/   \__/(_______)|/ \___/   \e[0m\n"
printf "\n"
printf "\e[1;93m       .:.:.\e[0m\e[1;94m Recovery GRUB by @hextronic   \e[0m\e[1;93m.:.:.\e[0m\n\n"
printf "  \e[101m\e[1;77m:: Disclaimer: Developers assume no liability and are not    ::\e[0m\n"
printf "  \e[101m\e[1;77m:: responsible for any misuse or damage caused by RECOVERY GRUB ::\e[0m\n"
printf " \n"
}

grubtools(){
loading
clear

sudo su
mount /dev/sda3 /mnt 
mount /dev/sda1 /mnt/boot
mount /dev/sda1 /mnt/boot/efi
cd /mnt
mount -t proc proc /mnt/proc
mount -t sysfs sys /mnt/sys
mount -o bind /dev /mnt/dev
mount -t devpts pts /mnt/dev/pts
modprobe efivarfs
chroot /mnt
mount -t efivarfs efivarfs /sys/firmware/efi/efivars
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=archlabs --recheck
grub-mkconfig -o /boot/grub/grub.cfg
}

banner
dependencies
grubtools
