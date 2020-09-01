//
//  ProfileViewController.swift
//  Hang
//
//  Created by Sohaib on 8/17/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var followers: Bool = false
    var comingFromUserCell = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

}

// HELPING FUNCTIONS
extension ProfileViewController {
    
    func setupTableView() {
        
        func setupCustomCells() {
            mainTableView.register(UINib(nibName: "ProfileScreenHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: ProfileScreenHeaderView.reuseID)
            mainTableView.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: UserInfoTableViewCell.reuseID)
            
            mainTableView.register(UINib(nibName: "FollowersFollowingHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: FollowersFollowingHeader.reuseID)
            mainTableView.register(UINib(nibName: "MainCellTableViewCell", bundle: nil), forCellReuseIdentifier: MainCellTableViewCell.reuseID)
            
            mainTableView.register(UINib(nibName: "EmptyDataTableViewCell", bundle: nil), forCellReuseIdentifier: EmptyDataTableViewCell.reuseID)
        }
        setupCustomCells()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.tableFooterView = UIView()
    }
}

// UI - TABLE - VIEW DELEGATES
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 63.0
        }
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        }
        if followers { return 250.0 }
        return 68.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if followers { return 1 }
        return 23
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileScreenHeaderView.reuseID) as? ProfileScreenHeaderView
            header?.setupHeader(comingFromUserCell)
            header?.backBtnClosure = { [weak self] in
                self?.popController()
            }
            return header
        }
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FollowersFollowingHeader.reuseID) as? FollowersFollowingHeader
        header?.setupHeader()
        header?.followersBtnClosure = { [weak self] in
            self?.followers = true
            self?.mainTableView.reloadData()
        }
        header?.followingBtnClosure = { [weak self] in
            self?.followers = false
            self?.mainTableView.reloadData()
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = contructSectionCell(tableView, indexPath) {
            return cell
        }
        
        return UITableViewCell()
    }
    
    func contructSectionCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell? {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.reuseID) as? UserInfoTableViewCell
            cell?.setup(comingFromUserCell)
            cell?.followBtnClosure = { [weak self] in
                self?.performSegue(withIdentifier: "toEditProfileSegueID", sender: nil)
            }
            return cell
        }
        
        if followers {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmptyDataTableViewCell.reuseID) as? EmptyDataTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainCellTableViewCell.reuseID) as? MainCellTableViewCell
        cell?.setupCellForProfile(indexPath.section)
        return cell
        
    }

}
