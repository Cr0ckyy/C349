//
//  ViewController.swift
//  Exercise03
//
//  Created by 19013345 Ju Long on 31/5/21.
//

import UIKit

class Cell: UICollectionViewCell {
    @IBOutlet weak var outLabel: UILabel!
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var outCollection: UICollectionView!
    private var player = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outCollection.delegate = self
        outCollection.dataSource = self
    }

    
    @IBAction func resetBtn(_ sender: UIButton) {
        outCollection.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        cell.backgroundColor = .systemTeal
        cell.outLabel.text = ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! Cell
        cell.backgroundColor = .brown
        if cell.outLabel.text != "x" && cell.outLabel.text != "o" {
            if player == 0 {
                cell.outLabel.text = "x"
                player = 1
            } else {
                cell.outLabel.text = "o"
                player = 0
            }
        }
        
    }
}

