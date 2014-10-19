# manifest for single_user_rvm

class single_user_rvm {
  user { 'vagrant': }

  single_user_rvm::install { 'vagrant': }

  single_user_rvm::install_ruby { 'ruby-2.1.2':
    user    => 'vagrant',
    require => Single_User_Rvm::Install['vagrant'],
  }

  file { '/home/vagrant/.rvm/rubies/default':
    ensure => symlink,
    target => '/home/vagrant/.rvm/rubies/ruby-2.1.2',
    require => Single_User_Rvm::Install_Ruby['ruby-2.1.2'],
  }

  file { '/home/vagrant/.rvm/environments/default':
    ensure => symlink,
    target => '/home/vagrant/.rvm/environments/ruby-2.1.2',
    require => Single_User_Rvm::Install_Ruby['ruby-2.1.2'],
  }
}