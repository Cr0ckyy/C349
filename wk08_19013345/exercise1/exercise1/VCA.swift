import UIKit

class VCA: UIViewController {

    @IBOutlet weak var Header: UILabel!
    @IBOutlet weak var characters: UISegmentedControl!
    var name = ""
    
    var character = ["Barbarian", "Archer", "Goblin", "Wizard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Header.font = UIFont.boldSystemFont(ofSize: 20)
        characters.removeAllSegments()
        for index in 0..<character.count {
            characters.insertSegment(withTitle: character[index], at: index, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the destination view controller and cast it to the actual class
        let vc = segue.destination as! VCB
        // update the data object
        name = character[characters.selectedSegmentIndex]
        // Set the property of the destination view controller
        vc.name = name
      }
    
    @IBAction func unwindMethod(_ segue: UIStoryboardSegue) {
      }
}
