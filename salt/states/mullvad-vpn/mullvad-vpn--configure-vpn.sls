include:
  - mullvad-vpn.mullvad-vpn--install-packages

mullvad-vpn--configure-vpn-account:
  cmd.run:
    - name: mullvad account login {{ pillar['services']['mullvad']['account'] }}
    - require:
      - pkg: mullvad-vpn--install-packages

mullvad-vpn--configure-vpn-connect:
  cmd.run:
    - name: mullvad connect
    - require:
      - cmd: mullvad-vpn--configure-vpn-account
      - pkg: mullvad-vpn--install-packages

mullvad-vpn--configure-vpn-lan:
  cmd.run:
    - name: mullvad lan set allow
    - require:
      - cmd: mullvad-vpn--configure-vpn-account
      - pkg: mullvad-vpn--install-packages

mullvad-vpn--configure-vpn-autoconnect:
  cmd.run:
    - name: mullvad auto-connect set on
    - require:
      - cmd: mullvad-vpn--configure-vpn-account
      - cmd: mullvad-vpn--configure-vpn-lan
      - pkg: mullvad-vpn--install-packages

mullvad-vpn--configure-vpn-lockdownmode:
  cmd.run:
    - name: mullvad lockdown-mode set on
    - require:
      - cmd: mullvad-vpn--configure-vpn-account
      - cmd: mullvad-vpn--configure-vpn-lan
      - pkg: mullvad-vpn--install-packages

mullvad-vpn--configure-vpn-dns:
  cmd.run:
    - name: mullvad dns set default --block-ads --block-trackers --block-malware --block-gambling --block-adult-content --block-social-media
    - require:
      - cmd: mullvad-vpn--configure-vpn-account
      - cmd: mullvad-vpn--configure-vpn-lan
      - pkg: mullvad-vpn--install-packages
