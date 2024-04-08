#!/bin/bash
# Debian package install

# Debian Packages
PACKAGELIST="./packagelist.txt"
if [ $(read -p "Enter distribution: ") = 'Deb' ]; then
	IFS=$'\n'
	set -f
	for i in $(cat <"$PACKAGELIST"); do
		apt-get install $i
	done
fi
#
# Neovim appimage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim
# Starship
curl -sS https://starship.rs/install.sh | sh
# Eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
