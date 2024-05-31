import yaml
from rich.pretty import pprint as PP

x = yaml.safe_load(open('fun.yaml', 'r').read())

PP(x)

y = {"stuff": ["to", True, "do"]}

with open('fun_output.yaml', 'w') as f:
    yaml.safe_dump(y, f)

with open('fun_output_multi.yaml', 'w') as f:
    yaml.safe_dump_all([y,y], f)
