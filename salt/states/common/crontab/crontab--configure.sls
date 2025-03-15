cron--configure:
  file.managed:
    - name: /etc/crontab
    - source: salt://common/crontab/files/crontab
    - template: jinja
