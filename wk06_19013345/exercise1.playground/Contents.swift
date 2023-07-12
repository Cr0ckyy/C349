import UIKit

let input1 = [4, 2, 8]
let input2 = [8, 9, 5, 12, 10]
let input3 = [7, 1, 11, 3, 12, 5]

func findMedian(numberArray: Array<Int>) {
    var output = numberArray
    output = output.sorted()
    if output.count % 2 == 0 {
        let num1 = output[(output.count / 2) - 1]
        let num2 = output[output.count / 2]
        print((num1 + num2) / 2)
    } else {
        print(output[(output.count) / 2])
    }
}

findMedian(numberArray: input1)
findMedian(numberArray: input2)
findMedian(numberArray: input3)
