import rich
import rich.progress
import time


for i in  rich.progress.track(range(1,5), description="blablabl"):
    time.sleep(0.2)
    print(i)
