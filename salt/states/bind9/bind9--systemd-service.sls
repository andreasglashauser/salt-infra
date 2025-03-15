bind9--systemd-service:
  service.running:
    - name: bind9
    - enable: True
    - reload: True
    - watch:
      - /etc/bind/named.conf.options
    - require:
      - pkg: bind9--install-packages
