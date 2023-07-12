//
//  ViewControllerResult.swift
//  ProblemStatement
//
//  Created by day4 on 21/1/21.
//

import UIKit

class ViewControllerResult: UIViewController {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var draws: UILabel!
    @IBOutlet weak var losses: UILabel!
    @IBOutlet weak var logs: UITextView!
    let dc = DataController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.font = UIFont.boldSystemFont(ofSize: 30)
        header.backgroundColor = UIColor.yellow
        if dc.getWin() < dc.getDraw() {
            if dc.getDraw() < dc.getLose() {
                losses.textColor = UIColor.red
            }
            draws.textColor = UIColor.red
        } else {
            wins.textColor = UIColor.red
        }
        wins.text = dc.getWin()
        draws.text = dc.getDraw()
        losses.text = dc.getLose()
        logs.text = dc.getLog()
        self.view.backgroundColor = UIColor.gray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if dc.getWin() < dc.getDraw() {
            if dc.getDraw() < dc.getLose() {
                losses.textColor = UIColor.red
            }
            draws.textColor = UIColor.red
        } else {
            wins.textColor = UIColor.red
        }
        wins.text = dc.getWin()
        draws.text = dc.getDraw()
        losses.text = dc.getLose()
        logs.text = dc.getLog()
    }
}
