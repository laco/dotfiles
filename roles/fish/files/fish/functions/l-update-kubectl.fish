function l-update-kubectl -d 'Update kubectl to latest release'
    set KUBECTL_LATEST (curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
    if test -x $HOME/bin/kubectl
        set KUBECTL_CURRENT (kubectl version --client --short=true -o json | jq -r ".clientVersion.gitVersion")
    else
        set KUBECTL_CURRENT "missing"
    end

    if test $KUBECTL_LATEST != $KUBECTL_CURRENT
        curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_LATEST/bin/linux/amd64/kubectl
        chmod +x kubectl
        mv kubectl ~/bin/
    else
        echo "Skipping, kubectl with version $KUBECTL_CURRENT already installed."
    end
end
