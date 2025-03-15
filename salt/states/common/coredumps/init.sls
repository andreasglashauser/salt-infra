/etc/security/limits.conf:
  file.append:
    - text:
      - '* hard core 0'
      - '* soft core 0'

/etc/sysctl.d/9999-disable-core-dump.conf:
  file.managed:
    - contents: |
        fs.suid_dumpable=0
        kernel.core_pattern=|/bin/false
    - user: root
    - group: root
    - mode: 644

apply_sysctl_changes:
  cmd.run:
    - name: sysctl -p /etc/sysctl.d/9999-disable-core-dump.conf
    - unless: sysctl -n fs.suid_dumpable | grep -q 0
