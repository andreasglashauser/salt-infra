include:
  - git.git--install-packages
  - common.ufw.ufw--install-packages

gitweb--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - gitweb
      - apache2
      - libapache2-mod-evasive
      - python3-certbot-apache

gitweb--ensure-ufw-open-port-80:
  cmd.run:
    - name: ufw allow 80/tcp
    - require:
      - pkg: ufw--install-packages

gitweb--ensure-ufw-open-port-443:
  cmd.run:
    - name: ufw allow 443/tcp
    - require:
      - pkg: ufw--install-packages
