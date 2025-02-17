### Запуск плейбуков #1 и #2 по ТЗ
1. файле vars/accounts.yml вносим данные пользователя в указаном формате
```commandline
  - name: i.mask
    full_name: "Ilon Mask"
    shell: "/bin/bash" # при указании оболочки zsh/ohmyzsh автоматически запустится роль #2 по ТЗ
    state: present
    ssh_key: true # при включенном параметре необходимо положить публичный ключ в директорию /roles/key/i.mask.pub с указанным name.pub
    password: false # Если необходимо указать пароль пользователю, то необходимо выполнить п.3-5 (см.ниже)
    groups: ["sudo"]
```
2. Запускаем user_managment.yml
```commandline
ansible-playbook user_managment/user_managment.yml
```

3. В директории vars/passwords.yml установите пароль пользователю в формате:
```commandline
passwords:
  i.mask: "martians"
```
4. Затем зашифруйте его с помощью Ansible Vault
**Примечание**: Убедитесь что у вас установлен модуль passlib
```commandline
ansible-vault encrypt user_managment/vars/passwords.yml
```
5. Запустите плейбук с параметром --ask-vault-pass и укажите ваш пароль
```commandline
ansible-playbook user_managment/user_managment.yml --ask-vault-pass
```