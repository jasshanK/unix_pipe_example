# Things to take note
The dev environment is being spun up using Nix Flakes and Python virtual environments. The flake.nix files have been left in the repository to provide a guide on how one might setup their own automation scripts and aliases.

Named pipes are blocking on both read and write, meaning the read operation will wait for a write, and the write operation will wait for a read before executing. An easy way to see this phenomenon is to send the output of `ls` into a named pipe and see how it blocks the terminal from moving on till you use `cat` to read from that pipe.

# Explanation
write.py sends a "PING <n>" message to the named pipe, hardcoded to "named_pipe". 

read.py reads from this named pipe and prints the result to STDOUT. 

The scripts assume that a pipe called "named_pipe" exists and WILL FAIL ungracefully if it does not.
