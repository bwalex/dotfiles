# Initial setup


## For a system previously using a plain git repo:

```
rm -rf $HOME/.git
git clone --separate-git-dir=$HOME/dotfiles.git git@github.com:bwalex/dotfiles.git $HOME/dotfiles-tmp
git --git-dir=$HOME/dotfiles.git --work-tree=$HOME status

# Restore/etc files as per status
```

## After initial setup & reloading shell config:

```
dotfiles config --local status.showUntrackedFiles no
dotfiles submodule update --init --recursive
```

Generally, use `dotfiles` as if it was `git`.
