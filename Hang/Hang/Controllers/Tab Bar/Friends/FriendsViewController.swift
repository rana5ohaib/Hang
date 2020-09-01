//
//  FriendsViewController.swift
//  Hang
//
//  Created by Sohaib on 8/17/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class FriendsViewController: BaseViewController {
    
    @IBOutlet weak var gemsBtn: UIButton!
    @IBOutlet weak var getMoreBtn: UIButton!
    @IBOutlet weak var mainBitmojiBtnImg: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
    }

}

// IB - ACTIONS
extension FriendsViewController {
    @IBAction func gemsBtnActn(_ sender: UIButton) {
        
    }
    @IBAction func getMoreBtnActn(_ sender: UIButton) {
        
    }
    @IBAction func cancelSearchBtn(_ sender: UIButton) {
        searchTextField.text = ""
    }
 }

// HELPING FUNCTIONS
extension FriendsViewController {
    
    func setupView() {
        searchTextField.setIcon(#imageLiteral(resourceName: "nav_Search"))
    }
    
    func setupTableView() {
        
        func setupCustomCells() {
            mainTableView.register(UINib(nibName: "SectionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: SectionHeaderView.reuseID)
            mainTableView.register(UINib(nibName: "MainCellTableViewCell", bundle: nil), forCellReuseIdentifier: MainCellTableViewCell.reuseID)
        }
        setupCustomCells()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.tableFooterView = UIView()
    }
}

// UI - TABLE - VIEW DELEGATES
extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionHeaderView.reuseID) as? SectionHeaderView
        header?.setupHeaderForFriends(section)
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = contructSectionCell(tableView, indexPath) {
            return cell
        }
        
        return UITableViewCell()
    }
    
    func contructSectionCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainCellTableViewCell.reuseID) as? MainCellTableViewCell
        cell?.setupCellForFriends(indexPath.section)
        return cell
        
    }

}
