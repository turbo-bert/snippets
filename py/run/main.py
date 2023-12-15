import subprocess

subprocess.check_output("ls -al", shell=True, universal_newlines=True)
