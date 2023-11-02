#~/bin/bash
# sudo yum update -y && sudo yum install cmake gcc perl zlib-devel libffi-devel openssl-devel -y 
# mkdir ~/install
# wget https://www.openssl.org/source/openssl-3.1.4.tar.gz -P ~/install
# tar -zxvf ~/install/openssl-3.1.4.tar.gz -C ~/install
# cd ~/install/openssl-3.1.4
# sudo ./Configure --prefix=/usr/local/ssl --openssldir=/usr/local/ssl --enable-shared
# sudo make && sudo make install
# echo "export PATH=/usr/local/ssl/bin:$PATH" >> ~/.bashrc
# echo "export LD_LIBRARY_PATH=/usr/local/ssl/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc

sudo yum update -y && sudo yum install cmake gcc perl zlib-devel libffi-devel openssl-devel git -y 
mkdir ~/install
wget https://www.python.org/ftp/python/3.11.6/Python-3.11.6.tgz -P ~/install
tar -zxvf ~/install/Python-3.11.6.tgz -C ~/install
cd ~/install/Python-3.11.6
sudo ./configure --prefix=/usr/local/python3.11 --enable-optimizations
sudo make && sudo make install
echo export PATH=/usr/local/python3.11/bin:$PATH >> ~/.bashrc
/usr/local/python3.11/bin/python3.11 -m pip install --upgrade pip
/usr/local/python3.11/bin/python3.11 -m pip install ansible
rm -r ~/install
exec bash

git clone https://github.com/Gaibbb/ansible_test.git
ansible-playbook -i ~/ansible_test/hosts ~/ansible_test/playbook.yml
