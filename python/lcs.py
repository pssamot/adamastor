#Longest Common Subsequence 
def recursive(s1,s2):
	if len(s1) == 0 or len(s2)==0:
		return 0
	elif s1[-1] == s2[-1]:
		result = 1 + recursive(s1[:-1],s2[:-1])
	else:
		result = max(recursive(s1[:-1],s2), recursive(s1,s2[:-1]))
	return result

def memory(s1,s2):
	m = len(s1)
	n = len(s2)

	#create empty array
	L = [[None]*(n+1) for i in range(m+1)]

	for i in range(m+1):
		for j in range(n+1):
			if i == 0 or j == 0:
				L[i][j] = 0
			elif s1[i-1] == s2[j-1]:
				L[i][j] = 1 + L[i-1][j-1]
			else:
				L[i][j] = max(L[i-1][j], L[i][j-1])
	return L[m][n]


def lcs(X , Y): 
    # find the length of the strings 
    m = len(X) 
    n = len(Y) 
  
    # declaring the array for storing the dp values 
    L = [[None]*(n+1) for i in range(m+1)] 
  
    """Following steps build L[m+1][n+1] in bottom up fashion 
    Note: L[i][j] contains length of LCS of X[0..i-1] 
    and Y[0..j-1]"""
    for i in range(m+1): 
        for j in range(n+1): 
            if i == 0 or j == 0 : 
                L[i][j] = 0
            elif X[i-1] == Y[j-1]: 
                L[i][j] = L[i-1][j-1]+1
            else: 
                L[i][j] = max(L[i-1][j] , L[i][j-1]) 
  
    # L[m][n] contains the length of LCS of X[0..n-1] & Y[0..m-1] 
    return L[m][n] 

print(recursive("AGGTAB","GXTXAYB"))
print(memory("AGGTAB","GXTXAYB"))
print(lcs("AGGTAB","GXTXAYB"))

