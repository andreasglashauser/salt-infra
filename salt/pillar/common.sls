{% set fqdn = grains['fqdn'] %}
{% set domain = '.'.join(fqdn.split('.')[-2:]) %}
common:
  fqdn: {{ fqdn }}
  domain: {{ domain }}
