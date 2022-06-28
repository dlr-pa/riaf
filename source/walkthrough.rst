walkthrough riaf -- a Repository Infrastructure that Accommodates Files
=======================================================================

overview
--------

This is a walkthrough of the basic features of riaf using a
temporarily development setup on riaf.playground.pa.dlr.de.
So, if you want to try/use riaf replace the server name accordingly.
Or, riaf.playground.pa.dlr.de is just a name we use here.

All steps can be handled as a self service.

Using the `web interface <https://riaf.playground.pa.dlr.de/>`__ you get a
limit number of features.

creating a repository to store data
-----------------------------------

To create a repository to store data you need a group to organize
access. Using this group, you can create a repository.


create a group
~~~~~~~~~~~~~~

Using our
`web interface for gitolite <https://riaf.playground.pa.dlr.de/www/>`__
you can create a group.
Go to `create group <https://riaf.playground.pa.dlr.de/www/?creategroup>`__
and fill out the web form.

You have to set the users which are owners, writers and/or readers.

This maps to 3 authorization groups. The owner group is allowed to
create, read and write repositories in this group. The reader group is
allowed to read repositories in the group. And the writer group is
allowed to read and write repositories in the group.

The initiator of the group creation will always be an owner.


create a repository
~~~~~~~~~~~~~~~~~~~

Using our
`web interface for gitolite <https://riaf.playground.pa.dlr.de/www/>`__
you can create a repository.
Go to `create repository <https://riaf.playground.pa.dlr.de/www/?createrepo>`__
and fill out the web form, e. g. for creating a repository ``bar`` in the group
``foo``:

+---------------------+-----------+
| field               | content   |
+=====================+===========+
| project directory   | foo       |
+---------------------+-----------+
| repository name     | bar       |
+---------------------+-----------+

Now you can clone the repository (possible commands are displayed after
creating the repository), e. g.:

.. code:: sh

    git clone git+ssh://git@riaf.playground.pa.dlr.de/foo/bar

accessing data
--------------

To access the data you can use `git <https://git-scm.com/>`__ by the
supported protocols ssh and https.

For using ssh you need to store your public ssh key using the web form
`manage ssh keys with sskm <https://riaf.playground.pa.dlr.de/www/?mngkey>`__,
e. g. (the ssh key is shorten for readability):

+-------------------------------------------------+-----------------------------------+
| field                                           | content                           |
+=================================================+===================================+
| name (e. g. "@computer")                        | @my\_new\_key\_to\_access\_riaf   |
+-------------------------------------------------+-----------------------------------+
| public key (e. g. content of id\_ed25519.pub)   | ssh-ed25519 AA..w mohr@myone      |
+-------------------------------------------------+-----------------------------------+

Of course instead of ``@my_new_key_to_access_riaf`` using a name like
``@myone`` makes much more sense! ;-)

Further -- as requested on the page after adding your key -- you have to
verify this key as described in `changing keys -- self service key
management <https://gitolite.com/gitolite/contrib/sskm.html>`__, e. g.:

.. code:: sh

    ssh -i .ssh/newkey git@riaf.playground.pa.dlr.de sskm confirm-add @my_new_key_to_access_riaf

You can find the repositories you can access on the website `gitolite
command (info) <https://riaf.playground.pa.dlr.de/www/?info>`__, by using the
command ``ssh git@riaf.playground.pa.dlr.de`` or by getting the output from
`riaf.playground.pa.dlr.de/git/ <https://riaf.playground.pa.dlr.de/git/>`__.

using git
~~~~~~~~~

Using `git <https://git-scm.com/>`__ you can access the repository, e.
g. cloning the repository ``bar`` in the group ``foo``:

.. code:: sh

    git clone git+ssh://git@riaf.playground.pa.dlr.de/foo/bar

using dav
~~~~~~~~~

You can access read-only the repositories by
`WebDAV <http://www.webdav.org/>`__ at
`riaf.playground.pa.dlr.de/dav/ <https://riaf.playground.pa.dlr.de/dav/>`__ (e. g.
using your favorite browser).

On Linux systems you can use
`gvfs <https://wiki.gnome.org/Projects/gvfs>`__. For example using the
GUI `Thunar <http://thunar.xfce.org>`__ (or other file mangers) go to
``davs://riaf.playground.pa.dlr.de/dav/`` to do so. Of course you can access
this mountpoint created for you by the GUI on the command line.

On Linux systems you can also use the fuse filesystem
`davfs2 <http://savannah.nongnu.org/projects/davfs2>`__. But you have to
adapt ``/etc/fstab`` therefore.

