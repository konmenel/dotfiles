#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir $BASEDIR/tmp

function install_fish {
    if which apt &> /dev/null ; then
        # install fish with apt
        sudo apt install fish
    else
        # install fish from source
        git clone https://github.com/fish-shell/fish-shell.git $BASEDIR/tmp/fish
        cd $BASEDIR/tmp/fish
        mkdir build; cd build
        cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/.local/bin/fish
        make -j$(nproc)
        make install
        cd $BASEDIR
    fi
}

# installing fish if nessesary
if which fish &> /dev/null ; then
    echo "Fish installed"
else
    echo "Installing fish"
    install_fish
    echo "Fish installed"
fi


if which apt &> /dev/null ; then
    # install with apt if available
    sudo apt install bat exa fd-find powerline fonts-powerline curl
else
    # installing rust if needed
    if ! which cargo &> /dev/null ; then
        echo "Installing rust"
        curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path --quiet
        source "$HOME/.cargo/env"
    fi

    # installing rust programs with cargo if needed
    if ! which bat &> /dev/null ; then
        cargo install -j$(nproc) --locked bat
    fi
    if ! which exa &> /dev/null ; then
        cargo install -j$(nproc) exa
    fi
    if ! which fd &> /dev/null ; then
        cargo install -j$(nproc) fd-find
    fi

    git clone https://github.com/powerline/fonts.git tmp/fonts
    $BASEDIR/fonts/install.sh

    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
    omf install bobthefish

    echo replacing segment seperators in prompt
    sed -i '353 c\
                echo -ns \\\ue0b0 " "' $HOME/.local/share/omf/themes/bobthefish/functions/fish_prompt.fish
    sed -i '393 c\
            echo -ns \\\ue0b0 " "' $HOME/.local/share/omf/themes/bobthefish/functions/fish_prompt.fish
fi

rm -rf $BASEDIR/tmp
