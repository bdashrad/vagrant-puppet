# default puppet manifest for vagrant

exec { "apt-get update":
  path => "/usr/bin",
}

include single_user_rvm
include awscli
include git
include apt

#import 'apt.pp'
#import 'rvm.pp'

