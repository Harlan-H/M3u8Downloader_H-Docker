# M3u8Downloader_H-Docker
### 简介
 - 此项目会随着m3u8downloader_h的升级同步升级

### 遇到的问题
 - 设置的配置文件无法映射 等待程序更新

### docker命令行设置：

1. 下载镜像

    |镜像源|命令|
    |:-|:-|
    |DockerHub|docker pull harlanx/m3u8downloader_h:latest|
    |GitHub|docker pull ghcr.io/harlan-h/m3u8downloader_h:latest|

2. 创建m3u8downloader_h容器

        docker create \
           --name=m3u8downloader_h \
           -p 5800:5800 \
           -p 65432:65432 \
           -v /缓存目录位置:/app/Caches \
           -v /下载位置:/app/download \
           --restart unless-stopped \
           harlanx/m3u8downloader_h:latest

3. 运行

       docker start m3u8downloader_h

4. 停止

       docker stop m3u8downloader_h

5. 删除容器

       docker rm m3u8downloader_h

6. 删除镜像

       docker image rm harlanx/m3u8downloader_h:latest


### docker compose操作
1. 项目目录中m3udownloader_h.yml就是

2. 启动

       docker compose -f m3udownloader_h.yml up -d


3. 停止

       docker compose -f m3udownloader_h.yml stop

4. 重启

       docker compose -f m3udownloader_h.yml restart

5. 删除

       docker compose -f m3udownloader_h.yml down

