knockd--systemd-service:
  service.running:
    - name: knockd
    - enable: true
    - reload: true
    - watch: 
      - file: knockd--configure
