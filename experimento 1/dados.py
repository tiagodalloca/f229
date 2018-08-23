import sys

d = sys.argv[1]
f = open("experimento1-dados.csv", "a")
for i in range(20):
    a = input().replace(",", ".")
    if a == 'q':
        break
    f.write(str(d) + "," + a + "\n")
f.close()
