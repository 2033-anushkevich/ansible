### Запуск плейбука #4
1. В файле vars/packages.yml в формате ниже вносим необходимые пакеты для установки или обновления
```commandline
  - htop
  - ncdu
  - git
  - nano
```
2. Запускаем installing_packages.yml
```commandline
ansible-playbook installing_packages/installing_packages.yml
```