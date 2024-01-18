import rich
import rich.console
import rich.table


C = rich.console.Console()

t = rich.table.Table(title="abc", row_styles=["dim", ""], box=None, padding=1)
t.add_column("a")
t.add_column("b")

t.add_row("1", "2")
t.add_row("1", "2")
t.add_row("1", "2")
t.add_row("1", "2")
t.add_row("1", "2")

C.print(t)
