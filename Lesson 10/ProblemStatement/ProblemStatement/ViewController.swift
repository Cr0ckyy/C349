//
//  ViewController.swift
//  ProblemStatement
//
//  Created by 19013345 Ju Long on 26/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var contact: Contact?
    var contactProtocol: ContactProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.text = contact?.name
        numberLabel.text = contact?.contact
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Edit Contact", message: nil, preferredStyle: .alert)
        
        alert.addTextField() { textField in
            textField.placeholder = "Name"
            textField.text = "\(self.contact!.name)"
        }
        
        alert.addTextField() { textField in
            textField.placeholder = "Contact No"
            textField.text = "\(self.contact!.contact)"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            if let textFields = alert.textFields {
                let text1 = textFields[0].text!
                let text2 = textFields[1].text!
                
                if !(text1.isEmpty && text2.isEmpty) {
                    let contact = Contact()
                    contact.id = self.contact?.id ?? 0
                    contact.name = text1
                    contact.contact = text2
                    self.editData(contact)
                } else {
                    print("text empty")
                }
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
    func editData(_ contact: Contact) {
        guard let url = URL(string: "https://1282bcb52c3c.ngrok.io/update") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        
        if let encodedData = try? encoder.encode(contact) {
            request.httpBody = encodedData
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                if (httpResponse.statusCode == 200) {
                    if let data = data, let stringData = String(data: data, encoding: .utf8) {
                        print(stringData)
                        DispatchQueue.main.async {
                            self.contactProtocol?.getData()
                        }
                    }
                } else {
                    print("<<Debug>> Debugging to view status code")
                    print("httpResponse.statusCode is \(httpResponse.statusCode)")
                }
            }
        }
        
        task.resume()
    }
}

