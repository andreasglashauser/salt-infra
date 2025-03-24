hotspot--configure:
  file.managed:
    - name: /etc/NetworkManager/system-connections/hotspot.nmconnection
    - source: salt://hotspot/files/hotspot.nmconnection
    - template: jinja
    - user: root
    - group: root
    - mode: 600

hotspot--configure-networkmanager:
  file.managed:
    - name: /etc/NetworkManager/NetworkManager.conf
    - source: salt://hotspot/files/NetworkManager.conf
    - user: root
    - group: root
    - mode: 644

hotspot--configure-ipforwarding:
  file.append:
    - name: /etc/sysctl.conf
    - source: salt://hotspot/files/sysctl.conf

hotspot--configure-iptables:
  cmd.run:
    - name: iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
    - require:
      - pkg: hotspot--install-packages

hotspot--configure-persistent-iptables:
  cmd.run:
    - name: iptables-save > /etc/iptables/rules.v4
    - watch:
      - cmd: hotspot--configure-iptables
    - require:
      - pkg: hotspot--install-packages
      - file: hotspot--configure
      - file: hotspot--configure-ipforwarding
      - cmd: hotspot--configure-iptables
