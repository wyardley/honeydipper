#!/bin/bash

set -e

repo_dir=/tmp/honeydipper-test-config

(
  set -x
  rm -rf $repo_dir
  mkdir -p $repo_dir
  cp -r $(dirname $0)/* $repo_dir/

  cd $repo_dir
  git init .
  git add *
  git -c user.name='circle' -c user.email='circle@nomail.com' commit -m 'init' -a
) >> $(dirname $0)/../../test.log 2>> $(dirname $0)/../../test.log

echo $repo_dir
