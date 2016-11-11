package "wget"
package "ncurses-devel"
package "libevent-devel"

## 変数設定
dir = node[:tmux][:home]
version = "2.1"
url = "https://github.com/tmux/tmux/releases/download/#{version}/tmux-#{version}.tar.gz"
bin = "/usr/local/bin/tmux"

## tar.gzのダウンロード
execute "download tmux.tar.gz" do
  not_if "[[ -f #{bin} || -f tmux-#{version}.tar.gz ]]"
  command "wget #{url} && tar xvf tmux-#{version}.tar.gz"
  cwd dir
end

## tmux-2.1のコンパイル & make
execute "compile tmux" do
  not_if "[[ -f #{bin} ]]"
  command "cd tmux-#{version} && ./configure && make && make install"
  cwd dir
end

## ディレクトリのクリーン
execute "clean up files" do
  only_if "ls tmux-#{version}"
  command "rm -rf tmux-#{version}*"
  cwd dir
end

## tmux.confの転送
remote_file "#{dir}/.tmux.conf" do
  source "files/tmux.conf"
end
