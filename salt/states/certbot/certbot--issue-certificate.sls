include:
  - common.ufw

certbot--ensure-ufw-open-port-80:
  cmd.run:
    - name: ufw allow 80/tcp
    - require:
      - pkg: ufw--install-packages


certbot--issue-certbot-certificate-apache:
  cmd.run:
    - name: >
        certbot --apache
        {% if 'www' in pillar['common']['fqdn'] -%}
        -d {{ pillar['common']['fqdn'] }} -d {{ pillar['common']['domain'] }}
        {%- else -%}
        -d {{ pillar['common']['fqdn'] }}
        {%- endif %}
        --non-interactive
        --agree-tos
        --email certbot@{{ pillar['common']['domain'] }}
    - unless: test -f /etc/letsencrypt/live/{{ pillar['common']['domain'] }}/fullchain.pem
    - require:
      - cmd: certbot--ensure-ufw-open-port-80
      - pkg: certbot--install-packages
    - onlyif: test -f /usr/sbin/apache2

certbot--issue-certbot-certificate-nginx:
  cmd.run:
    - name: >
        certbot --nginx
        {% if 'www' in pillar['common']['fqdn'] -%}
        -d {{ pillar['common']['fqdn'] }} -d {{ pillar['common']['domain'] }}
        {%- else -%}
        -d {{ pillar['common']['fqdn'] }}
        {%- endif %}
        --non-interactive
        --agree-tos
        --email certbot@{{ pillar['common']['domain'] }}
    - unless: test -f /etc/letsencrypt/live/{{ pillar['common']['domain'] }}/fullchain.pem
    - require:
      - cmd: certbot--ensure-ufw-open-port-80
      - pkg: certbot--install-packages
    - onlyif: test -f /usr/sbin/nginx

certbot--issue-certbot-certificate:
  cmd.run:
    - name: certbot certonly --standalone -d {{ pillar['common']['fqdn'] }} --non-interactive --agree-tos --email certbot@{{ pillar['common']['domain'] }}
    - unless: |
        test -f /etc/letsencrypt/live/{{ pillar['common']['domain'] }}/fullchain.pem ||
        test -f /usr/sbin/apache2 ||
        test -f /usr/sbin/nginx
    - require:
      - cmd: certbot--ensure-ufw-open-port-80
      - pkg: certbot--install-packages
