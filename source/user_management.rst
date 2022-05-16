user management
===============

If you followed :ref:`installation of riaf` you have now 2 services
for managing user accounts:

  * basic authentication in apache (htpasswd)
  * ssh key management in gitolite


You can use the simple ansible playbook :ref:`play_add_user.yaml` to create
a user in apache, e. g.:

.. code:: sh

    ansible-playbook --ask-vault-pass -l [my_server] -v play_add_user.yaml

In this way the user gets a password.

Using the self service key management [sskm]_ in the webinterface a user can
manage his/her ssh keys stored in gitolite.
