#!/bin/bash
#
# Suexec wrapper for gitolite-shell
#

export GIT_PROJECT_ROOT="/var/lib/gitolite/repositories"
export GITOLITE_HTTP_HOME="/var/lib/gitolite"

exec ${GITOLITE_HTTP_HOME}/gitolite-source/src/gitolite-shell
