apparmor--systemd-service:  
  service.running:
    - name: apparmor
    - enable: True
    - require:
      - pkg: apparmor--install-packages
