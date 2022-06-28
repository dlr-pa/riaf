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

.. code-block:: sh

    ansible-playbook --ask-vault-pass -l [my_server] -v play_install_zfs.yaml

You should adapt :ref:`task_install_zfs.yaml <play_install_zfs.yaml>` to your needs.

After :ref:`installation and configuration` you can use the ansible playbook
:ref:`play_gitolite_home2zfs_filesystem.yaml` to adapt it, e. g.:

.. code-block:: sh

    ansible-playbook --ask-vault-pass -l [my_server] -v play_gitolite_home2zfs_filesystem.yaml


installation and configuration
------------------------------

You can use the ansible playbook :ref:`play_install_riaf.yaml` to install
and configure riaf, e. g.:

.. code-block:: sh

    ansible-playbook --ask-vault-pass -l [my_server] -v play_install_riaf.yaml

You will be asked for a few variables and the output could look like:

.. code-block:: text

    Using ~/.ansible.cfg as config file
    initial ssh adminkey for gitolite: [skipped here]
    gitolite user name [git]:
    path to the gitolite home directory (repositories are stored here) [/data/gitolite]:
    DNS name of the server [example.com]:
    config file of the gitolite web site [configs/gitolite.conf]:
    ssl certificate of the web site [cert/gitolite.crt]:
    ssl certificate key of the web site [cert/gitolite.key]:
    path to gitolite-suexec-wrapper.sh [configs/gitolite-suexec-wrapper.sh]:
    path to index.html [configs/index.html]:
    path to the script update_list_all_users [configs/update_list_all_users]:
    path to the server_timestamping script [configs/server_timestamping]:
    path to the riaf_landing_page script [configs/riaf_landing_page]:
    ...

Instead of giving them one by one you can also pass them as command line options, e. g.:

.. code-block:: sh

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
    --extra-vars "server_timestamping_script=configs/server_timestamping" \
    --extra-vars "riaf_landing_page_script=configs/riaf_landing_page"

The output could look like:

.. code-block:: sh

    Using ~/.ansible.cfg as config file
    ...
     _____________________________________________
    < PLAY [installation and basic configuration] >
     ---------------------------------------------
            \   ^__^
             \  (oo)\_______
                (__)\       )\/\
                    ||----w |
                    ||     ||
    ...
     ____________
    < PLAY RECAP >
     ------------
            \   ^__^
             \  (oo)\_______
                (__)\       )\/\
                    ||----w |
                    ||     ||

    riaf_test_system     : ok=65   changed=62   unreachable=0    failed=0

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

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/configs/gitolite.conf
   :language: apache

gitolite-suexec-wrapper.sh
__________________________

The tool :download:`gitolite-suexec-wrapper.sh <../ansible_playbooks/ubuntu_20.04/configs/gitolite-suexec-wrapper.sh>` is just a small wrapper to use gitolite with both ssh and http mode clients (see `Making repositories available to both ssh and http mode clients <https://gitolite.com/gitolite/contrib/ssh-and-http.html>`_).  It is adapted by the ansible playbook:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/configs/gitolite-suexec-wrapper.sh
   :language: bash

index.html
__________

The starting page :download:`index.html <../ansible_playbooks/ubuntu_20.04/configs/index.html>` for the web interface is a very basic example:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/configs/index.html
   :language: html

server_timestamping
___________________

The gitolite trigger :ref:`server_timestamping <script server_timestamping>` does gpg signed timestamping on pushes to the server. So this cryptographic signature represent the time the data reaches the server and later changes of the history is not possible without the private gpg key own and stored on the server. This timestamping is stored in the branch ``server_timestamping``.

riaf_landing_page
_________________

If metadata are available on the default branch in the format [pydabu]_ uses, the gitolite trigger :ref:`riaf_landing_page <script riaf_landing_page>` will add a landing page to make the repository findable. The landing page is stored in the branch ``landing_page`` and available via fuse mount using [fuse_git_bare_fs]_ through [apache]_ as web interface for public access. The landing page presents the metadata.

update_list_all_users
_____________________

The tool :download:`update_list_all_users <../ansible_playbooks/ubuntu_20.04/configs/update_list_all_users>` is necessary to allow a listing of all users. This is used for the dav interface.:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/configs/update_list_all_users
   :language: sh

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
