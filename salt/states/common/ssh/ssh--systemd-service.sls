ssh--systemd-service:
  service.running:
    - name: sshd
    - enable: true
    - reload: true
    - watch:
      - file: /etc/ssh/sshd_config
      - file: /etc/ssh/sshd_banner
