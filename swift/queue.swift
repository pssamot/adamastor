public class Node<Element>{
	var value: Element
	var next: Node<Element>?
	weak var prev: Node<Element>?
	
	init(value: Element) {
		self.value = value		 		
	} 	
}

public class Queue<Element>{
	var head: Node<Element>?
	var tail: Node<Element>?
	var size: Int = 0
	var isLifo = true

	init(isLifo: Bool) {
		self.isLifo = isLifo
	}

	public var isEmpty: Bool{
		return head == nil
	}

	public var getHead: Node<Element>? {
		return self.head
	}

	public func push(value: Element){
		let newnode = Node<Element>(value:value)
		if self.isEmpty{
			self.tail = newnode
			Swift.print("empty")
		}else{
			newnode.next = self.head
			self.head!.prev = newnode
			Swift.print("notempty")
		}
		self.head = newnode
		self.size += 1
	}
	// time complexity of O(1), since we dont have to iterate over all instances
	public func pop() -> Element {
		var value: Element
		if self.isLifo{
			value = self.head!.value
			self.head = self.head!.next
			self.head!.prev = nil
		}else{
			value = self.tail!.value
			self.tail = self.tail!.prev
			self.tail!.next = nil
		}
		return value
	}

	public func print(){
		var index = 0
		var current = self.head
		Swift.print("size: \(self.size)")
		while current != nil{
			Swift.print("index \(index) value: \(current!.value) ")
			index += 1
			current = current!.next
		}
	}	
}

let queue = Queue<Int>(isLifo: false)
queue.push(value: 1)
queue.push(value: 2)
queue.push(value: 3)
queue.push(value: 4)
queue.print()
queue.pop()
queue.pop()
queue.print()







