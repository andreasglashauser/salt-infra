logwatch--conf-logwatchconf:
  file.managed:
    - name: /etc/logwatch/conf/logwatch.conf
    - source: salt://common/logwatch/files/logwatch.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - logwatch--install-packages
