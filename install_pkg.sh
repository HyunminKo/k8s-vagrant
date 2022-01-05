#!/usr/bin/env bash
# install packages
yum makecache fast
yum clean all
yum install epel-release -y
yum install vim-enhanced -y
