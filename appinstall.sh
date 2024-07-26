#!/bin/bash

case $1 in
	debian )
		wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
		sudo echo "deb https://download.sublimetext.com/ apt/stable/" >> /etc/apt/sources.list.d/sublime-text.list
		sudo apt update
		sudo apt install git sublime-text flatpak zsh
		;;
	arch )
		curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
		echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
		sudo pacman -Syu sublime-text flatpak zsh
		;;
	*)
		echo "Choose a base : arch or debian"
		;;
esac
flatpak install bitwarden vesktop
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/mb-zaba/dotfiles.git
cp ./dotfiles/zshrc ~/.zshrc
cp ./dotfiles/p10k.zsh ~/.p10k.zsh
