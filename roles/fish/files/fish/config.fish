# Adding extra bin folders to PATH
set -x PATH $PATH $HOME/bin/ $HOME/.local/bin/ $HOME/opt/python/bin /snap/bin

# Install and bootstrap fisher packages
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

starship init fish | source