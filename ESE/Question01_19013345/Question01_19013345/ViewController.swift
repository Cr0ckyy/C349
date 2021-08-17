//
//  ViewController.swift
//  Question01_19013345
//
//  Created by Ju Long on 16/8/21.
//

import UIKit

class collectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var outImage: UIImageView!
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var durian: String?
    var durianImageName: String?

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var outMainImageView: UIImageView!
    @IBOutlet weak var outMainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let durian = durian {
            print(durian)
            outMainLabel.text = durian
        }
        if let durianImageName = durianImageName {
            print(durianImageName)
            outMainImageView.image = UIImage(named: durianImageName)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionViewCell
    
        if let imageView = cell.outImage,
           let durianImageName = durianImageName {
            imageView.image = UIImage(named: durianImageName)
        }
        return cell
    }
}

