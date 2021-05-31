//
//  ViewController.swift
//  Exercise02
//
//  Created by 19013345 Ju Long on 31/5/21.
//

import UIKit

class topCell: UICollectionViewCell {
    
    @IBOutlet weak var outLabel: UILabel!
    @IBOutlet weak var outImageView: UIImageView!
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    private var list_of_album = ["Taiwan Top 50", "Singapore Top 50", "This is pink", "Discover Weekly", "Party Life", "Party Songs 2020"]
    @IBOutlet weak var topCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! topCell
        cell.outImageView.image = UIImage(named: "\(list_of_album[indexPath.item])")
        cell.outLabel.text = "\(list_of_album[indexPath.item])"
        return cell
    }
}
