import sys
import email.parser
import email.header


raw = sys.stdin.buffer.read() # read bytes
#lines = raw.strip().split("\n")

with open("/tmp/mail.dat", "wb") as f:
    f.write(raw)

parser = email.parser.BytesParser()
#msgbytes = raw.encode("ASCII")
msgbytes = raw
parsed_msg = parser.parsebytes(msgbytes)


body = ""
for part in parsed_msg.walk():
    if part.get_content_type() == "text/plain":
        body += part.get_payload(decode=True).decode(part.get_charsets()[0])
    if part.get_content_type() == "text/html":
        body += part.get_payload(decode=True).decode(part.get_charsets()[0])


parts = body.split('<a href="')

with open("/tmp/mail_plain", "w") as f:
    f.write("FROM         %s\n" % parsed_msg["FROM"])
    f.write("TO           %s\n" % parsed_msg["TO"])
    f.write("CC           %s\n" % parsed_msg["CC"])
    f.write("\n")
    f.write("DATE         %s\n" % parsed_msg["DATE"])
    f.write("\n")
    f.write("SUBJECT      %s\n" % parsed_msg["SUBJECT"])
    f.write("\n")
    sub_dec="same"
    if parsed_msg["SUBJECT"].startswith("="):
        sub_tmp = email.header.decode_header(parsed_msg["SUBJECT"])[0]
        (sub_bytes, sub_enc) = sub_tmp
        if sub_enc == "utf-8":
            sub_dec = sub_bytes.decode("utf-8")
        else:
            sub_dec = "unknown %s" % sub_enc
    
    f.write("SUBJECT-DEC  %s\n" % sub_dec)
    f.write("\n")
    for p in parts:
        if p.startswith("https"):
            pp = p.split('"')[0]
            f.write(pp + "\n")

parts2 = body.split('https://')

if not parts2[0].startswith("https://") and len(parts2) > 1:
    parts2 = parts2[1:]


with open("/tmp/mail_plain", "a") as f:
    f.write("\n")
    for p in parts2:
        pp = p.split(' ')[0]
        if '"' in pp:
            pp = pp.split('"')[0]
        f.write("https://" + pp + "\n")

with open("/tmp/mail_plain", "a") as f:
    f.write("\n\n")
    f.write("="*80)
    f.write("\n\n")
    f.write(body)
    f.write("\n\n")






import subprocess
subprocess.check_output('e /tmp/mail_plain; exit 0', shell=True)
