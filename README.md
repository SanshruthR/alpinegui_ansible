# Fully Configured Alpine GUI with Ansible
[![Alpine](https://img.shields.io/badge/Alpine-Linux-0D597F?style=for-the-badge&logo=alpine-linux&logoColor=white)]() [![Ansible](https://img.shields.io/badge/Ansible-Automation-EE0000?style=for-the-badge&logo=ansible&logoColor=white)]() [![DockerHub](https://img.shields.io/badge/DockerHub-Image-2496ED?style=for-the-badge&logo=docker&logoColor=white)]() ![Ubuntu](https://img.shields.io/badge/Ubuntu-20.04-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
[![Build Status](https://img.shields.io/badge/Build-Passing-4CAF50?style=for-the-badge&logo=github&logoColor=white)]() [![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white)]() [![MIT License](https://img.shields.io/badge/License-MIT-FFEB3B?style=for-the-badge&logo=open-source-initiative&logoColor=303030)]()

![gui](https://github.com/user-attachments/assets/06ebe025-e152-4985-93ce-2f9726e929ab)





# Overview
This repository provides a fully configured Alpine GUI Docker image with Ansible and SSH, alongside an Ubuntu-based node image. The Alpine GUI is pre-configured for seamless communication with nodes, featuring Ansible automation and a fully operational terminal accessible on port 7681.

![tty](https://github.com/user-attachments/assets/edbab169-0e5c-4842-a184-7f8285c1b8ec)

## Features
- **Ansible Ready**: Includes a pre-configured inventory file and host settings.
- **Python & Dependencies**: Essential tools like `python3`, `pip`, `openssh`, and `sshpass` are pre-installed.
- **TTY Terminal**: Interactive terminal accessible at port `7681`.
- **SSH Integration**: Configured SSH server with disabled strict host key checking.
- **Multi-Node Support**: Separate node image based on Ubuntu for extended functionality.
- **Dockerized Setup**: Portable and ready-to-deploy Docker images.
## How It Works
1. **Pull the Image:**
   ```bash
   docker pull sanshruthr/alpinegui_ansible:latest
   ```
2. **Run the Container:**
   ```bash
   docker run -d \ 
     --name=alpinegui \ 
     -e PUID=1000 \ 
     -e PGID=1000 \ 
     -e TZ=Etc/UTC \ 
     -p 8080:3000 \ 
     -p 8081:3001 \ 
     -v /path/to/data:/config \ 
     --restart unless-stopped \ 
     sanshruthr/alpinegui_ansible:latest
   ```
## Node Example
For additional nodes, run the following command:
```bash
docker run -d \ 
  --name=node1 \ 
  -p 7681:7681 \ 
  sanshruthr/alpinegui_ansible:ubuntu_node
```
This sets up a node with SSH and TTY terminal running on port 7681.
## Deployment
Use this image to set up an Alpine-based GUI environment for Ansible and SSH tasks. The pre-configured setup saves time and ensures consistent results.

### Ports
- **Alpine GUI**: 3000, 3001, 22
- **Node**: 7681, 22

## License
This project is licensed under the MIT License. See the LICENSE file for details.
