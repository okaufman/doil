php7.4:
  pkg.installed:
    - refresh: true
    - pkgs:
      - libapache2-mod-php7.4
      - php7.4-curl
      - php7.4-gd
      - php7.4-json
      - php7.4-mysql
      - php7.4-readline
      - php7.4-xsl
      - php7.4-cli
      - php7.4-zip
      - php7.4-mbstring
      - php7.4-soap
      - php7.4-bcmath
      - php7.4-imap

/root/cleanup.sh_74:
  file.managed:
    - source: salt://php/cleanup.sh
    - user: root
    - group: root
    - mode: 740

cleanup_74:
  cmd.run:
    - cwd: /root/
    - name: ./cleanup.sh

a2_disable_php73_74:
  module.run:
    - name: apache.a2dismod
    - mod: php7.3

a2_enable_php7.4:
  module.run:
    - name: apache.a2enmod
    - mod: php7.4
