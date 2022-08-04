#!/bin/bash

# Note: Mininet must be run as root.  So invoke this shell script
# using sudo.

time=110
bwnet=1.5 # (Mb/s)
# TODO: If you want the RTT to be 20ms what should the delay on each
# link be?  Set this value correctly.
delay=5

iperf_port=5001
cong="bbr"
for qsize in 20 100; do
    dir=$cong-bb-q$qsize-t$time

    # TODO: Run bufferbloat.py here...
    # python3 ...
    
    # clean and exit a mininet network
    sudo mn -c

    echo "about to execute bufferbloat script with params -d $dir --maxq $qsize -b $bwnet --delay $delay --cong $cong"

    sudo python3 bufferbloat.py -d $dir --maxq $qsize -t $time -b $bwnet --delay $delay --cong $cong

    # TODO: Ensure the input file names match the ones you use in
    # bufferbloat.py script.  Also ensure the plot file names match
    # the required naming convention when submitting your tarball.
    python3 plot_queue.py -f $dir/q.txt -o $dir/bbr-buffer-q$qsize.png
    python3 plot_ping.py -f $dir/ping.txt -o $dir/bbr-rtt-q$qsize.png
done
