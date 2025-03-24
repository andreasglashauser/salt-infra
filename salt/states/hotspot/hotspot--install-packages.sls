hotspot--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - iptables-persistent
