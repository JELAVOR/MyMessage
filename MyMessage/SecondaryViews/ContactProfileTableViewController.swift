//
//  ContactProfileTableViewController.swift
//  MyMessage
//
//  Created by palphone ios on 2/14/24.
//

import UIKit

class ContactProfileTableViewController: UITableViewController {

//MARK: - IBOutlets

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
//MARK: - Vars
    
    var user: User?
    
    
    
    
    
//MARK: - ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        tableView.tableFooterView = UIView()
        setupUI()
    }
    
    
//MARk: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "TableViewBackgroundColor")
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {
            let chatId = startChat(user1: User.currentUser!, user2: user!)
            
            let privateChatView = ChatViewController(chatId: chatId, recipientId: user!.id, recipientName: user!.username)
            privateChatView.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(privateChatView, animated: true)
            
            
            
        }
    }
    
    
    
    
    
    
    
    
    
//MARK: - SetupUI
    private func setupUI() {
        if user != nil {
            self.title = user!.username
            usernameLabel.text = user!.username
            
            if user!.avatarLink != "" {
                FileStorage.downloadImage(imageUrl: user!.avatarLink) { (avatarImage) in
                    self.avatarImageView.image = avatarImage?.circleMasked
                }
            }
        }
    }
    
    
}
