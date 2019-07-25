#!/bin/bash

echo "kullanıcı adı giriniz :"
read kadi
ids=`cat /etc/passwd | cut -d: -f3 | uniq  | sort -n | tail -2 | head -1`
echo $ids
echo "id giriniz :(önerilen id : $((ids+1)) siteme bundan daha küçük id girmek sakıncalıdır. "
read id

sudo mkdir /home/$kadi
sudo echo "$kadi:x:$id:$id:$kadi:/home/$kadi:/bin/bash" | sudo tee -a /etc/passwd
sudo echo "$kadi:x:$id:" | sudo tee -a /etc/group
sudo passwd $kadi
sudo echo "$kadi:!::" | sudo tee -a /etc/gshadow

