//
//  MemberViewController.swift
//  Amidakuzi
//
//  Created by Kazuki Omori on 2023/04/24.
//

import UIKit

class MemberViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // MARK: Property
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bannerView: UIView!
    var startItems: [String] = []
    var goalItems: [String] = []
    var colors:[UIColor] = [.red(), .blue(), .yellow(), .purple(), .green(), .pink(), .lightBlue(), .yellowGreen(), .orange(), .gray(), .black(), .white()]
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemSet()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startItems = []
    }
    
    // MARK: Method
    func navigationItemSet() {
        let addBarButtonItem = UIBarButtonItem(title: "作成", style: .done, target: self, action: #selector(showNextView))
        addBarButtonItem.tintColor = .black
        self.navigationItem.rightBarButtonItems = [addBarButtonItem]
    }
    
    @objc func showNextView() {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AmidakuziViewController") as? AmidakuziViewController else { return }
        saveTextFieldValues()
        nextViewController.startItems = self.startItems
        nextViewController.goalItems = self.goalItems
        self.navigationController?.show(nextViewController, sender: nil)
    }
    
    func saveTextFieldValues() {
        // TableViewの全てのセルをループしてTextFieldの値を配列に格納する
        for section in 0..<tableView.numberOfSections {
            for row in 0..<tableView.numberOfRows(inSection: section) {
                if let cell = tableView.cellForRow(at: IndexPath(row: row, section: section)) as? MemberTableViewCell {
                    // TextFieldの値を配列に追加する
                    startItems.append(cell.memberTextField.text ?? "")
                }
            }
        }
    }
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as? MemberTableViewCell else {return UITableViewCell()}
        cell.memberTextField.text = "メンバー\(indexPath.row)"
        cell.colorView.layer.cornerRadius = cell.colorView.frame.height / 2
        cell.colorView.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
