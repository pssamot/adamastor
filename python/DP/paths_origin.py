#https://www.geeksforgeeks.org/counts-paths-point-reach-origin/

def getCount(x,y):

	dp = [ [0 for i in range(x+1)] for i in range(y+1) ] 

	for i in range(y+1):
		dp[i][0] = 1
	for i in range(x+1):
		dp[0][i] = 1
	
	for i in range(1,y+1):
		for j in range(1,x+1):
			dp[i][j] = dp[i][j-1] + dp[i-1][j]

	return dp[y][x]

print(getCount(3,6))