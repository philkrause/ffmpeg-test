 #!/bin/bash

if [[ -z playlist.txt ]]; then
        rm playlist.txt
fi

touch playlist.txt
playlist="playlist.txt"

# create/reset playlist file
echo "#ffmpeg playlist" > ${playlist}

# this video goes in between two video files
use_filler="false" # activate filler with "true". Use "false" or any other string to deactivate filler.
filler="filler.mp4"

# create playlist for ffmpeg from all videos in the current directory
for f in *.mp4;do

# exclude filler from playlist
  if [ "${f}" != "${filler}" ]; then

    echo "file '${f}'" >> ${playlist}

    # if activated add filler after every video file
    if [[ "${use_filler}" = "true" ]]; then  # This condition is false for anything but the literal string "true".

        echo "file '${filler}'" >> ${playlist}
    fi
  fi
done

#ffmpeg -re -i outputtest -f flv -c:v libx264 -preset veryfast -keyint_min 30 -tune zerolatency -threads 0 -b:v 6000k -minrate 6000k -maxrate 6000k -bufsize 6000k -g 60 -pix_fmt yuv420p rtmp://ord03.contribute.live-video.net/app/$KEY


#ffmpeg -re -f concat -safe 0 -stream_loop -1 -i "${playlist}" -vf "scale=960:720" -flvflags no_duration_filesize -c:v libx264 -x264opts 'keyint=30:min-keyint=30:no-scenecut' -preset veryfast -b:v 6000k -maxrate 6000k -bufsize 6000k -pix_fmt yuv420p -g 50 -c:a aac -b:a 160k -ac 2 -ar 44100 rtmp://ord03.contribute.live-video.net/app/$KEY

#ffmpeg \
#-i video.mp4 \
#-i watermark.png \
#-filter_complex " \
#  [0]crop = \
#    w = in_w-2*150 : \
#    h = in_h \
#    [a] ;
#  [a]pad = \
#    width = 980 : \
#    height = 980 : \
#    x = 0 :
#    y = 0 :
#    color = black
#    [b] ;
#  [b]subtitles =
#    filename = subtitles.ass
#    [c] ;
#  [c][1]overlay = \
#    x = 0 :
#    y = 0
#  " \


#ffmpeg -i -filter_complex \
#"[0:v]fps=30,format=yuv420p,setpts=PTS-STARTPTS[v0];[0:a]aformat=sample_rates=44100:channel_layouts=stereo,asetpts=PTS-STARTPTS[a0];" -f flv -v: -vsync 0 -c:v libx264 -preset veryfast -keyint_min 30 -tune zerolatency -threads 0 -b:v 6000k -minrate 6000k -maxrate 6000k -bufsize 6000k -g 60 -pix_fmt yuv420p rtmp://ord03.contribute.live-video.net/app/$KEY
#| ffmpeg -re -i outputtest -f flv -c:v libx264 -preset veryfast -keyint_min 30 -tune zerolatency -threads 0 -b:v 6000k -minrate 6000k -maxrate 6000k -bufsize 6000k -g 60 -pix_fmt yuv420p rtmp://ord03.contribute.live-video.net/app/$KEY


#ffmpeg -re -i TAS_SNES_Teenage_Mutant_Ninja_Turtles_IV_-_Turtles_in_Time_by_nitsuja_in_18_55.0.mp4 -i TAS_SNES_Disney_s_Aladdin_all_gems_by_Jaysmad_in_16_13.62.mp4 -filter_complex \
#"[0:v]fps=30,format=yuv420p,setpts=PTS-STARTPTS[v0];[0:a]aformat=sample_rates=44100:channel_layouts=stereo,asetpts=PTS-STARTPTS[a0];[1:v]fps=30,format=yuv420p,setpts=PTS-STARTPTS[v1];[1:a]aformat=sample_rates=44100:channel_layouts=stereo,asetpts=PTS-STARTPTS[a1];[v0][a0][v1][a1]concat=n=2:v=1:a=1[outv][outa]" -f flv -map "[outv]" -map "[outa]" newtest1.mp4


