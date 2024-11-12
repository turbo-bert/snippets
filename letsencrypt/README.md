timeout 20 certbot certonly --manual --agree-tos --no-eff-email -m <EMAILADRESSE> --preferred-challenges dns -d <FQDN>

Certificate is saved at: /etc/letsencrypt/live/<FQDN>/fullchain.pem
Key is saved at:         /etc/letsencrypt/live/<FQDN>/privkey.pem
