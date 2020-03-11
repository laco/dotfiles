function l-update-faas-cli -d 'Update faas-cli to latest release'
    set faas_cli_version (curl -sI https://github.com/openfaas/faas-cli/releases/latest | grep Location | awk -F"/" '{ printf "%s", $NF }' | tr -d '\r')
    curl -Lo faas-cli https://github.com/openfaas/faas-cli/releases/download/$faas_cli_version/faas-cli ; and chmod +x faas-cli; and mv faas-cli ~/bin/
end
