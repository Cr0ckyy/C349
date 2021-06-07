//
//  ViewController.swift
//  ESESample
//
//  Created by 19013345 Ju Long on 7/6/21.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var outImage: UIImageView!
}

class TabelCell: UITableViewCell {
    @IBOutlet weak var outTitle: UILabel!
}

class ViewController: UIViewController {
    var attractionName : String = "Singapore Zoo"
    var address : String = "80 Mandai Lake Road, Singapore 729826"

    var overview : String = "The Singapore Zoo, formerly known as the Singapore Zoological Gardens or Mandai Zoo and now commonly known locally as the Singapore Zoo, occupies 28 hectares (69 acres) on the margins of Upper Seletar Reservoir within Singapore&apos;s heavily forested central catchment area. The zoo was built at a cost of $9 million granted by the government of Singapore and opened on 27 June 1973. It is operated by Wildlife Reserves Singapore, who also manage the neighbouring Night Safari, River Safari and the Jurong Bird Park. There are about 315 species of animal in the zoo, of which some 16 percent are considered to be threatened species. The zoo attracts 1.7 million visitors each year."

    var imageNames : [String] = ["zoo_00", "zoo_01", "zoo_02", "zoo_03", "zoo_04", "zoo_05", "zoo_06", "zoo_07", "zoo_08", "zoo_09", "zoo_10", "zoo_11", "zoo_12"]

    var exhibitsTitle : String = "Exhibits"
    var exhibits : [String] = ["RepTopia", "Tortoise Shell-Ter", "Splash Safari Amphitheatre", "Frozen Tundra", "Chimpanzee island", "Reptile Garden", "Treetops Trail", "Wild Africa", "Australasia", "Primate Kingdom", "Great Rift Valley of Ethiopia"]
    
    @IBOutlet weak var HeaderLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var MainImageView: UIImageView!
    @IBOutlet weak var MainTextView: UITextView!
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var ExhibitLabel: UILabel!
    @IBOutlet weak var ExhibitTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HeaderLabel.text = attractionName
        AddressLabel.text = address
        MainImageView.image = UIImage(named: "\(exhibits[Int.random(in: 0..<exhibits.count)])")
        MainTextView.text = overview
        
        ExhibitLabel.text = exhibitsTitle
        
        collection.delegate = self
        collection.dataSource = self
        table.delegate = self
        table.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TabelCell
        cell.outTitle.text = exhibits[indexPath.row]
        cell.backgroundColor = UIColor.gray
        return cell
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        cell.outImage.image = UIImage(named: "\(imageNames[indexPath.item])")
        return cell
    }
}

