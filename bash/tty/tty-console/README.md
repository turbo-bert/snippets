# TTY Console

I use this type of application for my scan/print station, 3d Printer, ...

It is very simple. Tested on Raspberry Pi Ubuntu LTS 22.04.

## What does it do?

I replace the default `tty1` console application with a very simple shell input reader that can be used to process your commands as `root`.

## What do I need to do?

You would actually have to implement your own cli that actually does something and will be called by `/usr/local/bin/my-getty.sh`.

So this here only gives you the setup. You will have to create your own control application.
