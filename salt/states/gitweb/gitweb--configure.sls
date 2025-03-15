gitweb--configure:
  file.managed:
    - template: jinja
    - names:
      - /etc/gitweb.conf:
        - source: salt://gitweb/files/gitweb.conf
      - /etc/apache2/sites-available/git.conf:
        - source: salt://gitweb/files/git.conf
