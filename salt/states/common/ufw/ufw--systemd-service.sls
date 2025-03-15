ufw--systemd-service:
  service.running:
    - name: ufw
    - enable: True
    - reload: True
    - require:
      - pkg: ufw--install-packages
