import datetime


too_day = datetime.datetime.now(datetime.UTC)

#or from string YYYY-MM-DD
too_day = datetime.datetime.fromisoformat("2012-08-09T00:00:00+00:00")


some_days = [ too_day - datetime.timedelta(days=x) for x in range(7)]

print(some_days)

for x in some_days:
    print(x.strftime("%Y-%m-%d") + x.strftime(" %a"))
