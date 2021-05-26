# author 	kiraskyler
# data		20150525
# connect 	kiraskyler@163.com
# version 	V0.0.2.20210525
# describe  template for bash 

# how to use
# ./git.sh or ./git.sh ./		input path or select local path to do

#################### environment ####################
#!/bin/bash

#################### code ###########################
word_path=""

dir_is_emputy()
{ 
	# echo -n " $1   "
	# echo " `ls $1 | wc -w` "
	return `ls -A $1 | wc -w`
}

get_dir()
{
	if [ `echo $1 | wc -w` == 0 ]
	then
		work_path=`pwd`
	else
		if [ -d $1 ]
		then 
			work_path=$1
		else
			echo "input dir path erro!"
			exit -1
		fi
	fi
}

echo_print_newline()
{
for ((i=0;i<$1;i++))
do
	echo -n -e "\t"
done
}

dir_touch_file()
{
	# echo
	for path in `ls $1`
	do
		if [ -d $1/$path ]							# path is dir
		then
			# echo -n -e "\t" 
			if dir_is_emputy $1/$path == 0
			then
				cp -f ./.gitkeep $1/$path/.gitkeep 2> /dev/null || true
				echo_print_newline $2
				echo -e "[v] $path "
			else
				echo_print_newline $2
				echo -e "[x] $path "
			fi
			dir_touch_file $1/$path $2+1
		fi
	done
}

# get dir path form command
get_dir $1

# loop dirs touch file

cp ./.gitignore $work_path/.gitignore 2> /dev/null || true
dir_touch_file $work_path 0

# end