import UIKit

// Create (empty dictionary)
var particulars_empty : [String : String] = [:]

// Create (dictionary with values)
var particulars = ["firstname":"John", "lastname":"Tan"]

// Add (insert)
particulars["postalcode"] = "738964"

// Retrieve
let firstname = particulars["firstname"] ?? ""

// Update
particulars["firstname"] = "David"

// Remove
particulars["lastname"] = nil

// Get count
var count = particulars.count

// Check for empty
var isEmpty = particulars.isEmpty

// Retrieve keys
var keys = particulars.keys

// Looping over a dictionary (sorted keys)
for key in particulars.keys.sorted() {
  if let value = particulars[key] {
    print("\(key) \(value)")
  }
}
