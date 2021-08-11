//
//  TableViewController.swift
//  ProblemStatement
//
//  Created by 19013345 Ju Long on 11/8/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var reminders: [Reminder] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        get_data()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onReceiveData(_:)), name: NSNotification.Name(rawValue: "DateReach"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver("DateReach")
    }
    
    @objc func onReceiveData(_ notification: Notification) {
        print("received")
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reminders.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if let title = cell.textLabel,
           let subtitle = cell.detailTextLabel {
            title.text = reminders[indexPath.row].title
            subtitle.text = reminders[indexPath.row].get_date()
            
            if reminders[indexPath.row].date_due < Date() ||
               reminders[indexPath.row].date_due == Date() {
                subtitle.textColor = UIColor.red
            } else {
                subtitle.textColor = UIColor.black
            }
        }

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let uuid = reminders[indexPath.row].uuid
            reminders.remove(at: indexPath.row)
            tableView.reloadData()
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("L12_PS.json")
            print(url)
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(reminders)
                try data.write(to: url)
            } catch {
                print(error)
            }
            let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: [uuid])
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! ViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            vc.reminder = reminders[indexPath.row]
            vc.index = indexPath.row
        }
        vc.reminders = self.reminders
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        get_data()
    }
    
    func get_data() {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("L12_PS.json")
        let decoder = JSONDecoder()
        
        do {
            let xml = try Data(contentsOf: url)
            reminders = try decoder.decode([Reminder].self, from: xml)
            tableView.reloadData()
            print("table reloaded")
        } catch {
            print(error)
        }
    }
}
