// IDEA
// IN A SORTED ARRAY DIVIDE THE ARRAY IN HALF UNTIL YOU FIND
func binary_search(array: [Int], value: Int) -> Bool {
	let middle = array.count/2
	if array[middle] == value{
		return true
	}
	if array.count == 1 {
		return false
	}
	if array[middle] > value {
		return binary_search(array: Array(array[0..<(middle)]), value: value)
	}
	return binary_search(array: Array(array[(middle)...]), value: value)
}

let array = [1,2,3,4,5,6,9,10,12,14,66,77,87,88,89,99,100,123,145,167]

print(binary_search(array: array, value: 168))