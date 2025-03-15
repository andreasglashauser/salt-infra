init--set-hostname:
  file.managed:
    - name: /etc/hostname
    - source: salt://common/init/files/hostname
    - template: jinja
    - mode: 644
