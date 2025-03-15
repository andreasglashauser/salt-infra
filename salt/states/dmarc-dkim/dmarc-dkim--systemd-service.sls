dmarc-dkim--systemd-service-opendkim:
  service.running:
    - name: opendkim
    - enable: True
    - reload: True
    - watch:
      - file: /etc/opendkim.conf
      - file: /etc/opendkim/SigningTable
      - file: /etc/opendkim/TrustedHosts
      - file: /etc/opendkim/KeyTable
      - file: /etc/default/opendkim
    - require:
      - pkg: dmarc-dkim--install-packages

dmarc-dkim--systemd-service-opendmarc:
  service.running:
    - name: opendmarc
    - enable: True
    - reload: True
    - watch:
      - file: /etc/opendmarc.conf
    - require:
      - pkg: dmarc-dkim--install-packages
