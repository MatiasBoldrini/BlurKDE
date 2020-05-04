#!/bin/bash
echo " Bienvenido a mi instalador de KDE!"
sleep 1
echo "El instalador esta hecho especificamente para arch , ubuntu y derivados"
echo "Si estas usando Fedora u otra distro , Puedes Cancelar el instalador ahora , o intentar instalarlo (Solo para Fedora)"
  sleep 5
  YUM_CMD=$(which dnf)
  APT_GET_CMD=$(which apt-get)
  PACMAN_CMD=$(which pacman)
 if [[ ! -z $YUM_CMD ]]; then
 echo"NO se si necesitas todas estas dependencias , El script esta hecho principalmente para arch y ubuntu."
    sudo dnf install t5-style-kvantum qt5-style-kvantum-themes latte-dock zsh curl
    sudo dnf install git g++ extra-cmake-modules cmake gettext libkf5config-dev libkdecorations2-dev libqt5x11extras5-dev qtdeclarative5-dev libkf5guiaddons-dev libkf5configwidgets-dev libkf5windowsystem-dev libkf5coreaddons-dev libfftw3-dev
    sudo dnf install kdecoration qt5-declarative qt5-x11extras kcoreaddons kguiaddons kconfigwidgets kwindowsystem fftw cmake extra-cmake-modules
 sudo dnf install cmake extra-cmake-modules kf5-kconfig-devel
   sudo dnf install   kf5-kcoreaddons-devel kf5-kwindowsystem-devel kwin-devel 
   sudo dnf install   qt5-qtbase-devel

 elif [[ ! -z $APT_GET_CMD ]]; then
sudo apt -y install software-properties-common
 	sudo add-apt-repository -y  ppa:papirus/papirus
sudo apt -y install cmake extra-cmake-modules kwin-dev 
   sudo apt -y install libkf5config-dev libkf5configwidgets-dev libkf5coreaddons-dev 
  sudo apt -y install libkf5windowsystem-dev qtbase5-dev
    sudo apt -y install qt5-style-kvantum qt5-style-kvantum-themes latte-dock zsh curl 
    sudo apt -y install git g++ extra-cmake-modules cmake gettext libkf5config-dev libkdecorations2-dev libqt5x11extras5-dev qtdeclarative5-dev libkf5guiaddons-dev libkf5configwidgets-dev libkf5windowsystem-dev libkf5coreaddons-dev libfftw3-dev
 #Instalacion de Conky [BETA]
 echo "Instalando Conky"
 sudo apt -y install conky
sudo apt -y install conky-all
sudo apt -y install conky-themes
sudo dpkg -i realpath_8.26-3ubuntu4_all.deb conky-manager-v2.4-amd64.deb
sudo apt -f install
####INstalacion de conky
wget http://launchpadlibrarian.net/340091846/realpath_8.26-3ubuntu4_all.deb ; https://github.com/teejee2008/conky-manager/releases/download/v2.4/conky-manager-v2.4-amd64.deb
 elif [[ ! -z $PACMAN_CMD ]]; then
    sudo pacman -S kdecoration qt5-declarative qt5-x11extras kcoreaddons kguiaddons kconfigwidgets kwindowsystem fftw cmake extra-cmake-modules
sudo pacman -S cmake extra-cmake-modules kwin

    sudo pacman -S qt5-style-kvantum qt5-style-kvantum-themes latte-dock zsh curl
 else
    echo "Si estas viendo esto, es porque las dependencias q necesitas no estan en los repos"
   
 fi
 #instalar Wallpaper y fuentes


 cd
 git clone https://github.com/Akava-Design/Akava-Colors
 #cd Akava-Colors
 cp $HOME/Akava-Colors/Akava.colors ~/.local/share/color-schemes/ 
 cd
 git clone https://github.com/Akava-Design/Akava-Kv
 #cd Akava-Kv
 cp -r $HOME/Akava-Kv/Akava-Kv ~/.config/Kvantum/ 
 cd
 git clone https://github.com/Akava-Design/Akava-Konsole
 #cd Akava-Konsole
 cp $HOME/Akava-Konsole/Akava.colorscheme ~/.local/share/konsole
echo " Instalando y compilando Yet another magic lamp"
cd
git clone https://github.com/zzag/kwin-effects-yet-another-magic-lamp.git
cd kwin-effects-yet-another-magic-lamp
mkdir build && cd build
cmake .. 
    -DCMAKE_BUILD_TYPE=Release 
    -DCMAKE_INSTALL_PREFIX=/usr
make
sudo make install
cd
 git clone https://github.com/alex47/BreezeBlurred
cd BreezeBlurred
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
sudo make install
echo "#############################################"
echo "Finalizado , presiona Ctrl + c para continuar "
echo "#############################################"
latte-dock
kwin_x11 --replace &
sudo pkill -KILL -u $USER
