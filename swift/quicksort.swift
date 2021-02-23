
public func quicksortNaive(_ a: [Int]) -> [Int] {
	guard a.count > 1 else { // 1
		return a
	}
	let pivot = a[a.count / 2] // 2
	let less = a.filter { $0 < pivot } // 3
	let equal = a.filter { $0 == pivot }
	let greater = a.filter { $0 > pivot }
	return quicksortNaive(less) + equal + quicksortNaive(greater) // 4
}

func quickSort2(_ input: [Int], startIndex:Int, endIndex: Int)-> [Int] {
    var inputArray = input
    if startIndex<endIndex {
        let pivot = inputArray[endIndex]
        var index = startIndex

        for demo in startIndex..<endIndex {
            if inputArray[demo] <= pivot {
                (inputArray[index], inputArray[demo]) = (inputArray[demo], inputArray[index])
                index += 1
            }
        }
        (inputArray[index], inputArray[endIndex]) = (inputArray[endIndex], inputArray[index])
        inputArray = quickSort2(inputArray, startIndex: startIndex, endIndex: index-1)
        inputArray = quickSort2(inputArray, startIndex: index+1, endIndex: endIndex)
    }
    return inputArray
}

let arr = [64, 25, 12, 22, 11]
print(arr)
print(quicksortNaive(arr))
print(quickSort2(arr, startIndex:0, endIndex: arr.count-1 ))