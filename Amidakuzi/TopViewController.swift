//
//  ViewController.swift
//  Amidakuzi
//
//  Created by Kazuki Omori on 2023/04/20.
//

import UIKit

class TopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Property
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var items: [String] = []
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    // MARK: Function
    @IBAction func tappedAddButton(_ sender: Any) {
        items.append("\(String(describing: textField.text))")
        tableView.reloadData()
    }
    
    // MARK: tableView関連
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
}

