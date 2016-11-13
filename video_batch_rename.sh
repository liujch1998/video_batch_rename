# Copyright © 2016 Liu Jiacheng. All Rights Reserved. 
# This script renames videos of TV episodes in large scale. 
# Precondition: put script with videos in the same folder. Make sure video 
# 	format is supported by this script. Make sure irrelevant videos are 
# 	removed from this folder. 
# Postcondition: all videos with supported format in this folder is renamed 
# 	to "new_name+episode+.suffix"
# Invoke Format: sh video_batch_rename.sh position_of_episode new_name
# Note: 
# 	Each Chinese character should be counted ONLY ONCE. 
# 	The episode number should be of TWO digits. 
# 	Please back up before running this script. We are NOT responsible for 
# 		any data loss. 

#! /bin/sh

suffix=(.mp4 .rmvb .mkv)
for s in ${suffix[*]}
do
	for file in `ls *$s`
	do
		name=${file}
		pos=$1
		episode=${name:pos:2}
		newName=$2$episode$s
		mv $name $newName
		echo Renamed $name to $newName
	done
done

