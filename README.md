# ansible
Тестовое задание (cервер статики)

Клонируем репозиторий
git clone https://github.com/2033-anushkevich/ansible.git

Для проверки ТЗ и доступности ssh, сгенерируйте rsa-ключ и переместите его в папку с репозиторием "id_rsa.pub"
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
cp ~/.ssh/id_rsa.pub ansible/

Если на сервере не установлен Ansible и Docker выполните скрипт по установке или пропустите этот шаг
Версия Ansible 2.17.8; Docker 27.5.1; Docker Compose v2.32.4
cd ansible && chmod +x install_script.sh
bash ./install_script.sh

Если этот шаг пропустили обязательно установите модуль Ansible "passlib", а так же укажите свой domain.name.ru в файле /etc/hosts
echo "127.0.0.1 betsoft1.online" >> /etc/hosts

Запустите контейнер с помощью docker compose
cd ansible && docker compose up -d

Проверьте подключение по ssh
ssh betsoft1.online -p 2222
