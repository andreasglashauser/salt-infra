logrotate--configure:
  file.managed:
    - name: /etc/logrotate.conf
    - source: salt://common/logrotate/files/logrotate.conf
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: logrotate--install-packages
