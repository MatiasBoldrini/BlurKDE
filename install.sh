#!/bin/bash
echo " Bienvenido a mi instalador de KDE!"
sleep 1
echo "El instalador esta hecho especificamente para arch , ubuntu y derivados"
echo "Si estas usando Fedora u otra distro , Puedes Cancelar el instalador ahora , o intentar instalarlo (Solo para Fedora)"
  sleep 5
  YUM_CMD=$(which yum)
  APT_GET_CMD=$(which apt-get)
  PACMAN_CMD=$(which pacman)
 if [[ ! -z $YUM_CMD ]]; then
 echo"NO se si necesitas todas estas dependencias , El script esta hecho principalmente para arch y ubuntu."
    sudo dnf install t5-style-kvantum qt5-style-kvantum-themes latte-dock zsh curl
    sudo dnf install git g++ extra-cmake-modules cmake gettext libkf5config-dev libkdecorations2-dev libqt5x11extras5-dev qtdeclarative5-dev libkf5guiaddons-dev libkf5configwidgets-dev libkf5windowsystem-dev libkf5coreaddons-dev libfftw3-dev
    sudo dnf install kdecoration qt5-declarative qt5-x11extras kcoreaddons kguiaddons kconfigwidgets kwindowsystem fftw cmake extra-cmake-modules
 elif [[ ! -z $APT_GET_CMD ]]; then
sudo apt -y install software-properties-common
 	sudo add-apt-repository -y  ppa:papirus/papirus

    sudo apt -y install qt5-style-kvantum qt5-style-kvantum-themes latte-dock zsh curl 
    sudo apt -y install git g++ extra-cmake-modules cmake gettext libkf5config-dev libkdecorations2-dev libqt5x11extras5-dev qtdeclarative5-dev libkf5guiaddons-dev libkf5configwidgets-dev libkf5windowsystem-dev libkf5coreaddons-dev libfftw3-dev

 elif [[ ! -z $PACMAN_CMD ]]; then
    sudo pacman -S kdecoration qt5-declarative qt5-x11extras kcoreaddons kguiaddons kconfigwidgets kwindowsystem fftw cmake extra-cmake-modules

    sudo pacman -S qt5-style-kvantum qt5-style-kvantum-themes latte-dock zsh curl
 else
    echo "error : We couldnt install some package's from source , maybe you should build them from source .."
   
 fi
 #instalar Wallpaper y fuentes

 #instalar Akava tema
 git clone https://github.com/Akava-Design/Akava-Colors
 cd Akava-Colors
 cp Akava.colors ~/.local/share/color-schemes/ 
 git clone https://github.com/Akava-Design/Akava-Kv
 cd Akava-Kv
 cp -r Akava-Kv ~/.config/Kvantum/ 
 git clone https://github.com/Akava-Design/Akava-Konsole
 cd Akava-Konsole
 cp Akava.colorscheme ~/.local/share/konsole
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
