FROM ubuntu:24.04

WORKDIR /app



RUN apt-get update && apt-get install -y \
curl \
ca-certificates \
unzip \
sudo \
&& rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin

# Create a new user and add to sudo group
RUN useradd -m -s /bin/bash developer && \
    usermod -aG sudo developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo "developer:123" | chpasswd

# Switch to the new user
USER developer
WORKDIR /home/developer

COPY --chown=developer:developer scripts /home/developer/scripts
COPY --chown=developer:developer Justfile /home/developer/Justfile

CMD ["/bin/bash"]
