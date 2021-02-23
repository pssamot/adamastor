#problem from https://www.geeksforgeeks.org/gold-mine-problem/

def getMaxGold(gold, m, n): 
	goldmine = [ [0 for i in range(m)] for i in range(n)]
	for col in range(n-1, -1,-1):
		for row in range(m):
			#right
			if col == n-1:
				right = 0
			else:
				right = goldmine[row][col+1]

			#right down
			if col == n-1 or row == m-1:
				right_down = 0
			else:
				right_down = goldmine[row+1][col+1]

			#right up
			if col == n-1 or row == 0:
				right_up = 0
			else:
				right_up = goldmine[row-1][col+1]			
			goldmine[row][col] = gold[row][col] + max(right,right_up, right_down)

	res = goldmine[0][0]
	for i in range(1,m):
		res = max(res, goldmine[i][0])

	return res

gold = [[1, 3, 1, 5], 
    [2, 2, 4, 1], 
    [5, 0, 2, 3], 
    [0, 6, 1, 2]] 
  
m = 4
n = 4
  
print(getMaxGold(gold, m, n)) 