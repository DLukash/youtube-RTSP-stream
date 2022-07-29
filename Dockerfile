FROM python:3.9.13-slim

RUN apt-get update

RUN apt-get -y install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
RUN apt-get -y install libglib2.0-dev libgstrtspserver-1.0-dev gstreamer1.0-rtsp libgirepository1.0-dev 
RUN apt -y install libcairo2-dev

#gstreamer1.0-doc

WORKDIR /rtsp-stream

COPY . .
RUN python3 -m pip install --upgrade pip
RUN pip install -r requirements.txt

ENTRYPOINT python stream.py --video_url ${VIDEO_URL} --fps ${FPS} --image_width ${IMAGE_WIDTH} --image_height ${IMAGE_HEIGHT} --port ${RTSP_PORT} --stream_uri ${RTSP_PORT_STREAM_URI}



