This is an attempt to organise my vim files


Installation
--------

1. Clone the repo
    
        $ git clone http://github.com/tranngocthachs/dotvim ~/.vim

2. Init submodule for vundle

        $ cd ~/.vim
        $ git submodule init
        $ git submodule update

3. Symlink .vimrc and .gvimrc

        $ ln -s ~/.vim/.vimrc ~/.vimrc
        $ ln -s ~/.vim/.gvimrc ~/.gvimrc

4. Run Vim and type `:BundleInstall` to install the plugins with Vundle. Ignore
complaints about colorscheme since none has been installed yet. After running
`:BundleInstall` the first time, it should go away.

5. Note that the example above use `~/.vim` as the location for checking out
the repo. However, the script is quite portable in which you could check it out
anywhere in your file systems and as long as you do the symlink appropriately,
it would still work. It's therefore easy to quickly experiment with different
setups.

