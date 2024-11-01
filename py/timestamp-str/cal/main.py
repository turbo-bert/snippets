import datetime


too_day = datetime.datetime.now(datetime.UTC)

some_days = [ too_day - datetime.timedelta(days=x) for x in range(7)]

for x in some_days:
    print(x.strftime("%Y-%m-%d") + x.strftime(" %a"))
