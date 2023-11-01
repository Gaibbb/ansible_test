#~/bin/bash
sudo yum update -y && sudo yum install cmake gcc perl -y 
mkdir ~/install
wget https://www.openssl.org/source/openssl-3.1.4.tar.gz -P ~/install
tar -zxvf ~/install/openssl-3.1.4.tar.gz -C ~/install
cd ~/install/openssl-3.1.4
sudo ./Configure --prefix=/usr/local/ssl --openssldir=/usr/local/ssl
sudo make && sudo make install
echo "export PATH=/usr/local/ssl/bin:$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/ssl/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
source ~/.bashrc

wget https://www.python.org/ftp/python/3.11.6/Python-3.11.6.tgz -P ~/install
tar -zxvf ~/install/Python-3.11.6.tgz -C ~/install
cd ~/install/Python-3.11.6
~/install/Python-3.11.6/configure --prefix=/usr/local/python3.11
sudo make && sudo make install
echo "export PATH=/usr/local/python3.11/bin:$PATH" >> ~/.bashrc
~/python3.11/bin/python3.11 -m pip install --upgrade pip
~/python3.11/bin/python3.11 -m pip install ansible

wget https://github.com/Gaibbb/ansible_test/blob/main/playbook.yml -P ~
ansible-playbook all ~/playbook.yml
