RIAF -- a Repository Infrastructure that Accommodates Files
-----------------------------------------------------------

[RIAF]_ is a repository infrastructure to accommodate files.
It enables to hold the data with the [FAIR]_ principles.

RIAF is designed to enable provenance and reproducibility of the research data
in the early part of the data life cycle, i. e. prior to publication.
It further is designed to enable checks on metadata relevant to research data
management as defined e.g. in a
machine actionable data management plan (maDMP).

This new concept of using CI pipelines for research data allows interesting
features.
The server could do cryptographic timestamping to inhibit silent changes of
the history.
Research data management can define relevant checks on metadata.
From given metadata a public accessible landing page can be created.

In our concept most data is stored in a repository and can be easily
distributed. This allows the data genesis in a private environment
(e. g. aircraft, campaigns, ...) without network access and
later share the data using a central server instance.
Also already during data genesis (e. g. raw data, physical data,
scientific data) the possibility to share data and track changes is given.
And in the end after preparing a publication the data can be transported
to a public data repository.

The primary focus is to work as an in-house solution to handle digital assets.
It should be possible to use the data without downloading a complete digital
asset.

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

.. [RIAF] https://dlr-pa.gitlab.io/riaf/
.. [FAIR] https://www.go-fair.org/fair-principles/ https://oceanrep.geomar.de/id/eprint/55269/
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

Talks, Publications
___________________

  * [2021-04-20]_ RDA 17th Plenary Meeting
  * [2022-10-06]_ HMC Conference 2022

.. [2021-04-20] https://www.rd-alliance.org/plenaries/rda-17th-plenary-meeting-edinburgh-virtual/experiments-preparing-data-interchange-and https://elib.dlr.de/142055/ https://www.youtube.com/watch?v=D7RchXvADNk
.. [2022-10-06] https://events.hifis.net/event/469/ https://events.hifis.net/event/469/contributions/3208/
