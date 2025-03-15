ssh--configure:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - template: jinja
    - names:
      - /etc/ssh/sshd_config:
        - source: salt://common/ssh/files/sshd_config
      - /etc/ssh/sshd_banner:
        - source: salt://common/ssh/files/sshd_banner
