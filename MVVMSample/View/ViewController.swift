//
//  ViewController.swift
//  MVVMSample
//
//  Created by Karthik on 26/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let parserViewModel = ParserViewModel()
    var contacts = [Contacts]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.parserViewModel.parseData(fromURL: "https://api.androidhive.info/contacts/") { (modelData) in
            self.contacts = modelData.contacts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if(cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        }
        
        cell!.textLabel?.text = contacts[indexPath.row].name
        return cell!
    }
    
    
}
