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
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                   action:#selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.tableView.addGestureRecognizer(tapGR)
        navigationItemSet()
        // Do any additional setup after loading the view.
    }

    // MARK: Function
    
    func navigationItemSet() {
        let addBarButtonItem = UIBarButtonItem(title: "作成", style: .done, target: self, action: #selector(showNextView))
        addBarButtonItem.tintColor = .black
        self.navigationItem.rightBarButtonItems = [addBarButtonItem]
    }
    
    @objc func showNextView() {
        if items.count < 1 {
            //TODO エラーメッセージを出す
            return
        }
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AmidakuziViewController") as? AmidakuziViewController else { return }
        nextViewController.goalItems = self.items
        self.navigationController?.show(nextViewController, sender: nil)
    }
    @IBAction func tappedAddButton(_ sender: Any) {
        if textField.text == "" {
            return
        }
        items.append(String(textField.text!))
        textField.text = ""
        tableView.reloadData()
    }
    
    @objc func dismissKeyboard() {
        textField.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textField.endEditing(true)
    }
    
}

