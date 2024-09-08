import subprocess
import mxee.helper

# note works with mysql passwords only when they don't neede escaping

h_ssh = ""
h_actual = "127.0.0.1"
d = "testdb"
t = "test_table"
u = "root"
pw = "foo123"
port = "33060"

my_tempdir = subprocess.check_output("""/bin/bash -c 'mktemp -d /tmp/tabledump-XXXXXXXX'""", shell=True, universal_newlines=True).strip().split("\n")[0].strip()

sql = "SELECT * FROM %s" % t
cmd = """mysql --batch -u %s -p --password=%s -h %s -P %s -e '%s' %s""" % (u, pw, h_actual, port, sql, d)

if h_ssh != "":
    cmd = "ssh %s %s" % (h_ssh, cmd)

subprocess.call("""/bin/bash -c "%s >%s" """ % (cmd, my_tempdir + "/out"), shell=True)

subprocess.call("""/bin/bash -c "rm -fr %s" """ % (my_tempdir), shell=True)
