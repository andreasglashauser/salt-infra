gitweb--enable-cgi:
  cmd.run:
    - name: a2enmod cgi
    - unless: apache2ctl -M | grep -q 'cgi_module'
    - require:
      - pkg: gitweb--install-packages

gitweb--enable-ssl:
  cmd.run:
    - name: a2enmod ssl
    - unless: apache2ctl -M | grep -q 'ssl'
    - require:
      - pkg: gitweb--install-packages

gitweb--enable-git-conf:
  cmd.run:
    - name: a2ensite git.conf
    - require:
      - pkg: gitweb--install-packages

gitweb--enable-evasive:
  cmd.run:
    - name: a2enmod evasive
    - require:
      - pkg: gitweb--install-packages

gitweb--enable-headers:
  cmd.run:
    - name: a2enmod headers
    - require:
      - pkg: gitweb--install-packages

gitweb--systemd-service:
  service.running:
    - name: apache2
    - enable: True
    - reload: True
    - watch:
      - file: gitweb--configure
      - cmd: gitweb--enable-cgi
      - cmd: gitweb--enable-git-conf
      - cmd: gitweb--enable-evasive
      - cmd: gitweb--enable-ssl
      - cmd: gitweb--enable-headers
