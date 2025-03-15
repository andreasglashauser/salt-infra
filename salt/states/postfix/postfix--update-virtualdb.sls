postfix--update-virtual-db:
  cmd.run:
    - name: postmap /etc/postfix/virtual
    - watch:
      - file: /etc/postfix/virtual
