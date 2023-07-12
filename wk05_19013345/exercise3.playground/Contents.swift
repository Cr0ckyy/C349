import UIKit

var arrays = ["adam", "beth", "charles"]
print(arrays[0])

arrays[0] = "simon"
arrays.insert("kane", at: 0)
arrays.remove(at: 2)
let check:Bool = arrays.contains("charles")
print(arrays.count)

arrays = arrays.sorted()
for i in arrays {
    print(i)
}
