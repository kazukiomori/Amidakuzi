//
//  MemberViewController.swift
//  Amidakuzi
//
//  Created by Kazuki Omori on 2023/04/24.
//

import UIKit

class MemberViewController: UIViewController {
    
    var startItems: [String] = []
    var goalItems: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemSet()
    }
    
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
}
