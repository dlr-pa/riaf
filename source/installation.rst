installation of riaf
====================

requirement
-----------

To install riaf on a system there are a few requirements to fulfill.

First of all you need a server:

* running Linux (e. g. `Ubuntu <https://ubuntu.com/>`__ 20.04)
* fully qualified domain name
* accessible by ssh and https (firewall setting)

I used a virtual machine from a provider in the internet.

zfs data storage
----------------

If you want to store the data on a zfs file system you should prepare ``/data``
as a zfs file system and adapt it after :ref:`installation and configuration`.

You can use the ansible playbook :ref:`play_install_zfs.yaml` to create
``/data`` as a zfs file system pool in this repository, e. g.:

.. code:: sh

    ansible-playbook --ask-vault-pass -l [my_server] -v play_install_zfs.yaml

You should adapt ``task_install_zfs.yaml`` to your needs.

After :ref:`installation and configuration` you can use the ansible playbook
:ref:`play_gitolite_home2zfs_filesystem.yaml` to adapt it, e. g.:

.. code:: sh

    ansible-playbook --ask-vault-pass -l [my_server] -v play_gitolite_home2zfs_filesystem.yaml


installation and configuration
------------------------------

You can use the ansible playbook :ref:`play_install_riaf.yaml` to install
and configure riaf, e. g.:

.. code:: sh

    ansible-playbook --ask-vault-pass -l [my_server] -v play_install_riaf.yaml

You will be asked for a few variables. Instead of giving them one by one you
can also pass them as command line options, e. g.:

.. code:: sh

    ansible-playbook --ask-vault-pass -l [my_server] -v play_install_riaf.yaml \
    --extra-vars "ssh_adminkey_gitolite='$(cat ~/.ssh/gitolite_admin_fdm_ed25519.pub)'" \
    --extra-vars "gitolite_user=git" \
    --extra-vars "gitolite_home=/data/gitolite" \
    --extra-vars "servername=example.com" \
    --extra-vars "configfile_gitolite_site=configs/gitolite.conf" \
    --extra-vars "ssl_cert_crt=https_zertifikat/example.com.crt" \
    --extra-vars "ssl_cert_key=https_zertifikat/example.com.key" \
    --extra-vars "gitolite_suexec_wrapper=configs/gitolite-suexec-wrapper.sh" \
    --extra-vars "index_html=configs/index.html" \
    --extra-vars "gitolite_update_list_all_users=configs/update_list_all_users" \
    --extra-vars "server_timestamping_script=configs/server_timestamping"

With this the following software is installed and configured:

  * [gitolite]_
  * [fuse_git_bare_fs]_
  * [sskm]_
  * [gitolite_web_interface]_
  * [pydabu]_
  * [git]_
  * [WebDAV]_
  * [git-annex]_
  * [OpenSSH]_
  * [apache]_

Further you need to prepare a few additional tools and config files:

You should prepare your ssl certificates.

gitolite.conf
_____________

The apache configuration :download:`gitolite.conf <../ansible_playbooks/ubuntu_20.04/configs/gitolite.conf>` is a good example. It is adapted by the ansible playbook:

.. include:: ../ansible_playbooks/ubuntu_20.04/configs/gitolite.conf
   :literal:
   :code: apache

gitolite-suexec-wrapper.sh
__________________________

The tool :download:`gitolite-suexec-wrapper.sh <../ansible_playbooks/ubuntu_20.04/configs/gitolite-suexec-wrapper.sh>` is just a small wrapper to use gitolite with both ssh and http mode clients (see `Making repositories available to both ssh and http mode clients <https://gitolite.com/gitolite/contrib/ssh-and-http.html>`_).  It is adapted by the ansible playbook:

.. include:: ../ansible_playbooks/ubuntu_20.04/configs/gitolite-suexec-wrapper.sh
   :literal:
   :code: sh

index.html
__________

The starting page :download:`index.html <../ansible_playbooks/ubuntu_20.04/configs/index.html>` for the web interface is a very basic example:

.. include:: ../ansible_playbooks/ubuntu_20.04/configs/index.html
   :literal:
   :code: html

server_timestamping
___________________

The gitolite trigger :download:`server_timestamping <../ansible_playbooks/ubuntu_20.04/configs/server_timestamping>` does gpg signed timestamping on pushes to the server. So this cryptographic signature represent the time the data reaches the server and later changes of the history is not possible without the private gpg key own and stored on the server.

.. include:: ../ansible_playbooks/ubuntu_20.04/configs/server_timestamping
   :literal:
   :code: html

update_list_all_users
_____________________

The tool :download:`update_list_all_users <../ansible_playbooks/ubuntu_20.04/configs/update_list_all_users>` is necessary to allow a listing of all users. This is used for the dav interface.:

.. include:: ../ansible_playbooks/ubuntu_20.04/configs/update_list_all_users
   :literal:
   :code: python3

.. only:: html

  references
  ___________

.. [gitolite] https://gitolite.com/gitolite/
.. [fuse_git_bare_fs] https://dlr-pa.github.io/fuse_git_bare_fs/
.. [sskm] https://gitolite.com/gitolite/contrib/sskm
.. [gitolite_web_interface] https://github.com/dlr-pa/gitolite_web_interface
.. [pydabu] https://dlr-pa.gitlab.io/pydabu/
.. [git] https://git-scm.com/
.. [WebDAV] http://www.webdav.org/
.. [git-annex] https://git-annex.branchable.com
.. [OpenSSH] https://www.openssh.com/
.. [apache] https://httpd.apache.org/

update
------

As every system you should update it regularly.

The ansible playbook :ref:`play_update.yaml` can help you, e. g.:

.. code:: sh

    ansible-playbook --ask-vault-pass -l [my_server] -v play_update.yaml \
    --extra-vars "gitolite_user=git gitolite_home=/data/gitolite"
