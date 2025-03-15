git--configure:
  file.directory:
    - name: /srv/git
    - user: git
    - group: git
    - mode: 755
    - makedirs: True
    - require:
      - user: git--create-user
