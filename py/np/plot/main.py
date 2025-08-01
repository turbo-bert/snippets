import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(-2,2,100)
y = x**2

plt.plot(x,y, color="black")

plt.xlabel("X")
plt.ylabel("Y")
plt.title("T")

plt.grid(True)
plt.savefig("test.svg", bbox_inches="tight")
plt.savefig("test.jpg", bbox_inches="tight", dpi=300)
