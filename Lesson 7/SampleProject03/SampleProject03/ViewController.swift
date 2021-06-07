//
//  ViewController.swift
//  SampleProject03
//
//  Created by 19013345 Ju Long on 7/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actCamera(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.modalPresentationStyle = .currentContext
        
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("original image not found, dumping: \(info)")
        }
        outImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}

