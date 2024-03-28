#!/bin/bash

vmCount=$(virsh list --all|wc|awk '{print $1}')
vms=$(virsh list --all|tail -n $(( $vmCount - 2 ))|awk '{print $2}')
for i in $vms; do
        snaps=$(virsh snapshot-list --domain $i|tail -n 2| head -n 1|awk '{print $1}')
        if [ "$snaps" = "clear" ]; then
        virsh snapshot-revert --domain $i --snapshotname $snaps
        fi
done