Using windows you can mount it as well, e. g. using the Explorer go to
``\\riaf.playground.pa.dlr.de@SSL\dav\`` and browse the data.

In this way your scripts can access the data like a local file.

server timestamping
-------------------

If you push data to the server, the server will do a gpg signed timestamping. So this cryptographic signature represent the time the data reaches the server and later changes of the history is not possible without the private gpg key own and stored on the server. This timestamping is stored in the branch ``server_timestamping``.

The following example shows the gpg signed timestamping done on the server:

.. code-block:: text
   :emphasize-lines: 35-37

    $ # get repository from server:
    $ git clone git+ssh://git@riaf.playground.pa.dlr.de/foo/bar
    $ cd bar  # change directory to the repository
    $ echo a > a  # create a file 'a' with the content "a"
    $ git add a  # add file 'a' to the git repository
    $ git commit -m a  # commit with the message "a"
    [master (root-commit) ee2985f] a
     1 file changed, 1 insertion(+)
     create mode 100644 a
    $ git push  # push data to the server
    Counting objects: 3, done.
    Writing objects: 100% (3/3), 204 bytes | 204.00 KiB/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To git+ssh://git@riaf.playground.pa.dlr.de/foo/bar
     * [new branch]      master -> master
    $ git branch --list --all  # list all known branches
    * master
      remotes/origin/master
    $ git pull  # get/update data from the server
    remote: Enumerating objects: 1, done.
    remote: Counting objects: 100% (1/1), done.
    remote: Total 1 (delta 0), reused 0 (delta 0)
    Unpacking objects: 100% (1/1), done.
    From git+ssh://git@riaf.playground.pa.dlr.de/foo/bar
    * [new branch]      server_timestamping -> origin/server_timestamping
    Already up to date.
    $ git branch --list --all  # list all known branches
    * master
      remotes/origin/master
      remotes/origin/server_timestamping
    $ git checkout server_timestamping  # switch to branch 'server_timestamping'
    Branch 'server_timestamping' set up to track remote branch 'server_timestamping' from 'origin'.
    Switched to a new branch 'server_timestamping'
    $ git log --show-signature  # show log with signatures
    commit dc856b8c84678b9e77c20d445b3f1e3b811e6253 (HEAD -> server_timestamping, origin/server_timestamping)
    gpg: Signature made Di 28 Jun 2022 16:53:20 CEST
    gpg:                using EDDSA key 033F2AAC7FE48B302A88DB0ACE5CF8462F016A34
    gpg: Can't check signature: No public key
    Author: git <git@localhost>
    Date:   Tue Jun 28 14:53:20 2022 +0000

        signing commit

    commit ee2985fb06d83512b676937397cb7fcfb45ab03c (origin/master, master)
    Author: Daniel Mohr <daniel.mohr@dlr.de>
    Date:   Tue Jun 28 16:52:16 2022 +0200

        a

adding large files
------------------

Adding large files to a repository should not be done using
`git <https://git-scm.com/>`__. Please use
`git-annex <https://git-annex.branchable.com/>`__, e. g. adding a small
file ``small_a`` using git and a large file ``large_b`` using git-annex
do:

.. code-block:: sh

    git clone git+ssh://git@riaf.playground.pa.dlr.de/foo/bar
    cd bar
    echo a > small_a
    git add small_a
    git commit -m a
    git annex init
    cp -p /somedata ./large_b
    git annex add large_b
    git commit -m b
    git annex sync
    git annex sync --content

creating metadata
-----------------

For creating metadata we use
`pydabu <https://dlr-pa.github.io/pydabu/>`__ to create a data bubble,
e. g.:

.. code-block:: sh

    git clone git+ssh://git@riaf.playground.pa.dlr.de/foo/bar
    cd bar
    pydabu create_data_bubble -dir .
    git add .dabu.json .dabu.schema
    git commit -m 'created a data bubble'
    git push

riaf landing page
-----------------

If metadata are available on the default branch in the format [pydabu]_ uses, the server will add a landing page in the branch ``landing_page``. It is available on the `web interface dabu <https://riaf.playground.pa.dlr.de/dabu/>`__ for public access. The landing page presents the metadata.

getting large files
-------------------

Large files should not be stored directly in a git repository. Therefore
we use\ `git-annex <https://git-annex.branchable.com/>`__ here. So
getting a repository and see the metadata and then getting a large file
could be done by:

.. code-block:: sh

    git clone git+ssh://git@riaf.playground.pa.dlr.de/foo/bar  # get repository
    cd bar
    git annex get large_b

known issues
------------

-  Missing possibility to manage access on groups.
