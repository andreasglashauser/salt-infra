nginx--systemd-service:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - require:
      - pkg: nginx--install-packages
