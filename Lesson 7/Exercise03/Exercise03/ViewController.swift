//
//  ViewController.swift
//  Exercise03
//
//  Created by 19013345 Ju Long on 7/6/21.
//

import UIKit

protocol SavingViewControllerDelegate {
    func savingText(_ number: Int)
}

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var outImage: UIImageView!
}

class NumberViewController: UIViewController {
    
    @IBOutlet weak var outTextField: UITextField!
    var delegate: SavingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actSubmit(_ sender: UIButton) {
        guard let text = outTextField.text, let number: Int = Int(text), number > 1 else {
            print("no text or number being entered or number smaller than 1")
            return
        }
        guard self.delegate != nil else {
            print("Hello World")
            return
        }
        delegate?.savingText(number)
        self.dismiss(animated: true, completion: nil)
    }
    
}

class ViewController: UIViewController, SavingViewControllerDelegate {

    var number = 25
    @IBOutlet weak var collection: UICollectionView!
    var image = UIImage(named: "text")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collection.delegate = self
        collection.dataSource = self
    }

    @IBAction func actImage(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.modalPresentationStyle = .currentContext
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! NumberViewController
        if let popoverPresentationController = vc.popoverPresentationController {
            popoverPresentationController.delegate = self
        }
        vc.delegate = self
    }
    
    func savingText(_ number: Int) {
        print("\(number)")
        self.number = Int(number)
        self.collection.reloadData()
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("original image not found, dumping: \(info)")
        }
        image = selectedImage
        dismiss(animated: true, completion: nil)
        collection.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        cell.outImage.image = image
        return cell
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
