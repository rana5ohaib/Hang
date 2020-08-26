//
//  HomeViewController.swift
//  Hang
//
//  Created by Sohaib on 8/16/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var gemsBtn: UIButton!
    @IBOutlet weak var getMoreBtn: UIButton!
    @IBOutlet weak var mainBitmojiBtnImg: UIButton!
    @IBOutlet weak var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

}

// IB Actions
extension HomeViewController {
    
    @IBAction func gemsBtnActn(_ sender: UIButton) {
        
    }
    @IBAction func getMoreBtnActn(_ sender: UIButton) {
        
    }
}

// HELPING FUNCTIONS
extension HomeViewController {
    
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
    
    /// segue to chatting together screen
    func segueToJoinScreen() {
        performSegue(withIdentifier: "toChattingTogetherSID", sender: nil)
    }
}

// UI - TABLE - VIEW DELEGATES
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionHeaderView.reuseID) as? SectionHeaderView
        header?.setupHeaderForHome(section)
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
        cell?.setupCellForHome(indexPath.section)
        cell?.joinBtnClosure = { [weak self] in
            self?.segueToJoinScreen()
        }
        return cell
        
    }

}
