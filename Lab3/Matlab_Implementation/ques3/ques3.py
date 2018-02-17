from math import exp,sqrt

def recurse(n,m,s,r,M,p,u,d,markov,del_t):
	key=(m,s)
	if key in markov:
		return markov[key]
	if n==M:
		markov[key]=m-s
		return markov[key]

	a1=recurse(n+1,max(m,u*s),u*s,r,M,p,u,d,markov,del_t)
	a2=recurse(n+1,m,d*s,r,M,p,u,d,markov,del_t)
	markov[key]=exp(-r*del_t)*(p*a1+(1-p)*a2)
	return markov[key]


def lookback(s,sig,r,T,M):
	del_t=T/M
	u=exp((sig*sqrt(del_t))+(r-(sig*sig)/2)*del_t)
	d=exp((-sig*sqrt(del_t))+(r-(sig*sig)/2)*del_t)
	p=(exp(r*del_t)-d)/(u-d)
	markov=dict()
	recurse(0,s,s,r,M,p,u,d,markov,del_t)
	return [markov,markov[(s,s)]]

def printval(matrix):
	strg = ""
	for i in range(32):
		for j in range(6):
			strg = strg + str(matrix[i][j]) + " "
		strg = strg + "\n"
	return strg

f = open("val.txt", "w")

S=100
T=1
r=0.08
sig=0.2
M=[5,10,25,50]
for x in M:
	[matrix,ans]=lookback(S,sig,r,T,x)
	print("Option Price at M =",x,": ",ans)
	if x==5:
		for x in matrix:
			print(x,":",matrix[x],"\n")
			f.write(str(x))
			f.write(" :")
			f.write(str(matrix[x]))
			f.write("\n")
		print("Option Price at M= 5 : ",ans)
f.close()


