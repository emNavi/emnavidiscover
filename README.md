# emNavi Discover exec

构建docker镜像
```bash
sudo docker build -t emnavidiscover-exec:v0.1 .
```

运行
```bash
xhost + 
sudo docker run -it --privileged --env=LOCAL_USER_ID="$(id -u)" -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$DISPLAY --network host --cap-add=NET_BROADCAST --rm emnavidiscover-exec:v0.2 bash -c "GDK_DISABLE_SHM=1 emnavidiscover"
```


添加到bashrc
```bash
alias emnavidiscover="sudo docker run -it --privileged --env=LOCAL_USER_ID=\"\$(id -u)\" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=\$DISPLAY \
    --network host --cap-add=NET_BROADCAST --rm \
    emnavidiscover-exec:v0.1 bash -c \"GDK_DISABLE_SHM=1 emnavidiscover\""
```
