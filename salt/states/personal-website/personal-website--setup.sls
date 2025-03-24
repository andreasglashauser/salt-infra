include:
  - nginx.nginx--install-packages

personal-website--setup:
  git.latest:
    - name: {{ pillar['services']['git']['repo'] }}/personal-website.git
    - target: /var/www/andreasglashauser.com
    - require:
      - pkg: personal-website--install-packages
      - pkg: nginx--install-packages
