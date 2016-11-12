# ********************************************
# どのサーバでも利用する基本パッケージの構成
# ********************************************

# vim
include_recipe "../cookbooks/vim/default.rb"
# tmux
include_recipe "../cookbooks/tmux/default.rb"
# anyenv
include_recipe "../cookbooks/anyenv/default.rb"