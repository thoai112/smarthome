FROM ghcr.io/home-assistant/home-assistant:stable

# # Copy local configuration files
# COPY ./config /config

# Set the time zone
VOLUME /etc/localtime:/etc/localtime:ro

# Run as privileged for device access
RUN setcap CAP_NET_RAW+eip /usr/sbin/tcpdump

# Expose port 8123
EXPOSE 8123

# Start Home Assistant
CMD ["/usr/bin/hass", "--config", "/config"]