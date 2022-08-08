# Remove greeting
set fish_greeting ""

# powerline
set -g theme_powerline_fonts no
#set -g theme_nerd_fonts no

# bobthefish theme
set -g theme_color_scheme nord
set -g theme_display_git_default_branch yes
set -g theme_display_git_dirty no
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -g theme_date_format "+%a %H:%M"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

## Aliases

# Alias exa to ls
alias ls="exa -a"
alias lsa="exa -la"

# Alias fdfind to fd
alias fd="fdfind"

# Alias batcat to bat
alias bat="batcat"

# Alias for git
alias gitc="git add . ; git commit"

# Aliases for files
alias duh="du -sh * | sort -h -r"

# Alias for grep history
alias gh="history|grep"

## Aliases for conda
# env setup from .yml
alias cenv="conda env create -f environment.yml"
# env export to .yml
alias cexp="conda env export --no-builds  > environment.yml"

# Aliases for ssh
alias ichec="ssh -X konmenel@kay.ichec.ie"

# Alias for opening nautilus in current directory
alias ii="nautilus"
# function ii; nautilus $argv; end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/konmenel/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

if test -d $HOME/.cargo
    set -Ua fish_user_paths $HOME/.cargo/bin
end

set -x PATH $HOME/.local/bin $PATH

set -x TBB_HOME /usr/lib/x86_64-linux-gnu
set -x BOOST_HOME /usr/lib/x86_64-linux-gnu
set -x SIMBODY_HOME $HOME/simbody
set -x GTEST_ROOT /home/konmenel/gtest
set -x CHRONO_HOME $HOME/.local/share/chrono
set -x HDF5_ROOT /usr/local/hdf5-1.12.2
set -x DUALSPH_HOME $HOME/DualSPHysics_v5.0

set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH $GTEST_ROOT/lib $SIMBODY_HOME/lib\
set -x CPLUS_INCLUDE_PATH $CPLUS_INCLUDE_PATH $SIMBODY_HOME/include $GTEST_ROOT/include\

set -x WF_API_TOKEN "68e39a7412544c978500e02c85ef87d7"

# Env variables for ichec
set -x ICHEC_HOME "konmenel@kay.ichec.ie:~"
set -x ICHEC_WORK "konmenel@kay.ichec.ie:/ichec/work/ndmat033a/constantinos"

# Local customizations
if test -f ~/.fishrc_local
    source ~/.fishrc_local
end
