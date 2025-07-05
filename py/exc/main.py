import rich.console
import rich.traceback

console = rich.console.Console()
rich.traceback.install(console=console, show_locals=True)

try:
    x = int("20349857gh045gw0487h")
except:
    console.print_exception()
