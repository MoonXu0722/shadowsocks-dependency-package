#/bin/sh
sudo apt install libc-ares-dev libev-dev libpcre3 libpcre3-dev libmbedtls-dev build-essential
#git clone https://github.com/MoonXu0722/shadowsocks-dependency-package.git
cd shadowsocks-dependency-package
tar xvf libsodium-1.0.18-stable.tar.gz
cd libsodium-stable 
./configure
make
sudo make install
cd ..
tar xvf shadowsocks-libev-3.3.5.tar.gz
cd shadowsocks-libev-3.3.5
./configure --disable-documentation
make
sudo make install
mkdir /etc/shadowsocks
cp multi_config.json /etc/shadowsocks
cp ssmanager.service /etc/systemd/system/

#sudo passwd root 1 1
systemctl enable ssmanager
systemctl start ssmanager
