# author 	kiraskyler
# data		20150526
# connect 	kiraskyler@163.com
# version 	V0.0.2.20210526
# describe  for install astyle, support in linux
# refer 	http://astyle.sourceforge.net/install.html#_Linux_Version

#################### environment ####################
#!/bin/bash

#################### code ###########################


# make sure environment
if [ `which cmake | wc -w` == 0 ] || [ ! -f ./AStyle/CMakeLists.txt ]
then
	echo "environment erro, check cmake and ./AStyle/CMakeLists.txt"
	echo "ubuntu: sudo apt install cmake"
	echo "centos: sudo yum install cmake"
	exit -1
fi

# do
cd AStyle
cmake ./
make
sudo cp astyle /usr/bin

# congratulation
if [ `which cmake | wc -w` != 0 ]
then
	echo
	echo "install done, congratulation!"
	astyle -V
fi
