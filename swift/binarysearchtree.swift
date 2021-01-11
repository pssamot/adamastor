class Node: CustomStringConvertible{
	var value: Int
	var left_node : Node?
	var right_node : Node?
	init(value: Int) {
		self.value = value
	}
	func add(value: Int) {
		var atual = Optional(self)
		while atual != nil{
			if value > atual!.value {
				
				if let val = atual!.right_node {
					atual = val
				}else{
					atual!.right_node = Node(value: value)
					return
				}
			}else{
				if let val = atual!.left_node {
					atual = val
				}else{
					atual!.left_node = Node(value: value)
					return
				}
			}
		}
	}
	func insert(node: Node, root: Node) {
		var atual = Optional(root)
		while atual != nil{
			if node.value > atual!.value {
				
				if let val = atual!.right_node {
					atual = val
				}else{
					atual!.right_node = node
					return
				}
			}else{
				if let val = atual!.left_node {
					atual = val
				}else{
					atual!.left_node = node
					return
				}
			}
		}
	}
	public func getMax() -> Int {
		var atual = Optional(self)
		while atual != nil {
			if atual!.right_node != nil{
				atual =  atual!.right_node
			}else{
				return atual!.value
			}
		}
		return atual!.value
	}
	public func getMin(root: Node) -> Node? {
		var atual = Optional(root)
		while atual != nil {
			if atual!.left_node != nil{
				atual =  atual!.left_node
			}else{
				return atual
			}
		}
		return atual
	}
	public func inTree(value: Int) -> Bool{
		var atual = Optional(self)
		while atual != nil {
			if atual!.value == value{
				return true
			}else if value > atual!.value  {
				atual = atual!.right_node
			}else{
				atual = atual!.left_node
			}
		}
		return false
	}
	private func isLeft(parent: Node, child: Node) -> Bool {
		return parent.value > child.value
	}
	public func delete(value: Int, root: Node) {
		var atual = Optional(root)
		var par: Node? = Optional(root) 
		while atual != nil {
			if atual!.value == value{
				//Doesnt have any childs
				if atual!.left_node == nil && atual!.right_node == nil {
					Swift.print("no childs")
					if self.isLeft(parent: par!, child: atual!) {
						Swift.print("Removed: \(par!.left_node!.value)")
						par!.left_node = nil
					}else{
						Swift.print("Removed: \(par!.right_node!.value)")
						par!.right_node = nil
					}
				// Has only one child
				}else if atual!.left_node != nil && atual!.right_node == nil || 
						atual!.left_node == nil && atual!.right_node != nil   {
					Swift.print("1 child")
					if self.isLeft(parent: par!, child: atual!) {
						Swift.print("left Removed: \(par!.left_node!.value)")
						if let n = atual!.left_node{
							par!.left_node = n
						}else{
							par!.left_node = atual!.right_node!
						}
					}else{
						Swift.print("right Removed: \(par!.right_node!.value)")
						if let n = atual!.left_node{
							par!.right_node = n
						}else{
							par!.right_node = atual!.right_node!
						}						
					}
				// Has 2 childs
				}else if atual!.left_node != nil && atual!.right_node != nil{
					if atual!.value == par!.value {
						Swift.print("Cannot remove the root")
						return
					}
					Swift.print("2 childs")
					let sub = self.getMin(root: atual!.right_node!)
					self.delete(value: sub!.value, root: atual!.right_node! )
					sub!.left_node = atual!.left_node!
					sub!.right_node = atual!.right_node!
					if self.isLeft(parent: par!, child: atual!) {
						par!.left_node = sub
					}else{
						par!.right_node = sub
					}
				}
				return
			}else if value > atual!.value  {
				par = atual 
				atual = atual!.right_node
			}else{
				par = atual 
				atual = atual!.left_node
			}
		}
	}
	public func print() {
		var queue: [Node] = []
		queue.append(self)
		var current_level = 0, count_level = 1 
		var track = [Int: Int]()
		var text = ""
		track[current_level] = count_level
		track[current_level+1] = 0
		while queue.count>0{
			track[current_level]! -= 1
			if queue[0].left_node != nil {
				track[current_level + 1 ]! += 1
				queue.append(queue[0].left_node!)
			}
			if queue[0].right_node != nil {
				track[current_level + 1]! += 1
				queue.append(queue[0].right_node!)
			}
			text += " \(queue[0].value)" 
			if track[current_level] == 0 {
				Swift.print(text)
				text = ""
				current_level += 1

				track[current_level+1] = 0
			}
			queue.removeFirst()
		}
	}
	var description: String{
    	// 3
	    var text = "\(value)"
	    
	   // 4
	    if let l = left_node {
	      text += " { left: " + l.description
	    }else{
	    	 text += " { left: "
	    }
	    if let r = right_node {
	      text += " right: " + r.description + "}" 
	    }else{
	    	 text += " right: }"
	    }	    
	    return text
	  }
}

func getSize(root: Node?) -> Int {
	if root == nil {
		return 0
	}
	return 1 + getSize(root: root!.right_node) + getSize(root: root!.left_node)
}

let bst1 = Node(value: 50)
bst1.add(value: 30)
bst1.add(value: 20)
bst1.add(value: 40)
bst1.add(value: 70)
bst1.add(value: 60)
bst1.add(value: 80)
bst1.add(value: 75)
print("-- FIRST --")
print("SIZE: \(getSize(root: bst1))")
bst1.print()
print(" deleted no children ")
bst1.delete(value:20, root: bst1)
print(" deleted one child ")
bst1.delete(value:30, root: bst)
print(" deleted two childs ")
bst1.delete(value:70, root: bst)
bst1.print()

print("\n\n-- SECOND --")
let bst = Node(value: 5)
bst.add(value: -5)
bst.add(value: 30)
bst.add(value: 10)
bst.add(value: 8)
bst.add(value: 12)
bst.add(value: 6)
bst.add(value: 11)
bst.add(value: 35)
bst.add(value: 33)
bst.add(value: 40)
bst.add(value: 36)
bst.add(value: -3)
bst.insert(node: Node(value: -2), root: bst)

print("SIZE: \(getSize(root: bst))")
print("Max: \(bst.getMax())")
print("Min: \(bst.getMin(root: bst)!.value)")	
print("Is 35 in tree: \(bst.inTree(value: 35))")
print("Is 23 in tree: \(bst.inTree(value: 23))")




