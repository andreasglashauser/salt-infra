dmarc-dkim--opendkim-keys-directory:
  file.directory:
    - name: /etc/opendkim/keys
    - user: opendkim 
    - group: opendkim
    - makedirs: True
    - mode: 755

dmarc-dkim-opendkim-keys-directory: 
  file.directory:
    - name: /etc/opendkim/keys/{{ pillar['common']['domain'] }}
    - user: opendkim
    - group: opendkim
    - makedirs: True
    - mode: 750

dmarc-dkim--dkim-generate-key-{{ pillar['common']['domain'] }}:
  cmd.run:
    - name: sudo opendkim-genkey -b 2048 -d {{ pillar['common']['domain'] }} -s default
    - cwd: /etc/opendkim/keys/{{ pillar['common']['domain'] }}
    - creates: /etc/opendkim/keys/{{ pillar['common']['domain'] }}/default.private
    - require:
      - file: dmarc-dkim--opendkim-keys-directory

dmarc-dkim--dkim-key-txt-update-rights:
  file.managed:
    - name:  /etc/opendkim/keys/{{ pillar['common']['domain'] }}/default.txt
    - user: opendkim
    - group: opendkim
    - replace: False
    - require:
      - cmd: dmarc-dkim--dkim-generate-key-{{ pillar['common']['domain'] }}

dmarc-dkim--dkim-key-private-update-rights:
  file.managed:
    - name: /etc/opendkim/keys/{{ pillar['common']['domain'] }}/default.private
    - user: opendkim
    - group: opendkim
    - replace: False
    - require:
      - cmd: dmarc-dkim--dkim-generate-key-{{ pillar['common']['domain'] }}
