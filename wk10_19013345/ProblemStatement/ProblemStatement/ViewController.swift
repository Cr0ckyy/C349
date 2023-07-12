//
//  ViewController.swift
//  ProblemStatement
//
//  Created by day4 on 21/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var myChoice: UILabel!
    @IBOutlet weak var opponentChoice: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var rock: UIImageView!
    @IBOutlet weak var paper: UIImageView!
    @IBOutlet weak var scissors: UIImageView!
    @IBOutlet weak var opponent: UIImageView!
    
    let dc = DataController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.font = UIFont.boldSystemFont(ofSize: 30)
        header.backgroundColor = UIColor.yellow
        myChoice.text = ""
        opponentChoice.text = ""
        result.text = ""
        result.font = UIFont.boldSystemFont(ofSize: 30)
        
        let tapGestureRock = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTappedRock(gesture:)))
        rock.addGestureRecognizer(tapGestureRock)
        rock.isUserInteractionEnabled = true
        let tapGesturePaper = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTappedPaper(gesture:)))
        paper.addGestureRecognizer(tapGesturePaper)
        paper.isUserInteractionEnabled = true
        let tapGestureScissors = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTappedScissors(gesture:)))
        scissors.addGestureRecognizer(tapGestureScissors)
        scissors.isUserInteractionEnabled = true
        
        self.view.backgroundColor = UIColor.cyan
    }
    
    @objc func imageTappedRock(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            let generate = dc.generator()
            opponent.image = UIImage(named: generate)
            let results = dc.result("Rock", generate)
            myChoice.text = "Rock! I Choose You"
            opponentChoice.text = "\(generate)"
            result.text = results
        }
    }
    @objc func imageTappedScissors(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            let generate = dc.generator()
            opponent.image = UIImage(named: generate)
            let results = dc.result("Scissors", generate)
            myChoice.text = "Scissors! I Choose You"
            opponentChoice.text = "\(generate)"
            result.text = results
        }
    }
    @objc func imageTappedPaper(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            let generate = dc.generator()
            opponent.image = UIImage(named: generate)
            let results = dc.result("Paper", generate)
            myChoice.text = "Paper! I Choose You"
            opponentChoice.text = "\(generate)"
            result.text = results
        }
    }
}

