import UIKit

var a: String? = "a"
var b: String = "b"
var result: String = a ?? b
print(result)

a = nil
result = a ?? b
print(result)
