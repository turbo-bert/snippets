#tstamp = datetime.datetime.utcnow().strftime("%Y-%m-%dT%H%M%S")
import datetime
tstamp = datetime.datetime.now(datetime.UTC).strftime("%Y-%m-%dT%H%M%S")
print(tstamp)



t1 = datetime.datetime.fromisoformat("2012-08-09T00:00:00+00:00")
t2 = t1 + datetime.timedelta(minutes=60)

print(t1.isoformat())
print(t2.isoformat())

print(int(t1.timestamp()))
print(int(t2.timestamp()))
