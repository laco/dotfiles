function kubectl-update -d 'Update kubectl to latest release'
    curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl ; and chmod +x kubectl ; and mv kubectl ~/bin/
end
