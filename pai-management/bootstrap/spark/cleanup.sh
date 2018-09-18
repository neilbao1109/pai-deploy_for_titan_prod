#!/bin/bash

echo "delete all resouce in seldon namespaces"
kubectl delete svc --all -n seldon
kubectl delete deploy --all -n seldon
kubectl delete job --all -n seldon
kubectl delete ds --all -n seldon
kubectl delete po --all -n seldon

while [ -n "$(kubectl get po -n seldon)" ];
do
    echo "sleep 5 secs waitting for seldon pod terminate"
    sleep 5
done

if [ -n "$(kubectl get po -n kube-system | grep ^tiller-deploy)" ]; then
    echo "helm reset..."
    helm delete seldon-core-analytics --purge
    helm delete seldon-core --purge
    helm delete seldon-core-crd --purge
    helm reset --force
    echo "helm reset done"

    sleep 5
fi