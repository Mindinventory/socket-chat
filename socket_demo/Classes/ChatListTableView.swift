//
//  ChatListTableView.swift
//  Socket_demo
//
//  Created by Krishna Soni on 30/12/19.
//  Copyright © 2019 Krishna Soni. All rights reserved.
//

import UIKit

class ChatListTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var onDidSelect: ((User) -> Void)?
    
    private var chatViewModel: ChatViewModel = ChatViewModel()
    var nickName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableViewConfiguartion()
        configureViewModel()
    }
    
    private func tableViewConfiguartion() {
        
        self.register(UINib(nibName: "ChatListTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatListTableViewCell")
        
        self.dataSource = self
        self.delegate = self
        
    }
    
    private func configureViewModel() {
        
        guard let name = nickName else {
            return
        }
        
        chatViewModel.arrUsers.subscribe {[weak self] (result: [User]) in
            
            guard let self = self else {
                return
            }
            
            self.reloadData()
        }
        
        chatViewModel.fetchParticipantList(name)
    }
}

// MARK: - Table view data source
extension ChatListTableView {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListTableViewCell") as? ChatListTableViewCell else {
            return UITableView.emptyCell()
        }
        
        let user: User = chatViewModel.arrUsers.value[indexPath.row]
        cell.configureCell(user)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatViewModel.arrUsers.value.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user: User = chatViewModel.arrUsers.value[indexPath.row]
        onDidSelect?(user)
    }
    
}
