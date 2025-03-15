{% set smtpd_milters_line = '' %}
{% set non_smtpd_milters_line = '' %}

{%- if salt['file.file_exists']('/etc/postfix/main.cf') %}
  {% for line in salt['file.read']('/etc/postfix/main.cf').splitlines() %}
    {% if line.startswith('smtpd_milters') %}
      {% set smtpd_milters_line = line %}
    {% elif line.startswith('non_smtpd_milters') %}
      {% set non_smtpd_milters_line = line %}
    {% endif %}
  {% endfor %}

  {% set smtpd_milters_value = smtpd_milters_line.split('=')[1].strip() if smtpd_milters_line and '=' in smtpd_milters_line else '' %}
  {% set non_smtpd_milters_value = non_smtpd_milters_line.split('=')[1].strip() if non_smtpd_milters_line and '=' in non_smtpd_milters_line else '' %}
{%- else %}
  {% set smtpd_milters_value = '' %}
  {% set non_smtpd_milters_value = '' %}
{% endif %}

dmarc-dkim--configure-postfix-maincf-smtpd_milters:
  file.replace:
    - name: /etc/postfix/main.cf
    - pattern: '^smtpd_milters =.*'
    - repl: "smtpd_milters = {{ smtpd_milters_value + (', ' if smtpd_milters_value else '') }}inet:127.0.0.1:8891, inet:127.0.0.1:8893"
    - unless: "grep -q 'smtpd_milters =.*inet:127.0.0.1:8891.*inet:127.0.0.1:8893' /etc/postfix/main.cf"
    - require:
      - file: postfix--configure

dmarc-dkim--configure-postfix-maincf-non_smtpd_milters:
  file.replace:
    - name: /etc/postfix/main.cf
    - pattern: '^non_smtpd_milters =.*'
    - repl: "non_smtpd_milters = {{ non_smtpd_milters_value + (', ' if non_smtpd_milters_value else '') }}inet:127.0.0.1:8891, inet:127.0.0.1:8893"
    - unless: "grep -q 'non_smtpd_milters =.*inet:127.0.0.1:8891.*inet:127.0.0.1:8893' /etc/postfix/main.cf"
    - require:
      - file: postfix--configure

dmarc-dkim--configure-opendkim:
  file.managed:
    - user: opendkim
    - group: opendkim
    - mode: 644
    - template: jinja
    - makedirs: True
    - names:
      - /etc/opendkim/KeyTable:
        - source: salt://dmarc-dkim/files/KeyTable
      - /etc/opendkim/TrustedHosts:
        - source: salt://dmarc-dkim/files/TrustedHosts
      - /etc/opendkim/SigningTable:
        - source: salt://dmarc-dkim/files/SigningTable
      - /etc/opendkim.conf:
        - source: salt://dmarc-dkim/files/opendkim.conf
      - /etc/default/opendkim:
        - source: salt://dmarc-dkim/files/opendkim

dmarc-dkim--configure-opendmarc:
  file.managed:
    - name: /etc/opendmarc.conf
    - source: salt://dmarc-dkim/files/opendmarc.conf
    - user: opendmarc
    - group: opendmarc
    - mode: 644
    - template: jinja
