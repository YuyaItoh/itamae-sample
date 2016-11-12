package "vim"

# 変数設定
dir = node[:vim][:home]

# vimrcの転送
remote_file "#{dir}/.vimrc" do
  source "files/vimrc"
end