public class Node{
	var value: String
	var next: Node?
	
	init(value: String) {
		self.value = value		 		
	} 	
}

public class LinkedList{
	var head: Node?
	var tail: Node?
	var size: Int = 0

	public var isEmpty: Bool{
		return head == nil
	}

	public var getHead: Node? {
		return self.head
	}

	public var getTail: Node? {
		return self.tail
	}

	public func add(value: String){
		let newnode = Node(value: value)
		if let tailnode = self.tail{
			tailnode.next = newnode
		}else{
			self.head = newnode
		}
		self.tail = newnode
		size += 1
	}
	public func pushFront(value: String){
		let newnode = Node(value:value)
		if self.isEmpty{
			self.tail = newnode
		}else{
			newnode.next = self.head
		}
		
		self.head = newnode
		self.size += 1
	}
	public func print(){
		var index = 0
		var current = self.head
		Swift.print("size: \(self.size)")
		while current != nil{
			Swift.print("index \(String(index)) value: \(String(current!.value)) ")
			index += 1
			current = current!.next
		}
	}
	// Removes the first node appearance with the value 
	public func removeAt(value: String){
		var current = self.head
		var previous = self.head // double linked list in future 
		if self.isEmpty{
			Swift.print("Empty")
			return
		} 
		if self.head!.value == value {
			self.head = self.head!.next
			self.size -= 1
			return
		}
		while current != nil{
			if current!.value == value{
				previous!.next = current!.next
				self.size -= 1
				return
			}
			previous = current
			current = current!.next
		}
		Swift.print("not found")
	}
	public func reverse() {
		var current = self.head
		var next: Node? = nil, prev: Node? = nil
		while current != nil{
			if prev == nil{
				self.tail = current
			}
			next = current!.next
			current!.next = prev
			prev = current
			current = next
		}
		self.head = prev
	}
	// space complexity of O(2N), since we have to create duplicate a linked list
	public func reversePushFront(){
		var newlinked = LinkedList()
		var current = self.head
		while current != nil{
			newlinked.pushFront(value: current!.value)
			current = current!.next
		}
		self.head = newlinked.head
	}
}


let dogBreeds = LinkedList()
dogBreeds.add(value: "Labrador")
dogBreeds.add(value: "Bulldog")
dogBreeds.add(value: "Beagle")
dogBreeds.add(value: "Husky")
dogBreeds.print()
dogBreeds.reverse()
dogBreeds.print()

if false {
	//Push front
	dogBreeds.pushFront(value: "Caniche")
	dogBreeds.print()
	//remove by value
	dogBreeds.removeAt(value: "Beagle")
	dogBreeds.print()
}








