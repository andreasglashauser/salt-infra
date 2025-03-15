unattended-upgrades--configure:
  file.managed:
    - name: /etc/apt/apt.conf.d/50unattended-upgrades
    - source: salt://common/unattended-upgrades/files/50unattended-upgrades
    - user: root
    - group: root
    - mode: 600
    - template: jinja
    - require:
      - pkg: unattended-upgrades--install-packages
