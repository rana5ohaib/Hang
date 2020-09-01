//
//  DiscoverViewController.swift
//  Hang
//
//  Created by Sohaib on 8/17/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {
    
    @IBOutlet weak var gemsBtn: UIButton!
    @IBOutlet weak var getMoreBtn: UIButton!
    @IBOutlet weak var mainBitmojiBtnImg: UIButton!
    @IBOutlet weak var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

}

// IB - ACTIONS
extension DiscoverViewController {
    @IBAction func gemsBtnActn(_ sender: UIButton) {
        
    }
    @IBAction func getMoreBtnActn(_ sender: UIButton) {
        
    }
}

// HELPING FUNCTIONS
extension DiscoverViewController {
    
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
    func segueToJoinScreen(_ section: Int) {
        if let vC = loadJoinScreen() {
            switch section {
                case 0: vC.joinBtnColor = .RowGoldenColor
                case 1: vC.joinBtnColor = .HangBlue
                case 2: vC.joinBtnColor = .HangGreen
                default: vC.joinBtnColor = nil
            }
            present(vC, animated: true, completion: nil)
        }
    }
}

// UI - TABLE - VIEW DELEGATES
extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        header?.setupHeaderForDiscover(section)
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
        cell?.setupCellForDiscover(indexPath.section)
        cell?.joinBtnClosure = { [weak self] in
            self?.segueToJoinScreen(indexPath.section)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vC = loadProfileScreen() {
            vC.comingFromUserCell = true
            navigationController?.pushViewController(vC, animated: true)
        }
    }

}
