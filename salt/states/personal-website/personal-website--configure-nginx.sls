include:
  - nginx.nginx--systemd-service

personal-website--configure-nginx-sites-available:
  file.managed:
    - name: /etc/nginx/sites-available/{{ pillar['common']['fqdn'] }}.conf
    - source: salt://personal-website/files/{{ pillar['common']['fqdn'] }}.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - nginx--systemd-service

personal-website--configure-nginx-symlink:
  file.symlink:
    - name: /etc/nginx/sites-enabled/{{ pillar['common']['fqdn'] }}.conf
    - target: /etc/nginx/sites-available/{{ pillar['common']['fqdn'] }}.conf
    - force: True
    - require:
      - file: personal-website--configure-nginx-sites-available

personal-website--configure-remove-default:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - require:
      - file: personal-website--configure-nginx-symlink

personal-website--reload-nginx:
  service.running:
    - name: nginx
    - reload: True
    - watch:
      - file: personal-website--configure-nginx-sites-available
    - require:
      - file: personal-website--configure-nginx-symlink
