{% set users = salt['cmd.run']('getent passwd | grep /home | cut -d: -f1').splitlines() %}
{% set maildirs = ['INBOX', 'Sent', 'Trash', 'Drafts'] %}

{% for user in users %}

mutt--configure-{{ user }}-muttrc:
  file.managed:
    - name: /home/{{ user }}/.muttrc
    - source: salt://mutt/files/muttrc
    - template: jinja
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644

mutt--create-maildir-folders:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - makedirs: True
    - names:
      {%- for folder in maildirs %}
      - /home/{{ user }}/Maildir/{{ folder }}/cur
      - /home/{{ user }}/Maildir/{{ folder }}/new
      - /home/{{ user }}/Maildir/{{ folder }}/tmp
      {%- endfor %}
 
{% endfor %}
