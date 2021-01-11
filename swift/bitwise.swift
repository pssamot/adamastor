func pad(string : String, toSize: Int) -> String {
  var padded = string
  for _ in 0..<(toSize - string.count) {
    padded = "0" + padded
  }
    return padded
}
//OPERATORS:

//	~, NOT inverts the bit
print("\n --- NOT Operator ---")
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits  // equals 11110000
print("bits: \(String(initialBits, radix: 2)) \(initialBits)--> \(String(invertedBits, radix: 2)) \(invertedBits) ") 

//	&, AND is one if both bits are one
print("\n --- AND Operator ---")
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // equals 00111100
print("first   \(pad(string: String(firstSixBits, radix: 2), toSize: 8)) \(firstSixBits)")
print("second  \(pad(string: String(lastSixBits, radix: 2), toSize: 8)) \(lastSixBits)")
print("total   \(pad(string: String(middleFourBits, radix: 2), toSize: 8)) \(middleFourBits)")

//	|, OR is one if any bit is one
print("\n --- OR Operator ---")
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // equals 11111110
print("first   \(pad(string: String(someBits, radix: 2), toSize: 8)) \(someBits)")
print("second  \(pad(string: String(moreBits, radix: 2), toSize: 8)) \(moreBits)")
print("total   \(pad(string: String(combinedbits, radix: 2), toSize: 8)) \(combinedbits)")

//	^, XOR is one if bits are differnet
print("\n --- XOR Operator ---")
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // equals 00010001
print("first   \(pad(string: String(firstBits, radix: 2), toSize: 8)) \(firstBits)")
print("second  \(pad(string: String(otherBits, radix: 2), toSize: 8)) \(otherBits)")
print("total   \(pad(string: String(outputBits, radix: 2), toSize: 8)) \(outputBits)")

//	<< LEFT SHIFT the bits move 1 bit to the left
print("\n --- LEFT SHIFT Operator ---")
let shiftBits: UInt8 = 4   // 00000100 in binary
print("original          \(pad(string: String(shiftBits, radix: 2), toSize: 8)) \(shiftBits)")
print("shiffted 1 time   \(pad(string: String(shiftBits << 1 , radix: 2), toSize: 8)) \(shiftBits << 1 )")
print("shiffted 2 time   \(pad(string: String(shiftBits << 2 , radix: 2), toSize: 8)) \(shiftBits << 2 )")
print("shiffted 5 time   \(pad(string: String(shiftBits << 5 , radix: 5), toSize: 8)) \(shiftBits << 5 )")
print("shiffted 6 time   \(pad(string: String(shiftBits << 6 , radix: 6), toSize: 8)) \(shiftBits << 6 )")

//	>>  
print("\n --- RIGHT SHIFT Operator ---")
let right_shiftBits: UInt8 = 4   // 00000100 in binary
print("original          \(pad(string: String(right_shiftBits, radix: 2), toSize: 8)) \(right_shiftBits)")
print("shiffted 1 time   \(pad(string: String(right_shiftBits >> 1 , radix: 2), toSize: 8)) \(right_shiftBits >> 1 )")
print("shiffted 2 time   \(pad(string: String(right_shiftBits >> 2 , radix: 2), toSize: 8)) \(right_shiftBits >> 2 )")
print("shiffted 5 time   \(pad(string: String(right_shiftBits >> 5 , radix: 5), toSize: 8)) \(right_shiftBits >> 5 )")
print("shiffted 6 time   \(pad(string: String(right_shiftBits >> 6 , radix: 6), toSize: 8)) \(right_shiftBits >> 6 )")

