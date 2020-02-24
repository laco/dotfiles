function l-update-krew -d 'Update kubectl to latest release'
    set LATEST (curl -sL https://api.github.com/repos/kubernetes-sigs/krew/releases | jq -r ".[0].tag_name")

    if test -x $HOME/.krew/bin/kubectl-krew
        set CURRENT (kubectl-krew version | grep GitTag | python3 -c "import sys; print(sys.stdin.read().split()[1])")
    else
        set CURRENT "missing"
    end

    if test $LATEST != $CURRENT
        set -x; set temp_dir (mktemp -d); cd "$temp_dir" &&
        curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/download/$LATEST/krew.{tar.gz,yaml}" &&
        tar zxvf krew.tar.gz &&
        set KREWNAME krew-(uname | tr '[:upper:]' '[:lower:]')_amd64 &&
        ./$KREWNAME install \
            --manifest=krew.yaml --archive=krew.tar.gz &&
        set -e KREWNAME; set -e temp_dir
    else
        echo "Skipping, kubectl-krew with version $CURRENT already installed."
    end
end