ffmpeg -re -i TAS_SNES_Disney_s_Aladdin_all_gems_by_Jaysmad_in_16_13.62.mp4 -c:v libx264 -r 30 -c:a aac -b:a 160k -ac 2 -ar 44100 TAS_SNES_Disney_s_Aladdin_by_Jaysmad_RE.mp4

#ffmpeg -re -i newtest1.mp4 -filter:v fps=30 r-f flv -c:v libx264 -preset veryfast -keyint_min 30 -tune zerolatency -threads 0 -b:v 6000k -minrate 6000k -maxrate 6000k -bufsize 6000k -g 60 -pix_fmt yuv420p tmp://ord03.contribute.live-video.net/app/$KEY


#ffmpeg -re -i TAS_SNES_Teenage_Mutant_Ninja_Turtles_IV_-_Turtles_in_Time_by_nitsuja_in_18_55.0.mp4 -i TAS_SNES_Disney_s_Aladdin_all_gems_by_Jaysmad_in_16_13.62.mp4 -filter_complex \
#"[0:v]fps=30,format=yuv420p,setpts=PTS-STARTPTS[v0];[0:a]aformat=sample_rates=44100:channel_layouts=stereo,asetpts=PTS-STARTPTS[a0];[1:v]fps=30,format=yuv420p,setpts=PTS-STARTPTS[v1];[1:a]aformat=sample_rates=44100:channel_layouts=stereo,asetpts=PTS-STARTPTS[a1];[v0][a0][v1][a1]concat=n=2:v=1:a=1[videos]" -map "[videos]" -f flv -keyint_min 30 -c:v libx264 outputtest


#ffmpeg -re -i TAS_SNES_Disney_s_Aladdin_all_gems_by_Jaysmad_in_16_13.62.mp4 -i TAS_SNES_Teenage_Mutant_Ninja_Turtles_IV_-_Turtles_in_Time_by_nitsuja_in_18_55.0.mp4 -filter_complex \
#"[0:v]fps=30,format=yuv420p,setpts=PTS-STARTPTS[v0];[0:a]aformat=sample_rates=44100:channel_layouts=stereo,asetpts=PTS-STARTPTS[a0];[1:v]fps=30,format=yuv420p,setpts=PTS-STARTPTS[v1];[1:a]aformat=sample_rates=44100:channel_layouts=stereo,asetpts=PTS-STARTPTS[a1];[v0][a0][v1][a1]concat=n=2:v=1:a=1[videos]" -map "[videos]" Testing11.mp4 \
#| ffmpeg -re -i Testing11.mp4 -filter:v fps=30 r-f flv -c:v libx264 -preset veryfast -keyint_min 30 -tune zerolatency -threads 0 -b:v 6000k -minrate 6000k -maxrate 6000k -bufsize 6000k -g 60 -pix_fmt yuv420p tmp://ord03.contribute.live-video.net/app/$KEY

#ffmpeg -i testing.mp4 -r 30 -c:v libx264 -preset veryfast -keyint_min 30 -tune zerolatency -threads 0 -b:v 6000k -minrate 6000k -maxrate 6000k -bufsize 6000k -g 50 -pix_fmt yuv420p -c:a aac -b:a 160k -ac 2 -ar 44100 -f flv rtmp://ord03.contribute.live-video.net/app/$KEY

#ffmpeg -safe 0 -f concat -stream_loop -1 -i "${playlist}" -filter_complex \
#"[0:v]fps=30,format=yuv420p,setpts=PTS-STARTPTS[v0];[0:a]aformat=sample_rates=44100:channel_layouts=stereo,asetpts=PTS-STARTPTS[a0];[1:v]fps=30,format=yuv420p,setpts=PTS-STARTPTS[v1];[1:a]aformat=sample_rates=44100:channel_layouts=stereo,asetpts=PTS-STARTPTS[a1];[v0][a0][v1][a1]concat=n=2:v=1:a=1" \
#-f flv -vcodec libx264 -profile:v main -g 60 -keyint_min 30 -b:v 4500k -minrate 4500k -maxrate 4500k -pix_fmt yuv420p -preset ultrafast -tune zerolatency -threads 0 -bufsize 4500k -map_metadata -0 -metadata:s:v:0 title="My Titleeee" rtmp://ord03.contribute.live-video.net/app/$KEY

