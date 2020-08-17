//
//  ChattingTogetherViewController.swift
//  Hang
//
//  Created by Devfactori II on 8/17/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class ChattingTogetherViewController: UIViewController {
    
    @IBOutlet weak var gemsBtn: UIButton!
    @IBOutlet weak var getMoreBtn: UIButton!
    @IBOutlet weak var joinBtn: UIButton!
    @IBOutlet weak var chattingTogetherTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
}

// HELPING FUNCTIONS
extension ChattingTogetherViewController {
    
    func setupTableView() {
        
        func setupCustomCells() {
            chattingTogetherTable.register(UINib(nibName: "ProfileHeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: ProfileHeaderTableViewCell.reuseID)
            chattingTogetherTable.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: ProfileTableViewCell.reuseID)
        }
        setupCustomCells()
        
        chattingTogetherTable.delegate = self
        chattingTogetherTable.dataSource = self
        chattingTogetherTable.tableFooterView = UIView()
    }
}

// IB - Actions
extension ChattingTogetherViewController {
    @IBAction func joinBtnActn(_ sender: UIButton) {
        
    }
    @IBAction func dismissTouch(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

// UI - TABLE - VIEW DELEGATES
extension ChattingTogetherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 31.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderTableViewCell.reuseID) as? ProfileHeaderTableViewCell
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = contructSection1Cell(tableView, indexPath) {
            return cell
        }
        
        return UITableViewCell()
    }
    
    func contructSection1Cell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.reuseID) as? ProfileTableViewCell
        return cell
        
    }

}
