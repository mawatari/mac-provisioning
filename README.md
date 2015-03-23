Mac provisioning by Homebrew and Ansible
============


Usage
-----

1. clone this repository.
2. edit playbook. list the managed software to variable.
3. run `ansible-playbook`


Example Playbook
----------------

```
- hosts: localhost
  connection: local
  gather_facts: no
  sudo: no
  roles:
    - homebrew
    - homebrew-cask
  vars:
    # Tap external Homebrew repositories.
    #
    # e.g.
    # - homebrew/binary
    homebrew_repositories:

    # Managed Homebrew packages.
    #
    # e.g.
    # - package_name
    # or
    # { name: package_name, state: package_state, install_options: [with-baz, enable-debug] }
    #
    # state choices: [head, latest, present, absent, linked, unlinked] (default: latest)
    # install_options: string or sequence (default: none)
    homebrew_packages:
      - readline
      - openssl
      - { name: openssl, state: linked, install_options: force }
      - ansible
      - name: git
        install_options:
          - with-brewed-curl
          - with-gettext
      - rbenv
      - ruby-build

    # Tap external Homebrew Cask repositories.
    homebrew_cask_repositories:

    # Managed Homebrew Cask packages.
    #
    # e.g.
    # - package_name
    # or
    # { name: package_name, state: package_state }
    #
    # state choices: [present, absent, installed, uninstalled] (default: present)
    homebrew_cask_packages:
      - firefox
      - google-chrome
      - google-japanese-ime
      - intellij-idea
      - karabiner
      - phpstorm
      - slack
      - vagrant
      - virtualbox
```


License
-------

MIT
