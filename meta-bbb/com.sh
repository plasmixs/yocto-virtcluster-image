git clone git://git.linaro.org/qemu/qemu-linaro.git
cd qemu-linaro
sudo apt-get install zlib1g-dev
sudo apt-get install libglib2.0-dev
./configure --prefix=/Work/Contents/arm-qemu
make
sudo make install

#Run command
#./bin/qemu-system-arm -M beaglexm -sd /tmp/bbb.img -serial stdio -clock unix