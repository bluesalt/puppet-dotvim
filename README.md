This is puppet module to deploy my own [.vim](https://github.com/bluesalt/DOTVim).

Install it with standalone puppet without puppet master server
```
git clone https://github.com/bluesalt/puppet-dotvim.git dotvim
cd dotvim
puppet apply tests/init.pp --modulepath=..
```