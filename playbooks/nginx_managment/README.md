### Запуск плейбука #5
1. В файле vars/nginxserver_prod.yml укажите необходимые параметры для раскатки на сервер nginx.conf.template
```commandline
  "servername": "localhost",
  "port": "80",
  "gzip": "on",
  "expires": "1h",
```
2. Запускаем nginx_managment.yml
```commandline
ansible-playbook nginx_managment/nginx_managment.yml
```