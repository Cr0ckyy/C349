//
//  ViewController.swift
//  Exercise04
//
//  Created by 19013345 Ju Long on 31/5/21.
//

import UIKit

class Cell: UICollectionViewCell {
    @IBOutlet weak var outLabel: UILabel!
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var status = "start"
    var startime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        if status == "start" {
            cell.outLabel.text = "Press to start"
            cell.backgroundColor = .systemRed
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! Cell
        if status == "start" {
            cell.outLabel.text = "wait for green"
            status = "ready"
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.status = "go"
                cell.backgroundColor = .systemGreen
                self.startime = Date()
            }
        } else if status == "ready" {
            cell.outLabel.text = "click too fast. press to reset"
            status = "reset"
        } else if status == "reset" {
            cell.outLabel.text = "Press to start"
            cell.backgroundColor = .systemRed
            status = "start"
        } else if status == "go" {
            let endtime = Date()
            let diff = endtime.timeIntervalSince(startime)
            cell.outLabel.text = "Your time is \(String(format:"%.2f", diff * 1000))ms "
            cell.backgroundColor = .systemTeal
            status = "reset"
        }
    }
}

