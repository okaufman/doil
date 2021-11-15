apt_https_72:
  pkg.installed:
    - name: software-properties-common

php_repo_list_72:
  cmd.run:
    - name: echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
    - unless: test -f /etc/apt/sources.list.d/php.list

php_repo_key_72:
  cmd.run:
    - name: wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
    - unless: test -f /etc/apt/trusted.gpg.d/php.gpg

php7.2:
  pkg.installed:
    - refresh: true
    - pkgs:
      - libapache2-mod-php7.2
      - php7.2-curl
      - php7.2-gd
      - php7.2-json
      - php7.2-mysql
      - php7.2-readline
      - php7.2-xsl
      - php7.2-cli
      - php7.2-zip
      - php7.2-mbstring
      - php7.2-soap
      - php7.2-bcmath
      - php7.2-imap

/root/cleanup.sh_72:
  file.managed:
    - source: salt://php/cleanup.sh
    - user: root
    - group: root
    - mode: 740

cleanup_72
  cmd.run:
    - cwd: /root/
    - name: ./cleanup.sh

a2_disable_php73_72:
  module.run:
    - name: apache.a2dismod
    - mod: php7.3

a2_disable_php74_72:
  module.run:
    - name: apache.a2dismod
    - mod: php7.4

a2_enable_php72:
  module.run:
    - name: apache.a2enmod
    - mod: php7.2
