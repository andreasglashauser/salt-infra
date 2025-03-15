fail2ban--configure:
  file.managed:
    - name: /etc/fail2ban/jail.local
    - source: salt://common/fail2ban/files/jail.local
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: fail2ban--install-packages
