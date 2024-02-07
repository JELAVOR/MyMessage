//
//  ProfileTableViewController.swift
//  MyMessage
//
//  Created by palphone ios on 2/7/24.
//

import UIKit

class ProfileTableViewController: UITableViewController {

//MARK: -IBOutlets
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
//MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showUserInfo()
        
        
        
        
    }
//MARK: - IBACtions
    
    
    @IBAction func tellAFriendButtonPressed(_ sender: Any) {
        print("tell a friend")
    }
    
    @IBAction func termasAndConditionsButtonPressed(_ sender: Any) {
        print("show t&c")
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        print("logout")
    }
    
    
    
    
    
    
    
    
//MARK: - UpdateUI
    private func showUserInfo() {
        if let user = User.currentUser {
            usernameLabel.text = user.username
            statusLabel.text = user.status
            
            if user.avatarLink != "" {
                //download and set avatar image
            }
                
        }
    }
    
    
    
    
}
