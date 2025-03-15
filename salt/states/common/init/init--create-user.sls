init--create-user:
  user.present:
    - name: {{ pillar['users']['main']['account']  }}
    - password: {{ pillar['users']['main']['password'] }}
    - hash_password: True
    - createhome: True
    - usergroup: True
    - shell: /bin/bash
    - groups:
      - sudo
