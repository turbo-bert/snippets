import csv

with open("test.csv", newline='') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',', quotechar='"')
    for row in csvreader:
        print(" -- ".join(row))
