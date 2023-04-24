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
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemSet()
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
        nextViewController.startItems = self.startItems
        nextViewController.goalItems = self.goalItems
        self.navigationController?.show(nextViewController, sender: nil)
    }
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as? MemberTableViewCell else {return UITableViewCell()}
        return cell
    }
    
}
