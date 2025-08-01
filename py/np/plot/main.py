import numpy as np
import matplotlib.pyplot as plt
import math

x = np.linspace(0,1,250)

t=0.12
f = lambda x: 5*t*(0.2969*np.sqrt(x) - 0.1260 * x - 0.3516*x**2 + 0.2843*x**3-0.1015*x**4)
y = f(x)



plt.plot(x,y, color="black")
plt.plot(x,(-1)*y, color="black")

plt.xlabel("X")
plt.ylabel("Y")
plt.title("T")
plt.axis('equal')
plt.grid(True)
plt.savefig("test.svg", bbox_inches="tight")
plt.savefig("test.jpg", bbox_inches="tight", dpi=300)
