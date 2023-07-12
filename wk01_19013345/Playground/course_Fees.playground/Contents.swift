import UIKit

var feeType = ["Singapore Citizen", "Singapore Permanent Residents", "International Students"]

for type in feeType {
    var tuitionFee : Double = 0
    var supplementaryFee : Double = 0
    
    if type == "Singapore Citizen" {
        tuitionFee = 2900.00
        supplementaryFee = 86.50
    } else if type == "Singapore Permanent Residents" {
        tuitionFee = 5800.00
        supplementaryFee = 116.50
    } else if type == "International Students" {
        tuitionFee = 10400.00
        supplementaryFee = 159.50
    }
    print("\(type) pay $\(tuitionFee + supplementaryFee) (Tuition Fee: $\(tuitionFee), Supplementary Fee: $\(supplementaryFee)\n")
}
