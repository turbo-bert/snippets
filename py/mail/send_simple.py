import smtplib

from email.mime.text import MIMEText

msg=MIMEText("so much text\nyeah\n")
msg["from"] = "bla"
msg["subject"] = "bla2"
msg["to"] = "who@else.com"

server = smtplib.SMTP("mail")
server.send_message(msg)
server.quit()
