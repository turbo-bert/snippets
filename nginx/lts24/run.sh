#!/bin/bash


# ssh profile name for remote
H=

# fqdn of remote
HFQDN=

# remote IP4
HIP=

# CONVENIENCE TOOLS

##ssh -q $H "apt update && DEBIAN_FRONTEND=noninteractive apt install -y mc emacs-nox htop iotop iptraf"


# INSTALL NGINX SO IT WILL DEFAULT RESPONSE ON PORT 80 UNENCRYPTED

##ssh -q $H "apt update && apt install -y nginx-full"


# GET ENGINE + CRS + CONNECTOR

##ssh -q $H "apt update && apt install -y libmodsecurity3t64 modsecurity-crs libnginx-mod-http-modsecurity"





##ssh -q $H "mkdir -p /etc/nginx/modsec"

##ssh -q $H "echo 'Include /etc/modsecurity/modsecurity.conf' > /etc/nginx/modsec/main.conf"

##ssh -q $H "echo 'Include /etc/modsecurity/crs/crs-setup.conf' >> /etc/nginx/modsec/main.conf"

##ssh -q $H "echo 'Include /usr/share/modsecurity-crs/rules/*.conf' >> /etc/nginx/modsec/main.conf"

ssh -q $H "echo 'U2VjUnVsZUVuZ2luZSBPbgoKIyBBdWRpdGxvZyAob3B0aW9uYWwsIHNjaHJlaWJ0IHZvbGxzdMOkbmRpZ2UgVHJlZmZlciBpbnMgTG9nKQpTZWNBdWRpdEVuZ2luZSBSZWxldmFudE9ubHkKU2VjQXVkaXRMb2dQYXJ0cyBBQklKREVGSFoKU2VjQXVkaXRMb2cgL3Zhci9sb2cvbW9kc2VjX2F1ZGl0LmxvZwoKIyBSZXF1ZXN0LUJvZHktSGFuZGxpbmcKU2VjUmVxdWVzdEJvZHlBY2Nlc3MgT24KU2VjUmVxdWVzdEJvZHlMaW1pdCAxMzEwNzIwMApTZWNSZXF1ZXN0Qm9keU5vRmlsZXNMaW1pdCAxMzEwNzIKU2VjUmVxdWVzdEJvZHlMaW1pdEFjdGlvbiBSZWplY3QKU2VjUmVxdWVzdEJvZHlKU09ORGVwdGhMaW1pdCA1MTIKCiMgUmVzcG9uc2UtQm9keS1IYW5kbGluZyAobWVpc3QgYXVzIFBlcmZvcm1hbmNlLUdyw7xuZGVuIGF1cykKU2VjUmVzcG9uc2VCb2R5QWNjZXNzIE9mZgoKIyBMb2dmaWxlIGbDvHIgRmVobGVyIC8gUmVnZWx2ZXJsZXR6dW5nZW4KU2VjRGVidWdMb2cgL3Zhci9sb2cvbW9kc2VjX2RlYnVnLmxvZwpTZWNEZWJ1Z0xvZ0xldmVsIDAK' | base64 -d > /etc/modsecurity/modsecurity.conf"







##ssh -q $H "( cd /etc/nginx/sites-enabled && rm -f default )"
##ssh -q $H "( cd /etc/nginx/sites-enabled && ln -s /etc/nginx/sites-available/default-modsecurity.conf )"
##ssh -q $H "systemctl restart nginx"


echo "http://$HIP/?test=../../etc/shadow"

# NOTE: NOW WE HAVE INTERESTING FILES AND DIRECTORIES

# D /usr/share/modsecurity-crs
# D /etc/modsecurity/crs
# F /etc/nginx/modules-enabled/50-mod-http-modsecurity.conf
# F /etc/nginx/sites-available/default-modsecurity.conf
# F /etc/nginx/modsecurity_includes.conf
# F /etc/nginx/modsec/main.conf CUSTOM




# TODO

#         modsecurity on;
#         modsecurity_rules_file /etc/nginx/modsec/main.conf;

# client_max_body_size 16m;      # <= SecRequestBodyLimit in modsecurity.conf
# client_body_buffer_size 128k;
