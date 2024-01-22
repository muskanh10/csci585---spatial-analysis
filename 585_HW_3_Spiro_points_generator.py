import math
t = 0.00
R = 6.0/1000
r = 1.0/1000
a = 8.0/1000
with open("output_spiro.txt", 'w') as f:
    while t < 16 * math.pi:
        x = (R + r) * math.cos((r / R) * t) - a * math.cos((1 + r / R) * t) -118.2854390
        y = (R + r) * math.sin((r / R) * t) - a * math.sin((1 + r / R) * t) + 34.0205796
        ans=""
        ans+=str(x)+ ',' +str(y)+ ",0\n"
        f.write(ans)
        t=t+0.01