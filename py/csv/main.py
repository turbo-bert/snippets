import csv
import copy

with open("test.csv", newline='') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',', quotechar='"')


    hdrs=[]
    h_mode=True
    for row in csvreader:
        if h_mode:
            h_mode = False
            hdrs = copy.deepcopy(row)
            continue

        rd = dict(zip(hdrs, row))
        print(rd)
