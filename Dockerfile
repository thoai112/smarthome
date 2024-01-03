# FROM ghcr.io/home-assistant/home-assistant:stable

# # # Copy local configuration files
# # COPY ./config /config

# # Set the time zone
# VOLUME /etc/localtime:/etc/localtime:ro

# # Run as privileged for device access
# # RUN setcap CAP_NET_RAW+eip /usr/sbin/tcpdump

# # Expose port 8123
# EXPOSE 8123

# # Start Home Assistant
# CMD ["/usr/bin/hass", "--config", "/config"]

# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 安装 Shellinabox
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置 root 用户的密码为 'root'
RUN echo 'root:frepai' | chpasswd

# 暴露 22 端口
EXPOSE 22

# 启动 Shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
