ufw--enable:
  cmd.run:
    - name: ufw --force enable
    - require:
      - pkg: ufw--install-packages
