import smtplib

from email.mime.text import MIMEText

msg=MIMEText("so much text\nyeah\n")
msg["from"] = "bla"
msg["subject"] = "bla2"
msg["to"] = "who@else.com"

server = smtplib.SMTP_SSL("mail:465")
server.send_message(msg)
server.quit()
