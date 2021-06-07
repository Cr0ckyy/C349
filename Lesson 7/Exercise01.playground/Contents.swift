import UIKit

func printRepeat(text: String?, times: Int?) {
    guard let times = times, times != 0 else {
        print("unable to proceed, times is 0")
        return
    }
    guard let text = text, text != nil else {
        print("unable to proceed, text is nil")
        return
    }
    
    for _ in 1...times {
        print("\(text)")
    }
}
