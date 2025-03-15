include:
  - common.ufw

certbot--ensure-ufw-open-port-80:
  cmd.run:
    - name: ufw allow 80/tcp
    - require:
      - pkg: ufw--install-packages

certbot--issue-certbot-certificate-apache:
  cmd.run:
    - name: certbot --apache -d {{ pillar['common']['fqdn'] }} --non-interactive --agree-tos --email certbot@{{ pillar['common']['domain'] }}
    - unless: test -f /etc/letsencrypt/live/{{ pillar['common']['domain'] }}/fullchain.pem
    - require:
      - cmd: certbot--ensure-ufw-open-port-80
      - pkg: certbot--install-packages
    - onlyif: test -f /usr/sbin/apache2

certbot--issue-certbot-certificate:
  cmd.run:
    - name: certbot certonly --standalone -d {{ pillar['common']['fqdn'] }} --non-interactive --agree-tos --email certbot@{{ pillar['common']['domain'] }}
    - unless: test -f /etc/letsencrypt/live/{{ pillar['common']['domain'] }}/fullchain.pem
    - require:
      - cmd: certbot--ensure-ufw-open-port-80
      - pkg: certbot--install-packages
    - unless: test -f /usr/sbin/apache2
