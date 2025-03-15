bind9--remove-packages:
  pkg.removed:
    - pkgs:
      - resolvconf

bind9--install-packages:
  pkg.installed:
    - pkgs:
      - bind9
      - bind9-utils
      - bind9-host
      - dnsutils
      - systemd-resolved
    - require:
      - pkg: bind9--remove-packages
