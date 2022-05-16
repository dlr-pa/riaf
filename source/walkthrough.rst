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

!!!THIS IS NOT POSSIBLE AT THE MOMENT!!!

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

adding large files
~~~~~~~~~~~~~~~~~~

Adding large files to a repository should not be done using
`git <https://git-scm.com/>`__. Please use
`git-annex <https://git-annex.branchable.com/>`__, e. g. adding a small
file ``small_a`` using git and a large file ``large_b`` using git-annex
do:

.. code:: sh

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
~~~~~~~~~~~~~~~~~

For creating metadata we use
`pydabu <https://dlr-pa.github.io/pydabu/>`__ to create a data bubble,
e. g.:

.. code:: sh

    git clone git+ssh://git@riaf.playground.pa.dlr.de/foo/bar
    cd bar
    pydabu create_data_bubble -dir .
    git add .dabu.json .dabu.schema
    git commit -m 'created a data bubble'
    git push


getting large files
~~~~~~~~~~~~~~~~~~~

Large files should not be stored directly in a git repository. Therefore
we use\ `git-annex <https://git-annex.branchable.com/>`__ here. So
getting a repository and see the metadata and then getting a large file
could be done by:

.. code:: sh

    git clone git+ssh://git@riaf.playground.pa.dlr.de/foo/bar # get repository
    cd bar
    git annex get large_b

known issues
------------

-  Missing possibility to create groups.
