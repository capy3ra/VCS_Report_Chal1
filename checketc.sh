#!/bin/sh

createFile(){
	touch $1;
}

checkNewFile(){
	old=$1
	current=$2
	while read -r line
	do
		check=$(sudo grep -w $line -m 1 $old)
		if [ ! $check ]
		then
			echo $line
			head -n 10 $line
			echo '\n'
		fi
	done < $current
}

checkDeleteFile(){
	old=$1
	current=$2
	while read -r line
	do
		check=$(sudo grep -w $line -m 1 $current)
		if [ !$check ]
		then 
			echo $line
		fi
	done < $old
}


echo "[Log checketc - `date`]" 


listOldFiles='/home/manhcuong/Documents/VCS/Report/Chal1/listFiles/old_files.txt'
listCurrentFiles='/home/manhcuong/Documents/VCS/Report/Chal1/listFiles/current_files.txt'
listCheckFiles='/home/manhcuong/Documents/VCS/Report/Chal1/listFiles/new_files.txt'

createFile $listCheckFiles
createFile $listOldFiles
createFile $listCurrentFiles

sudo find /etc -type f > $listCurrentFiles
sudo find /etc -type f -cmin -30 > $listCheckFiles

echo "\n=====Danh Sach file moi tao============" 
checkNewFile $listOldFiles $listCheckFiles

echo "\n=====Danh sach file moi chinh sua ============"
sudo find /etc -mmin -30 

echo "\n==========Danh sach file bi xoa========" 
checkDeleteFile $listOldFiles $listCurrentFiles 
cat $listCurrentFiles > $listOldFiles