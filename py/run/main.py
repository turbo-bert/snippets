import subprocess

#stderr not captured
try:
    stdout_lines = subprocess.check_output("ls -al; exit 8;", shell=True, universal_newlines=True).replace("\r", "").strip().split("\n")
except subprocess.CalledProcessError as e:
    print("exit code = %d" % e.returncode)
