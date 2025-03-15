knockd--configure:
  file.managed:
    - name: /etc/knockd.conf
    - source: salt://common/knockd/files/knockd.conf
    - user: root
    - group: root
    - mode: 600
    - template: jinja
    - require:
      - pkg: knockd--install-packages
