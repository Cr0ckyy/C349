import UIKit

class Animal {
    func speak() {
        print("Unknown")
    }
}
class Dog : Animal {
    override func speak() {
        print("Woof")
    }
}
class Cat : Animal {
    override func speak() {
        print("Meow")
    }
}

var dog = Dog()
dog.speak()
var cat = Cat()
cat.speak()
