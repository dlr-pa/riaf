ansible playbooks
=================

To simplify the installation process of riaf we wrote a few
ansible playbooks. This allows a more precise description of the installation
tasks. But of cause you should check the playbooks and maybe adapt them for
your setting.

play_install_zfs.yaml
---------------------

:download:`play_install_zfs.yaml <../ansible_playbooks/ubuntu_20.04/play_install_zfs.yaml>`

.. include:: ../ansible_playbooks/ubuntu_20.04/play_install_zfs.yaml
   :literal:

It uses the task :download:`task_install_zfs.yaml <../ansible_playbooks/ubuntu_20.04/task_install_zfs.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_install_zfs.yaml
   :literal:

play_install_riaf.yaml
----------------------

:download:`play_install_riaf.yaml <../ansible_playbooks/ubuntu_20.04/play_install_riaf.yaml>`

.. include:: ../ansible_playbooks/ubuntu_20.04/play_install_riaf.yaml
   :literal:

It uses the following tasks and handler:

:download:`task_install_riaf_packages.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_packages.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_packages.yaml
   :literal:

:download:`task_install_riaf_configuration_gitolite.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_gitolite.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_gitolite.yaml
   :literal:

:download:`task_install_riaf_configuration_sshd.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_sshd.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_sshd.yaml
   :literal:

:download:`task_install_riaf_fuse_git_bare_fs.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_fuse_git_bare_fs.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_fuse_git_bare_fs.yaml
   :literal:

:download:`task_install_riaf_enable_apache_modules.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_enable_apache_modules.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_enable_apache_modules.yaml
   :literal:

:download:`task_install_riaf_configuration_apache.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache.yaml
   :literal:

:download:`task_install_riaf_configuration_apache_gitolite_1.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache_gitolite_1.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache_gitolite_1.yaml
   :literal:

:download:`task_install_riaf_configuration_gitolite_web_interface.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_gitolite_web_interface.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_gitolite_web_interface.yaml
   :literal:

:download:`task_install_riaf_configuration_apache_gitolite_2.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache_gitolite_2.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache_gitolite_2.yaml
   :literal:

:download:`handler_install_riaf.yaml <../ansible_playbooks/ubuntu_20.04/handler_install_riaf.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/handler_install_riaf.yaml
   :literal:

play_gitolite_home2zfs_filesystem.yaml
--------------------------------------

:download:`play_gitolite_home2zfs_filesystem.yaml <../ansible_playbooks/ubuntu_20.04/play_gitolite_home2zfs_filesystem.yaml>`

.. include:: ../ansible_playbooks/ubuntu_20.04/play_gitolite_home2zfs_filesystem.yaml
   :literal:

It uses the task :download:`task_gitolite_home2zfs_filesystem.yaml <../ansible_playbooks/ubuntu_20.04/task_gitolite_home2zfs_filesystem.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_gitolite_home2zfs_filesystem.yaml
   :literal:

play_update.yaml
----------------

:download:`play_update.yaml <../ansible_playbooks/ubuntu_20.04/play_update.yaml>`

.. include:: ../ansible_playbooks/ubuntu_20.04/play_update.yaml
   :literal:

It uses the following tasks and handler:

:download:`task_update.yaml <../ansible_playbooks/ubuntu_20.04/task_update.yaml>`:

.. include:: ../ansible_playbooks/ubuntu_20.04/task_update.yaml
   :literal:

:download:`task_install_riaf_fuse_git_bare_fs.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_fuse_git_bare_fs.yaml>`
