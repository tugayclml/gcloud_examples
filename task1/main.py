import os
import sys

fn = sys.argv[1]
if os.path.exists(fn):
    file = open(fn)
    lines = file.readlines()

    user_with_id = {}
    duplicated_users = {}

    for line in lines:
        splited_line = line.split(':')
        user_with_id[splited_line[0]] = splited_line[1]

    for key, value in user_with_id.items():
        duplicated_users.setdefault(value, set()).add(key)

    for key, values in duplicated_users.items():
        if len(values) > 1:
            print(key + ":" + str(values))
else:
    print("File does not exists!")