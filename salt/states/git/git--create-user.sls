git--create-user:
  user.present:
    - name: git
    - shell: /bin/bash
    - system: True
    - createhome: False
    - usergroup: True
    - password: '!'
