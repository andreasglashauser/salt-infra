debsums--configure:
  file.managed:
    - name: /etc/default/debsums 
    - source: salt://common/debsums/files/debsums
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: debsums--install-packages
