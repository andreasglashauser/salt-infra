mullvad-vpn--configure-keyring:
  file.managed:
    - name: /usr/share/keyrings/mullvad-keyring.asc
    - source: salt://mullvad-vpn/files/mullvad-keyring.asc
    - user: root
    - group: root
    - mode: 644

mullvad-vpn--configure-repo:
  cmd.run:
    - name: echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
    - require:
       - file: mullvad-vpn--configure-keyring
