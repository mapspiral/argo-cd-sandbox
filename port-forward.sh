#!/usr/bin/env bash

declare -i port_number=8000
declare -a processes=()
for pod_name in $(kubectl get pods -n mapspiral --no-headers=true -o name)
do
    echo "Exposing ${pod_name} on port ${port_number}"

    kubectl port-forward -n mapspiral  ${pod_name} ${port_number}:80 2>&1 >/dev/null &

    processes+=( $! )

    port_number+=10
done

sleep 1

read -n 1 -s -r -p "Press any key to stop listening..."

for process in "${processes[@]}"
do
    kill ${process}
done