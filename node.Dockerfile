FROM ubuntu:22.04

# Install SSH server, Python, ttyd (for web terminal), and sudo
RUN apt-get update && \
    apt-get install -y openssh-server python3 sudo ttyd && \
    mkdir /run/sshd

# Create a user with sudo privileges
RUN useradd -rm -d /home/ansible -s /bin/bash -g root -G sudo -u 1000 ansible && \
    echo 'ansible:password' | chpasswd

# Configure SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose SSH and Web Terminal ports
EXPOSE 22 7681

# Command to start both SSH server and ttyd for web terminal
CMD service ssh start && ttyd bash