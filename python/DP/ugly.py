def ugly_numbers(n):
	queue = []
	queue.append(1)
	seq = set([1])
	for i in range(n):
		curr = queue.pop(0)
		present_len = len(seq)
		for i in [2,3,5]:
			val = i * curr
			seq.add(val)
			if len(seq) != present_len:
				queue.append(val)
	l = list(seq)
	l.sort()
	print(l)
	return l[n-1]

print(ugly_numbers(7))