remove-unwanted-packages--packages:
  pkg.removed:
    - pkgs:
      - nano
      - vim
      - neovim
      - exim4
      - cups
      - samba*
      - snapd
      - bluetooth
      - bluez
      - doc-debian
      - manpages-de
      - xinetd
      - nis
      - yp-tools
      - tftpd
      - atftpd
      - tftpd-hpa
      - telnetd
      - rsh-server
      - rsh-redone-server
      - acpid
      - aptitude
      - at

remove-unwanted-packages--apt-cleanup:
  cmd.run:
    - name: "apt-get autoremove -y && apt-get clean && apt-get autopurge"
    - onchanges:
      - pkg: remove-unwanted-packages--packages
