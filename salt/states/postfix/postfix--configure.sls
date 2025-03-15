postfix--configure:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - names:
      - /etc/postfix/main.cf:
        - source: salt://postfix/files/main.cf
      - /etc/postfix/master.cf:
        - source: salt://postfix/files/master.cf
      - /etc/postfix/virtual:
        - source: salt://postfix/files/virtual
    - require:
      - postfix--install-packages

include:
  - postfix.postfix--update-virtualdb
