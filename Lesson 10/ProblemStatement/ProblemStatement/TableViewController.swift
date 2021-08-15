//
//  TableViewController.swift
//  ProblemStatement
//
//  Created by 19013345 Ju Long on 26/7/21.
//

import UIKit

protocol ContactProtocol {
    func getData()
}

class TableViewController: UITableViewController, ContactProtocol {
    
    var contactList: [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        performSegue(withIdentifier: "send", sender: self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if let title = cell.textLabel,
           let subTitle = cell.detailTextLabel {
            title.text = contactList[indexPath.row].name
            subTitle.text = contactList[indexPath.row].contact
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "send", sender: self)
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.deleteData(contactList[indexPath.row])
        }
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return false
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nc = segue.destination as! UINavigationController
        let vc = nc.topViewController as! ViewController
        vc.contactProtocol = self
        if let indexPath = tableView.indexPathForSelectedRow {
            vc.contact = contactList[indexPath.row]
        } else {
            vc.contact = Contact()
        }
    }

    
    func getData() {
        guard let url = URL(string: "https://1282bcb52c3c.ngrok.io/retrieve") else {
            return
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                if (httpResponse.statusCode == 200) {
                    if let data = data, let stringData = String(data: data, encoding: .utf8) {
                        print(stringData)
                        DispatchQueue.main.async {
                            let decoder = JSONDecoder()
                            if let jsonData = try? decoder.decode([Contact].self, from: data) {
                                self.contactList = jsonData
                                self.tableView.reloadData()
                            }
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
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Contact", message: nil, preferredStyle: .alert)
        
        alert.addTextField() { textField in
            textField.placeholder = "Name"
            textField.text = ""
        }
        
        alert.addTextField() { textField in
            textField.placeholder = "Contact No"
            textField.text = ""
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            if let textFields = alert.textFields {
                let text1 = textFields[0].text!
                let text2 = textFields[1].text!
                
                if !(text1.isEmpty && text2.isEmpty) {
                    let contact = Contact()
                    contact.id = 0
                    contact.name = text1
                    contact.contact = text2
                    self.addData(contact)
                } else {
                    print("text empty")
                }
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
    func addData(_ contact: Contact) {
        guard let url = URL(string: "https://1282bcb52c3c.ngrok.io/create") else {
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
                            self.getData()
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
    
    func deleteData(_ contact: Contact) {
        guard let url = URL(string: "https://1282bcb52c3c.ngrok.io/delete") else {
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
                            self.getData()
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
