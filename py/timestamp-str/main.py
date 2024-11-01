#tstamp = datetime.datetime.utcnow().strftime("%Y-%m-%dT%H%M%S")
import datetime
tstamp = datetime.datetime.now(datetime.UTC).strftime("%Y-%m-%dT%H%M%S")
print(tstamp)
