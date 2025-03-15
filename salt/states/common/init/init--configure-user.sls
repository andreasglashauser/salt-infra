init--configure-user-sudoers:
  file.append:
    - name: /etc/sudoers
    - source: salt://common/init/files/sudoers

init--configure-user-auth:
  ssh_auth.present:
    - user: {{ pillar['users']['main']['account']  }}
    - source: salt://common/init/files/id_ed25519.pub
    - require:
      - user: init--create-user
