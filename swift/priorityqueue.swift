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
		var max_index = index
		//this will solve the problem of array start in 0
		let c = (self.getParent(index: index) == -1) ? 1 : 0 
		let l = self.getLeftChild(index: index+c)
		if self.data[l] > self.data[max_index]{
			max_index = l
		}
		let r = self.getRightChild(index: index+c)
		if self.data[r] > self.data[max_index]{
			max_index = r
		}
		if index != max_index {
			self.data.swapAt(index, max_index)
		}
	}
	public func siftUp(index: Int){
		var i = index
		while i > 1 && self.data[i-1] > self.data[ self.getParent(index: i) ]{
			self.data.swapAt(i-1, self.getParent(index: i))
			i = self.getParent(index: i)
		}
	}
	public func insert(priority: Int){
		self.size += 1
		self.data.append(priority)
		self.siftUp(index: self.size)
	}
	public func extractMax() -> Int {
		let result = self.data[0]
		self.data[0] = self.data.last!
		self.data.removeLast()
		self.siftDown(index: 0)
		return result
	}
	public func remove(index: Int){
		print(self.data)
		self.data[index] = 99999 // +Inf
		print(self.data)
		self.siftUp(index: index)
		var _ = self.extractMax()
	}
}

let priority = Heap(root: 29)
priority.insert(priority: 42)
priority.insert(priority: 18)
priority.insert(priority: 14)
priority.insert(priority: 7)
priority.insert(priority: 18)
priority.insert(priority: 12)
priority.insert(priority: 11)
priority.insert(priority: 5)

print(priority)
print(priority.extractMax())
print(priority)
priority.remove(index: 5)
print(priority)
