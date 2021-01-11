import CoreFoundation

class ParkBenchTimer {

    let startTime:CFAbsoluteTime
    var endTime:CFAbsoluteTime?

    init() {
        startTime = CFAbsoluteTimeGetCurrent()
    }

    func stop() -> CFAbsoluteTime {
        endTime = CFAbsoluteTimeGetCurrent()

        return duration!
    }

    var duration:CFAbsoluteTime? {
        if let endTime = endTime {
            return endTime - startTime
        } else {
            return nil
        }
    }
}
class Node: CustomStringConvertible{
	var value: String
	var children: [Node] = []
	weak var parent: Node? // add the parent property
	init(value: String) {
		self.value = value
	}
	func add(child: Node) {
		children.append(child)
    	child.parent = self
	}
	var description: String{
    	// 3
	    var text = "\(value)"
	    
	   // 4
	    if !children.isEmpty {
	      text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
	    }
	    return text
	  }
}

func searchBFS_iterative(value: String, root: Node ) -> Node? {
	var nodes: [Node] = []
	nodes.append(root)
	while nodes.count > 0 {
		if nodes[0].value == value {
			return nodes[0]
		}else {
			if nodes[0].children.count > 0 {
				nodes.append(contentsOf: nodes[0].children)
			}
			nodes.removeFirst()
		}
	}
	return nil
}

func searchBFS_recursive(value: String, queue: [Node] ) -> Node? {
	var current_queue = queue 
	if queue.count == 0{
		return nil
	}
	if queue[0].value == value {
		return queue[0]
	}else {
		if queue[0].children.count > 0 {
			current_queue.append(contentsOf: queue[0].children)
		}
		current_queue.removeFirst()
	}
	return searchBFS_recursive(value:value, queue:current_queue)
}

func searchDFS_iterative(value: String, stack: [Node] ) -> Node? {
	var new_stack = stack
	while new_stack.count > 0 {
		// print(new_stack)
		if new_stack[0].value == value {
			return new_stack[0]
		}else {
			let children = new_stack[0].children
			new_stack.removeFirst()
			if children.count > 0 {
				new_stack.insert(contentsOf: children, at: 0)
			}
			
		}
	}
	return nil
}

func searchDFS_recursive(value: String, stack: [Node] ) -> Node? {
	var new_stack = stack
	if new_stack.count == 0{
		return nil
	}

	if new_stack[0].value == value {
		return new_stack[0]
	}else {
		let children = new_stack[0].children
		new_stack.removeFirst()
		if children.count > 0 {
			new_stack.insert(contentsOf: children, at: 0)
		}
		
	}
	return searchDFS_iterative(value: value, stack: new_stack)
}



let beverages = Node(value: "beverages")

let hotBeverages = Node(value: "hot")
let coldBeverages = Node(value: "cold")

beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)

let ice = Node(value: "ice")
let coca = Node(value: "coca")
let fanta = Node(value: "fanta")

coldBeverages.add(child: ice)
coldBeverages.add(child: coca)
coldBeverages.add(child: fanta)

let pessogo = Node(value: "pessefo")
let manga = Node(value: "manga")
let limao = Node(value: "limao")

ice.add(child: pessogo)
ice.add(child: manga)
ice.add(child: limao)

print(beverages)


//  --- BFS iterative and recursive-----
print("\n BFS")
let timer1 = ParkBenchTimer()
if let found = searchBFS_iterative(value: "manga", root: beverages){
	print("found: \(found)")
}else{
	print("notfoun")
}
print("The iterative BFS took \(timer1.stop()) seconds.")

let timer = ParkBenchTimer()
if let found2 = searchBFS_recursive(value: "manga", queue: [beverages]){
	print("found: \(found2)")
}else{
	print("notfoun")
}
print("The recursive BFS took \(timer.stop()) seconds.")


//  --- DFS iterative and recursive-----
print("\n \n DFS")
let timer2 = ParkBenchTimer()
if let found = searchDFS_iterative(value: "fanta", stack: [beverages]){
	print("found: \(found)")
}else{
	print("notfoun")
}
print("The iterative DFS took \(timer2.stop()) seconds.")

let timer3 = ParkBenchTimer()
if let found2 = searchDFS_recursive(value: "fanta", stack: [beverages]){
	print("found: \(found2)")
}else{
	print("notfoun")
}
print("The recursive DFS took \(timer3.stop()) seconds.")






