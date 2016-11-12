# *******************************************************************
# anyenvをインストールするためのレシピ
# itamae-plugin-recipe-anyenvを利用する
# 参考: https://github.com/surume/itamae-plugin-recipe-anyenv
# *******************************************************************

## rbenv
# ruby-buildに必要なパッケージのインストール
package "gcc"
package "bzip2"
package "openssl-devel"
package "libyaml-devel"
package "libffi-devel"
package "readline-devel"
package "zlib-devel"
package "gdbm-devel"
package "ncurses-devel"


## 共通
# /etc/profileにパスを追記する
msg = <<"EOS"
### Anyenv ###
export ANYENV_ROOT="/usr/local/anyenv"
export PATH="${ANYENV_ROOT}/bin:$PATH"
eval "$(anyenv init -)"
EOS

execute "add /etc/profile to init anyenv" do
  not_if "grep anyenv /etc/profile"
  command "echo '#{msg}' >> /etc/profile"
end

# システムにanyenvをインストール
include_recipe "anyenv::system"
