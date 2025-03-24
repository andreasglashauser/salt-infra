base:
  '*':
    - common.remove-unwanted-packages
    - common.apparmor
    - common.coredumps
    - common.crontab
    - common.debsums
    - common.fail2ban
    - common.ssh
    - common.knockd
    - common.logrotate
    - common.unattended-upgrades
    - common.ufw
    - common.logwatch

  'mailserver':
    - postfix
    - dmarc-dkim
    - mutt
    - certbot
    - bind9
    - reboot

  'mailforwarding':
    - postfix
    - dmarc-dkim
    - certbot
    - bind9
    - reboot

  'gitserver':
    - postfix
    - git
    - gitweb
    - certbot
    - bind9
    - reboot

  'www':
    - postfix
    - nginx
    - personal-website
    - certbot
    - bind9
    - reboot
