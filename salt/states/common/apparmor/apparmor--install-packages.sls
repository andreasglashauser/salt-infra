apparmor--install-packages:
  pkg.installed:
    - pkgs:
      - apparmor
      - apparmor-utils
      - apparmor-profiles
