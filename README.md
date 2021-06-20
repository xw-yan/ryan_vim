# ryan_vim
本配置采用vim-plug管理插件，vim-plug是一款非常轻量又高效的vim插件管理工具。
它支持全异步、多线程并行安装插件，支持git分支、标签等，可以对插件进行回滚更新、
还支持按需加载插件(On-demand loading)，可以指定对特定文件类型加载对应vim插件，大大加快了vim启动时间。

Vim-plug安装：
vim-plug使用github进行托管和维护，只需要下载对应的 plug.vim 文件并保存到 autoload 目录即可完成安装。
ubuntu系统下可使用以下命令快速安装vim-plug。

命令：
mkdir ~/.vim/autoload/
cd ~/.vim/autoload/
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

或者使用curl工具来简化下载过程：
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

命令					功能描述
PlugInstall [name ...] [#threads]	安装插件
PlugUpdate [name ...] [#threads]	安装或更新vim插件
PlugClean[!]				卸装未使用的目录 (bang version will clean without prompt)
PlugUpgrade				更新vim-plug自身
PlugStatus				查看vim插件的状态
PlugDiff				对比上次PlugUpdate的更改 (Examine changes from the previous update and the pending changes)
PlugSnapshot[!] [output path]		保存当前插件的镜像副本到指定目录 (Generate script for restoring the current snapshot of the plugins)

参考地址：https://vimjc.com/vim-plug.html

