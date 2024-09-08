import subprocess
import mxee.helper
import os

# note works with mysql passwords only when they don't neede escaping


#h_ssh = ""
h_ssh = os.getenv('SSH_HOST', '')

#h_actual = "127.0.0.1"
h_actual = os.getenv('HOST_ACTUAL', "127.0.0.1")

#d = "testdb"
d = os.getenv('HOST_DB', "testdb")

#t = "test_table"
t = os.getenv('MYSQL_TABLE', 'test_table')

#u = "root"
u = os.getenv('MYSQL_USER', 'root')

#pw = "foo123"
pw = os.getenv('MYSQL_PW', 'foo123')

#port = "33060"
port = os.getenv('MYSQL_PORT', '33060')


my_tempdir = subprocess.check_output("""/bin/bash -c 'mktemp -d /tmp/tabledump-XXXXXXXX'""", shell=True, universal_newlines=True).strip().split("\n")[0].strip()

sql = "SELECT * FROM %s" % t
cmd = """mysql --batch -u %s -p --password=%s -h %s -P %s -e '%s' %s""" % (u, pw, h_actual, port, sql, d)

if h_ssh != "":
    cmd = "ssh %s %s" % (h_ssh, cmd)


tsvfilename = my_tempdir + "/out"
subprocess.call("""/bin/bash -c "%s >%s" """ % (cmd, tsvfilename), shell=True)

data = None
lines = None
with open(tsvfilename, 'r') as f:
    lines = f.read().strip().split("\n")

data = [line.strip().split("\t") for line in lines]

subprocess.call("""/bin/bash -c "rm -fr %s" """ % (my_tempdir), shell=True)

mxee.helper.xlsx_out("out.xlsx", {t:{'data':data}})
