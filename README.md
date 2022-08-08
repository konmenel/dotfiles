# dotfiles
Repo to manage my dotfiles on different computers.

## Install
To install the dotfiles run the following commands:

### With HTTPS
```
git clone https://github.com/konmenel/dotfiles.git ~/.dotfiles
cd .dotfiles
./install
```

### With SSH
```
git clone git@github.com:konmenel/dotfiles.git ~/.dotfiles
cd .dotfiles
./install
```

The script only creates the symbolic links. To install and setup fish as the defualt shell you can run the script:
```
./setupfish.sh
```
