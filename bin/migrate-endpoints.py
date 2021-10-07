#!/usr/bin/env python3

import csv

fields = [
    "infrastructure-funding-statement",
    "collection",
    "organisation",
    "documentation-url",
    "document-url",
    "entry-date",
    "start-date",
    "end-date",
]

ifs = {}
endpoint = {}

for row in csv.DictReader(open("data/infrastructure-funding-statement.csv")):
    ifs[row["infrastructure-funding-statement"]] = row

for row in csv.DictReader(open("collection/endpoint.csv")):
    endpoint[row["endpoint"]] = row

for row in csv.DictReader(open("collection/source.csv")):
    key = row["endpoint"]
    ifs[key] = row
    ifs[key]["infrastructure-funding-statement"] = row["endpoint"]
    ifs[key]["document-url"] = endpoint[key]["endpoint-url"]

w = csv.DictWriter(open("data.csv", "w"), fields, extrasaction='ignore')
w.writeheader()

for key in sorted(ifs):
    w.writerow(ifs[key])
