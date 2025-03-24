include:
  - common.ufw.ufw--install-packages

nginx--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - nginx
      - python3-certbot-nginx

nginx--ensure-ufw-open-port-80:
  cmd.run:
    - name: ufw allow 80/tcp
    - require:
      - pkg: ufw--install-packages

nginx--ensure-ufw-open-port-443:
  cmd.run:
    - name: ufw allow 443/tcp
    - require:
      - pkg: ufw--install-packages
