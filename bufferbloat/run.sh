#!/bin/bash

# Note: Mininet must be run as root.  So invoke this shell script
# using sudo.

time=90
bwnet=1.5
# TODO: If you want the RTT to be 20ms what should the delay on each
# link be?  Set this value correctly.
delay=10

iperf_port=5001

for qsize in 20 100; do
    dir=bb-q$qsize

    # TODO: Run bufferbloat.py here...
    # python3 ...
    
    # clean and exit a mininet network
    sudo mn -c

    echo "about to execute bufferbloat script with params -d $dir --maxq $qsize -b $bwnet --delay $delay"

    sudo python3 bufferbloat.py -d $dir --maxq $qsize -t $time -b $bwnet --delay $delay 

    echo "executed it"

    # TODO: Ensure the input file names match the ones you use in
    # bufferbloat.py script.  Also ensure the plot file names match
    # the required naming convention when submitting your tarball.
    python3 plot_queue.py -f $dir/q.txt -o $dir/reno-buffer-q$qsize.png
    python3 plot_ping.py -f $dir/ping.txt -o $dir/reno-rtt-q$qsize.png
done
