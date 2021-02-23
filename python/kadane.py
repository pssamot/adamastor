#kadanes ALGORITHM

def findMaxSubarray(arr):
	mx_c = mx = arr[0]
	for i in range(1,len(arr)):
		mx_c = max(mx_c + arr[i],arr[i])
		if mx_c > mx:
			mx = mx_c
	return mx

print(findMaxSubarray([1,-3,1,2,-1]))
		