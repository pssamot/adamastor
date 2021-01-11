// BASED ON: https://www.coursera.org/lecture/data-structures/pseudocode-HxQo9
class Heap: CustomStringConvertible{
	private var data = [Int]()
	public var size = 0
	init(root: Int) {
		self.data.append(root)
		self.size += 1
	}
	var description: String{
		return data.description
	}

	public func getParent(index: Int) -> Int{
		return Int(index/2) - 1
	}
	public func getLeftChild(index: Int) -> Int{
		return Int(index*2) - 1
	}
	public func getRightChild(index: Int) -> Int{
		return Int(index*2 + 1) - 1
	}
	public func siftDown(index: Int){
		// print("\n -- new sift down -> \(self.data[index])  --")
		var max_index = index
		//this will solve the problem of array start in 0
		// print("c")
		let c = (self.getParent(index: index) == -1) ? 1 : 0 
		// print("l")
		let l = self.getLeftChild(index: index+c)
		// print("greater left \(self.data[l]) \(self.data[max_index])")
		if l < self.data.count && self.data[l] > self.data[max_index]{
			max_index = l
		}
		// print("max left \(max_index) --> \(self.data[max_index])")
		let r = self.getRightChild(index: index+c)
		if r < self.data.count && self.data[r] > self.data[max_index]{
			max_index = r
		}
		// print("max right \(max_index) --> \(self.data[max_index])")

		// print("check is index is min \(index) != \(max_index)")
		if index != max_index {
			self.data.swapAt(index, max_index)
			// print("sift: after swap: \(self.data)")
			self.siftDown(index: max_index)
		}
	}
	public func siftUp(index: Int){
		var i = index
		while i > 0 && self.data[i] > self.data[ self.getParent(index: i+1) ]{
			self.data.swapAt(i, self.getParent(index: i+1))
			i = self.getParent(index: i+1)
		}
	}
	public func insert(priority: Int){
		self.size += 1
		self.data.append(priority)
		self.siftUp(index: self.size-1)
	}
	public func extractMax() -> Int {
		// print("extractMax1 \(self.data)")
		let result = self.data[0]
		self.data[0] = self.data.last!
		// print("extractMax2 \(self.data)")
		self.data.removeLast()
		// print("extractMax3 \(self.data)")
		self.siftDown(index: 0)
		// print("extractMax4 \(self.data)")
		return result
	}
	public func remove(index: Int){
		// print("\n\n --- REMOVE ---")
		// print(self.data)
		self.data[index-1] = 99999 // +Inf
		// print(self.data)
		self.siftUp(index: index-1)
		// print(self.data)
		var _ = self.extractMax()
		// print("pos extractMax \(self.data)")
	}
	public func changePriority(index: Int, priority: Int){
		if index < 1 || index > self.data.count{
			print("not in range")
			return 
		}
		let old_priority = self.data[index-1]  
		self.data[index-1] = priority
		if priority > old_priority {
			self.siftUp(index: index-1)  	
		}else{
			self.siftDown(index: index-1)
		}

	} 
}

// the arguments are in mathemathics mode i.e. 1,2,3,..,n
let priority = Heap(root: 29)
priority.insert(priority: 42)
priority.insert(priority: 18)
priority.insert(priority: 14)
priority.insert(priority: 7)
priority.insert(priority: 18)
priority.insert(priority: 12)
priority.insert(priority: 11)

print("first print")
print(priority)

print("\nextract max")
print("max: \(priority.extractMax())")
print(priority)

print("\nremove 6 (6-1)")
priority.remove(index: 4)
print(priority)

print("\nchange priority index 6 (6-1) to 55")
priority.changePriority(index: 6, priority: 55)
print(priority)
