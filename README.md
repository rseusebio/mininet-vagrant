# Mininet VM with Vagrant

Install Vagrant, and run the VM with `vagrant up`!

## Usage

* Install [Vagrant](https://www.vagrantup.com/downloads).
* Clone/download this repo and `cd` into the directory.
* Run `vagrant up`. This should set up your VM in a few minutes.
* Run `vagrant ssh` in the directory to SSH into the VM.
* Run `sudo mn --test pingall` within the VM to test that Mininet has been installed properly.
* Run `cd bufferbloat`. This should move you to the folder where the code is.
* Run `sudo ./run.sh` to execute the experiment with TCP Reno.
* Run `sudo ./run_bbr.sh` to execute the experiment with TCP BBR.
