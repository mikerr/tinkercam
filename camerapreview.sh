#!/bin/sh
gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw,format=NV12,width=640,height=480 ! videoconvert ! autovideosink
