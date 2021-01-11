// based on https://www.raywenderlich.com/206-swift-algorithm-club-hash-tables
public struct HashTable<Key: Hashable, Value> {

	private typealias Element = (key: Key, value: Value)
	private typealias Bucket = [Element]
	private var buckets: [Bucket]

	private(set) public var count = 0
	public var isEmpty: Bool { 
		return count == 0
	}
	public init(capacity: Int) {
		assert(capacity > 0) 
		buckets = Array<Bucket>(repeating: [], count: capacity)
	}
	private func index(for key: Key) -> Int {
	  return abs(key.hashValue) % buckets.count
	}
	// 1
	public subscript(key: Key) -> Value? {
		get {
			return value(for: key)
		}
		set {
		  if let value = newValue {
		    update(value: value, for: key)
		  }
		}	  
	}

	// 2
	public func value(for key: Key) -> Value? {
	  let index = self.index(for: key)
	  return buckets[index].first { $0.key == key }?.value
	}
	
	@discardableResult
	public mutating func update(value: Value, for key: Key) -> Value? {
	  let index = self.index(for: key)
	  
	  // 1
	  if let (i, element) = buckets[index].enumerated().first(where: { $0.1.key == key }) {
	    let oldValue = element.value
	    buckets[index][i].value = value
	    return oldValue
	  }

	  // 2
	  buckets[index].append((key: key, value: value))
	  count += 1
	  return nil
	}

}

var hashTable = HashTable<String, String>(capacity: 5)
hashTable["firstName"] = "Steve"

if let firstName = hashTable["firstName"] {
  print(firstName)
}

if let lastName = hashTable["lastName"] {
  print(lastName)
} else {
  print("lastName key not in hash table")
}
