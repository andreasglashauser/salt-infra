include:
  - common.ufw

postfix--systemd-service:
  service.running:
    - name: postfix
    - enable: True
    - reload: True
    - watch:
      - /etc/postfix/main.cf
      - /etc/postfix/master.cf

{% if grains['id'] in ['mailserver', 'mailforwarding'] %}

postfix--ufw-allow-smtp:
  cmd.run:
    - name: ufw allow 25
    - required: 
      - pkg: ufw--installed-packages

{% endif %}
