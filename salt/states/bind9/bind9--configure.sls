bind9--config-resolvedconf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - names:
      - /etc/systemd/resolved.conf:
         - source: salt://bind9/files/resolved.conf
      - /etc/bind/named.conf.options:
        - source: salt://bind9/files/named.conf.options
    - require:
      - bind9--install-packages
