# M3u8Downloader_H-Docker
### 简介
 - 此项目会随着m3u8downloader_h的升级同步升级
### 遇到的问题
 1. 程序的设置可能无法映射,因为程序在创建的时候是没有那个设置文件的 等待主程序升级在说这个比较简单
 2. 现在镜像功能其实完备的唯一的就是右键菜单无法响应 可能跟镜像太过于精简有关系
 

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
           -v /配置文件:/app/Settings.dat \
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
