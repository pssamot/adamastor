def decodeRec(s):
	if len(s) == 0:
		return 1 
	if s[0] == '0':
		return 0
	results = decodeRec(s[1:])
	if int(s[:2]) >= 10 and int(s[:2]) <=26:
		results += decodeRec(s[2:])
	return results

def helper(s,mem):
	if len(s) == 0:
		return 1 
	if s[0] == '0':
		return 0	
	if mem.get(s, False) != False:
		return mem[s]  
	results = helper(s[1:],mem)
	if int(s[:2]) >= 10 and int(s[:2]) <=26:
		results += helper(s[2:],mem)
	mem[s] = results
	return mem[s]	

def decodeD(s):
	mem = {}
	return helper(s,mem)


print(decodeD('012')) 
print(decodeD('12')) 
print(decodeD('226'))
print(decodeD('111111111111111111111111111111111111111111111'))