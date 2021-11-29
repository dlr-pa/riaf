riaf -- a Repository Infrastructure that Accommodates Files
-----------------------------------------------------------

riaf is a repository infrastructure to accommodate files.
It enables to hold the data with the [FAIR]_ principles.

The primary focus is to work as an in-house solution to handle digital assets.
It should be possible to use the data without download a complete digital asset.

For this purpose we use open source software in a composability design
(Unix philosophy):

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


.. only:: html

  References
  __________

.. [FAIR] https://www.go-fair.org/fair-principles/
.. [gitolite] https://gitolite.com/gitolite/
.. [fuse_git_bare_fs] https://dlr-pa.github.io/fuse_git_bare_fs/
.. [sskm] https://gitolite.com/gitolite/contrib/sskm
.. [gitolite_web_interface] https://github.com/dlr-pa/gitolite_web_interface
.. [pydabu] https://dlr-pa.github.io/pydabu/
.. [git] https://git-scm.com/
.. [WebDAV] http://www.webdav.org/
.. [git-annex] https://git-annex.branchable.com
.. [OpenSSH] https://www.openssh.com/
.. [apache] https://httpd.apache.org/
