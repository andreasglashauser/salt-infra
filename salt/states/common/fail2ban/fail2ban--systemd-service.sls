fail2ban--fail2ban-systemd-service:
  service.running:
    - name: fail2ban
    - enable: True
    - reload: True
    - require:
      - fail2ban--install-packages
