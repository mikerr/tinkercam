#!/bin/sh
gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=8 ! video/x-raw,format=NV12,width=640,height=480 ! videoconvert ! jpegenc ! multifilesink location=test.jpg
gpicview test.jpg
