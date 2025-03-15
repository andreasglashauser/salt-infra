{% set fqdn = grains['fqdn'] %}
common:
  fqdn: {{ fqdn }}
  domain: {{ fqdn.split('.', 1)[-1] }}
