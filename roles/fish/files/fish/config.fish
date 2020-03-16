# Adding extra bin folders to PATH
set -x PATH $PATH \
    $HOME/bin/ \
    $HOME/.local/bin/ \
    $HOME/.krew/bin \
    $HOME/.gem/ruby/2.5.0/bin \
    /snap/bin

# Enable docker buildx
set DOCKER_CLI_EXPERIMENTAL enabled

# Install Ruby gems to user home dir
set GEM_HOME (ls -t -U | ruby -e 'puts Gem.user_dir')
set BUNDLE_PATH $GEM_HOME


# Install and bootstrap fisher packages
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# asdf-vm
source ~/.asdf/asdf.fish

# yaml2json
alias yaml2json="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))'"

starship init fish | source
