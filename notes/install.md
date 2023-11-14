# Install steps performed

1. Install fedora 39 server
2. `sudo dnf update -y`
3. `sudo dnf install sddm -y`
4. `sudo systemctl enable sddm`
5. `sudo systemctl set-default graphical.target`
6. `sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm` -- RPM FUSION
7. `sudo dnf install akmod-nvidia`
8. `sudo dnf install xorg-x11-drv-nvidia-cuda`
9. install brave-browser commands go here
10. install hyprland commands go here
 
