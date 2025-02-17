#!/bin/bash

echo ""
echo "****                      ADD HOSTS                       ****-"
echo ""
read -p "  Enter DOMAIN name(ex.betsoft1.online): " DM_NAME
echo "127.0.0.1 $DM_NAME" >> /etc/hosts

echo ""
echo "****                      INSTALL ANSIBLE                    ****"
echo ""
# Обновляем список пакетов
apt-get update -y
#Установка pip
apt install python3-pip
# Устанавливаем Ansible
pip install --upgrade ansible
pip3 install passlib


echo ""
echo "****                      INSTALL DOCKER                    ****"
echo ""
# Устанавливаем Docker и Docker Compose

# Установка необходимых пакетов
apt-get install ca-certificates curl gnupg -y
# Создание директории для ключей и установка ключа Docker
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.asc -y
# Добавление репозитория Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Обновляем список пакетов после добавления репозитория
apt-get update -y
# Установка Docker и Docker Compose
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
# Добавление пользователя в группу docker (для избежания необходимости использования sudo)
sudo usermod -aG docker $USER
# Не забудьте выйти из системы и зайти снова или перезагрузить компьютер, чтобы изменения вступили в силу

echo ""
echo "****                      COMPLETING THE INSTALLATION                   ****"
echo ""
# Проверка установки
echo "Ansible version: $(ansible --version | head -n 1)"
echo "Docker version: $(docker version | grep Server)"
echo "Docker Compose version: $(docker compose version)"


exit 0
