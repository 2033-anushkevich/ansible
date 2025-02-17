# ansible
Тестовое задание (cервер статики)

### Установка
1. Клонируем репозиторий
```commandline
git clone https://github.com/2033-anushkevich/ansible.git
```
2. Для проверки ТЗ и доступности ssh, сгенерируйте rsa-ключ и переместите его в папку с репозиторием "id_rsa.pub"
```commandline
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
cp ~/.ssh/id_rsa.pub ansible/
```
3. Если на сервере не установлен Ansible и Docker выполните скрипт по установке или пропустите этот шаг
**Примечание**: Версия Ansible 2.17.8; Docker 27.5.1; Docker Compose v2.32.4
```commandline
cd ansible && chmod +x install_script.sh
bash ./install_script.sh
```
4. Если этот шаг пропустили обязательно установите модуль Ansible "passlib", а так же укажите свой domain.name.ru в файле /etc/hosts
```commandline
echo "127.0.0.1 betsoft1.online" >> /etc/hosts
```
5. Запустите контейнер с помощью docker compose
```commandline
cd ansible && docker compose up -d
```
6. Проверьте подключение по ssh
```commandline
ssh betsoft1.online -p 2222
```
