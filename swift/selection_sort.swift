// Puts the minimum always in first place
// 
func selectionSort(arr: [Int]) -> [Int] {
	var min = 9999, min_i = 0
	var array = arr
	for i in 0..<array.count {
		min = array[i]
		min_i = i
		for j in i..<array.count {
			if array[j] < min {
				min_i = j
				min = array[j]
			}
		}
		array.swapAt(i,min_i)
		print(array)
	}
	return array
}

let arr = [64, 25, 12, 22, 11]
print(arr)
print(selectionSort(arr: arr))