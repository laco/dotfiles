function l-minikube-start -d 'Start minikube cluster'
    minikube start \
    --memory=16g \
    --cpus=2 \
    --dns-proxy=true \
    --driver=virtualbox \
    --kubernetes-version=v1.17.3 \
    --bootstrapper=kubeadm \
    --extra-config=kubelet.authentication-token-webhook=true \
    --extra-config=kubelet.authorization-mode=Webhook  \
    --extra-config=scheduler.address=0.0.0.0 \
    --extra-config=controller-manager.address=0.0.0.0
end
