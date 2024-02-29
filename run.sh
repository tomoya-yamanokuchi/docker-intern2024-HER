#! /bin/bash

# rm:         コンテナ終了時に自動的にコンテナを削除
# it:         -i + -t: 標準入力とTerminalをAttachする
# gpus:       all, または 0, 1, 2
# privileged: ホストと同じレベルでのアクセス許可
# net=host:   ホストとネットワーク名前空間を共有
# ipc=host:   ホストとメモリ共有

# -e DISPLAY=unix$DISPLAY \

docker run --rm -it --gpus all --privileged --net=host --ipc=host \
-e LOCAL_UID=$(id -u $USER) \
-e LOCAL_GID=$(id -g $USER) \
-e DISPLAY=$DISPLAY \
-e AUDIODEV="hw:Device, 0" \
-e XAUTHORITY=/home/$(id -un)/.Xauthority \
-v $HOME/.Xauthority:/home/$(id -un)/.Xauthority \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /dev/snd:/dev/snd \
-v /nfs:/nfs \
docker_intern2024_her bash
