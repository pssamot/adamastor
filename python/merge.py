
# MergeSort(arr[], l,  r)
# If r > l
#  1. Find the middle point to divide the array into two halves:  
#          middle m = (l+r)/2
#  2. Call mergeSort for first half:   
#          Call mergeSort(arr, l, m)
#  3. Call mergeSort for second half:
#          Call mergeSort(arr, m+1, r)
#  4. Merge the two halves sorted in step 2 and 3:
#          Call merge(arr, l, m, r)
def mergeSort(arr, count):
	if len(arr) < 2:
		return

	mid = len(arr)//2

	l, r = arr[:mid], arr[mid:]

	mergeSort(l,count)
	mergeSort(r,count)

	order = []

	i = j = k = 0

	while i < len(l) and j < len(r):
		if l[i] > r[j]:
			count += 1
			print("swap")			
			arr[k] = r[j]
			j += 1
		else: 
			arr[k] = l[i]
			i += 1
		k += 1

	while i < len(l):
		arr[k] = l[i]
		k += 1
		i += 1
	while j < len(l):
		arr[k] = r[j]
		k += 1
		j += 1		

def printList(arr):
    for i in range(len(arr)):
        print(arr[i], end=" ")
    print()

def mergeSortInversions(arr):
    if len(arr) == 1:
        return arr, 0
    else:
    	mid = len(arr)//2
    	a = arr[:mid]
    	b = arr[mid:]
    	a, ai = mergeSortInversions(a)
    	b, bi = mergeSortInversions(b)
    	c = []
    	i = 0
    	j = 0
    	inversions = 0 + ai + bi
    	print("a: ", a, ai)
    	print("b: ", b, bi)
    	print("pre inv", inversions)
    	while i < len(a) and j < len(b):
    		if a[i] <= b[j]:
    			c.append(a[i])
    			i += 1
    		else:
    			c.append(b[j])
    			j += 1
    			inversions += (len(a)-i)
    			print("inv",inversions,c)
    			print("len",(len(a)-i))
    	c += a[i:]
    	c += b[j:]
    return c, inversions    
 
 
# Driver Code
if __name__ == '__main__':
    arr = [12, 11, 13, 5, 6, 7]
    arre = [12, 11, 13, 5, 6, 7]
    print("Given array is", end="\n")
    printList(arr)
    count = 0
    print(mergeSortInversions(arre))
    mergeSort(arr,count)
    print("Sorted array is: ", end="\n")
    printList(arr)
    print("count: ", count)



