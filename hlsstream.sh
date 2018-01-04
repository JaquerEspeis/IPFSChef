#!/bin/bash

# Optional variables
CURL=$(which curl)
FFMPEG=$(which ffmpeg)

if [ ! -e "big_buck_bunny_1080p_stereo.ogg" ]
then
	curl https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_1080p_stereo.ogg -o big_buck_bunny_1080p_h264.ogg
fi

$FFMPEG -v info -re -i big_buck_bunny_1080p_stereo.ogg -map 0 -codec:v libx264 -framerate 30\
	-codec:a aac -b:a 64k -strict -2 -ar 48000 \
	-f segment \
	-segment_list_type m3u8 \
	-segment_time 10 \
	-segment_list_flags live \
	-segment_list_size 0 \
	-segment_list stream/oldstyle.m3u8 \
	-segment_format mpegts stream/%03d.ts

