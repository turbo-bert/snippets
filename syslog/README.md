/etc/rsyslog.conf

module(load="imudp")
input(type="imudp" port="514")
module(load="imtcp")
input(type="imtcp" port="514")

systemctl restart rsyslog

*.* @@10.0.0.2:514

*.* action(type="omfwd" target="docker.host.internal" port="10514" protocol="tcp")

ufw allow from 10.0.0.0/16 to any port 514
tail -f /var/log/syslog

CustomLog "|/usr/bin/logger -t apache2-access" combined
ErrorLog "|/usr/bin/logger -t apache2-error"
