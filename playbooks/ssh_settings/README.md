### Запуск плейбука #3
1. В файле vars/settings.yml устанавливаем параметры yes или no, log_level устанавливаем согласно документации Nginx
```commandline
  root_login: "no"
  password_authentication: "no"
  log_level: "VERBOSE"
  x11_forwarding: "no"
```
2. Запускаем ssh_settings.yml
```commandline
ansible-playbook ssh_settings/ssh_settings.yml
```