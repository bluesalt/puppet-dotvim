class dotvim {
  package {'git':
    name   => 'git',
    ensure => present,
  }

  package {'ctags':
    name   => 'ctags',
    ensure => present,
  }

  $home = "home_$::id"
  $home_dir = inline_template("<%= scope.lookupvar('::$home') %>")

  vcsrepo {"$home_dir/.vim":
    ensure   => present,
    provider => git,
    source   => "https://github.com/bluesalt/DOTVim.git",
    require  => Package['git'],
  }

  file { "$home_dir/.vimrc":
    ensure  => link,
    target  => "$home_dir/.vim/.vimrc",
    require => Vcsrepo["$home_dir/.vim"],
  }
}
