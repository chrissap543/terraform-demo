import json
import sys

with open('plan.json', 'r') as file:
    data = json.load(file)

for i in data['planned_values']['root_module']['resources']:
    if i['values']['tags'] is None or "Name" not in i['values']['tags']:
        sys.exit(1)