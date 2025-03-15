gitweb--www-data-group:
  group.present:
    - name: git
    - members:
      - www-data
      - git

gitweb--srv-git-directory:
  file.directory:
    - name: /srv/git
    - recurse:
        - group
    - group: www-data
    - require:
      - group: gitweb--www-data-group

gitweb--set-git-permissions:
  cmd.run:
    - name: chmod -R g+rx /srv/git
    - require:
      - file: gitweb--srv-git-directory
