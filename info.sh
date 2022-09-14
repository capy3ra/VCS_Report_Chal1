#!/bin/sh

echo "[Thong tin he thong]"
echo "\nTen may:"
whoami
echo "\nPhien ban he dieu hanh:"
lsb_release -a
echo "\nThong tin  CPU:"
lscpu | head
arch
echo "\nBo nho RAM: "
free -m
echo "\nO dia"
df -m
echo "\nDanh sach dia chi IP cua he thong:"
echo "Dia chi IP public: "
curl ifconfig.me
echo "/Dia chi IP private: "
hostname -i | awk '{print $1}'
echo "\nDanh sach user tren he thong: "
awk -F: '{print $1}' /etc/passwd | sort
echo "\nThong tin cac tien trinh dang chay voi quyen root:"
ps -U root -u root | sort
echo "\nThong tin cac cong dang mo:"
lsof -i -P -n | grep LISTEN | sort -k 6
echo "\nDanh sach cac thu muc tren he thong cho phep other co quyen ghi:"
find -perm -o=r
echo "\nDanh sach cac goi phan mem (ten goi, phien ban) duoc cai tren he thong:"
apt list --installed
