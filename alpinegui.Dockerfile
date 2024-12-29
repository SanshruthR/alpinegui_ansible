FROM lscr.io/linuxserver/webtop:latest

ENV PUID=1000
ENV PGID=1000
ENV TZ=Etc/UTC

RUN apk update && \
    apk add python3 py3-pip openssh ansible sshpass

WORKDIR /ansible-docker-test

# Create ansible directory and config files with strict host key checking disabled
RUN mkdir -p /etc/ansible && \
    echo -e "[all]\nnode1 ansible_host=172.17.0.3 ansible_user=ansible ansible_password=password ansible_ssh_common_args='-o StrictHostKeyChecking=no'" > /etc/ansible/hosts && \
    echo -e "[defaults]\ninventory = /etc/ansible/hosts\nhost_key_checking = False\nforce_color = True" > /etc/ansible/ansible.cfg && \
    chmod 644 /etc/ansible/hosts && \
    chmod 644 /etc/ansible/ansible.cfg && \
    mkdir -p docker && \
    touch docker/Dockerfile

# Generate SSH host keys and start sshd
RUN ssh-keygen -A && \
    mkdir -p /run/sshd

# Add SSH startup to the entrypoint
COPY --chmod=755 <<'EOF' /etc/cont-init.d/50-sshd
#!/usr/bin/with-contenv bash
/usr/sbin/sshd
EOF

EXPOSE 3000 3001 22

VOLUME /config

ENTRYPOINT ["/init"]