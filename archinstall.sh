#!/bin/bash

case $1 in
	step1 )
		echo "=== STEP 1 STARTING ==="
		echo "Loading keyboard layout: pl"
		loadkeys pl
		echo "Setting up network"
		pacman -S dhcpcd && systemctl start dhcpcd
		read -p "Enter SSID: " SSID
		read -p "Enter passkey: " NETKEY
		iwctl --passphrase $NETKEY station wlan0 connect $SSID
		ip -c a
		timedatectl
		echo "=== STEP 1 OVER ==="
		echo "You can now partition the disks."
		;;
	step2 )
		echo "=== STEP 2 STARTING ==="
		echo "Installing needed packages to the new system."
		pacstrap -K /mnt base linux linux-firmware dhcpcd iwctl amd-ucode fsck e2fsprogs vi vim man-db man-pages texinfo
		genfstab -U /mnt >> /mnt/etc/fstab
		echo "=== STEP 2 OVER ==="
		echo "Now chroot and follow the guide https://wiki.archlinux.org/title/Installation_guide#Configure_the_system"
		;;
	* )
		echo "Choose step1 or step2"
		;;
esac