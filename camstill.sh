#!/bin/bash
# take stills from the camer

FILENAME=test.jpg
WIDTH=640
HEIGHT=480
FRAMES=8
ENC=jpeg

while [[ $# -gt 0 ]]
do
   key="$1"
   case $key in
      -f|--filename)
      FILENAME="$2"
      shift 
      shift
      ;;
      -w|--width)
      WIDTH="$2"
      shift 
      shift
      ;;
      -h|--height)
      HEIGHT="$2"
      shift 
      shift
      ;;
      -e|--encoding)
      ENC="$2"
      shift 
      shift
      ;;
   esac
done

gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=$FRAMES ! video/x-raw,format=NV12,width=$WIDTH,height=$HEIGHT ! videoconvert ! ${ENC}enc ! multifilesink location=$FILENAME
gpicview $FILENAME
