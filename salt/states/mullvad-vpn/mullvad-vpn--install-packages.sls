include:
  - mullvad-vpn.mullvad-vpn--configure

mullvad-vpn--install-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - mullvad-vpn
    - require:
      - cmd: mullvad-vpn--configure-repo
