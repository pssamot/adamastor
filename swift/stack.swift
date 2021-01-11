public class Stack<Element>{
	var data = [Element]()

	public func push(value: Element) {
		self.data.append(value)
	}
	public func pop() -> Element{
		return self.data.removeLast()
	}
}

var stack = Stack<Int>()
stack.push(value: 1)
stack.push(value: 2)
stack.push(value: 3)
print(stack.data)
stack.pop()
print(stack.data)