ansible playbooks
=================

To simplify the installation process of riaf we wrote a few
ansible playbooks. This allows a more precise description of the installation
tasks. But of cause you should check the playbooks and maybe adapt them for
your setting.

play_install_zfs.yaml
---------------------

:download:`play_install_zfs.yaml <../ansible_playbooks/ubuntu_20.04/play_install_zfs.yaml>`

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/play_install_zfs.yaml
   :language: yaml

It uses the task :download:`task_install_zfs.yaml <../ansible_playbooks/ubuntu_20.04/task_install_zfs.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_zfs.yaml
   :language: yaml

play_install_riaf.yaml
----------------------

:download:`play_install_riaf.yaml <../ansible_playbooks/ubuntu_20.04/play_install_riaf.yaml>`

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/play_install_riaf.yaml
   :language: yaml

It uses the following tasks and handler:

:download:`task_install_riaf_packages.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_packages.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_packages.yaml
   :language: yaml

:download:`task_install_riaf_configuration_gitolite.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_gitolite.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_gitolite.yaml
   :language: yaml

:download:`task_install_riaf_configuration_sshd.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_sshd.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_sshd.yaml
   :language: yaml

:download:`task_install_riaf_fuse_git_bare_fs.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_fuse_git_bare_fs.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_fuse_git_bare_fs.yaml
   :language: yaml

:download:`task_install_riaf_enable_apache_modules.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_enable_apache_modules.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_enable_apache_modules.yaml
   :language: yaml

:download:`task_install_riaf_configuration_apache.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache.yaml
   :language: yaml

:download:`task_install_riaf_configuration_apache_gitolite_1.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache_gitolite_1.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache_gitolite_1.yaml
   :language: yaml

:download:`task_install_riaf_gitolite_web_interface.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_gitolite_web_interface.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_gitolite_web_interface.yaml
   :language: yaml

:download:`task_install_riaf_configuration_gitolite_web_interface.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_gitolite_web_interface.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_gitolite_web_interface.yaml
   :language: yaml

:download:`task_install_riaf_configuration_apache_gitolite_2.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache_gitolite_2.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_configuration_apache_gitolite_2.yaml
   :language: yaml

:download:`task_install_riaf_gitolite_add_trigger_riaf_post_git.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_gitolite_add_trigger_riaf_post_git.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_install_riaf_gitolite_add_trigger_riaf_post_git.yaml
   :language: yaml

:download:`handler_install_riaf.yaml <../ansible_playbooks/ubuntu_20.04/handler_install_riaf.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/handler_install_riaf.yaml
   :language: yaml

play_gitolite_home2zfs_filesystem.yaml
--------------------------------------

:download:`play_gitolite_home2zfs_filesystem.yaml <../ansible_playbooks/ubuntu_20.04/play_gitolite_home2zfs_filesystem.yaml>`

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/play_gitolite_home2zfs_filesystem.yaml
   :language: yaml

It uses the task :download:`task_gitolite_home2zfs_filesystem.yaml <../ansible_playbooks/ubuntu_20.04/task_gitolite_home2zfs_filesystem.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_gitolite_home2zfs_filesystem.yaml
   :language: yaml

play_add_user.yaml
------------------


:download:`play_add_user.yaml <../ansible_playbooks/ubuntu_20.04/play_add_user.yaml>`

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/play_add_user.yaml
   :language: yaml

It uses the following tasks and handler:

:download:`task_riaf_add_user.yaml <../ansible_playbooks/ubuntu_20.04/task_riaf_add_user.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_riaf_add_user.yaml
   :language: yaml


play_update.yaml
----------------

:download:`play_update.yaml <../ansible_playbooks/ubuntu_20.04/play_update.yaml>`

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/play_update.yaml
   :language: yaml

It uses the following tasks and handler:

:download:`task_update.yaml <../ansible_playbooks/ubuntu_20.04/task_update.yaml>`:

.. literalinclude:: ../ansible_playbooks/ubuntu_20.04/task_update.yaml
   :language: yaml

:download:`task_install_riaf_fuse_git_bare_fs.yaml <../ansible_playbooks/ubuntu_20.04/task_install_riaf_fuse_git_bare_fs.yaml>`
