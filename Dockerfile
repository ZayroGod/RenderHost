FROM ubuntu:20.04

# Avoid interaction during install
ENV DEBIAN_FRONTEND=noninteractive

# Install shellinabox
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set root password to 'root' (Change this later for safety!)
RUN echo 'root:root' | chpasswd

# Render uses port 10000. We tell shellinabox to use it too.
EXPOSE 10000

# Start shellinabox on port 10000, disable SSL (-t), and allow root login
CMD ["/usr/bin/shellinaboxd", "-t", "-p", "10000", "-s", "/:LOGIN"]
