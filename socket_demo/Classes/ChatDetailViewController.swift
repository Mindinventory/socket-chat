//
//  ChatDetailViewController.swift
//  Socket_demo
//
//  Created by Krishna Soni on 30/12/19.
//  Copyright © 2019 Krishna Soni. All rights reserved.
//

import UIKit

class ChatDetailViewController: UIViewController {

    @IBOutlet weak var tblChat: ChatDetailsTableView! {
        didSet {
            
            guard let tblChat = tblChat else {
                return
            }
            
            tblChat.nickName = nickName
        }
    }
    
    var user: User?
    var nickName: String?
    
    @IBOutlet weak var txtMessage: UITextView! {
        didSet {
            txtMessage.layer.cornerRadius = txtMessage.frame.height/2
            txtMessage.layer.borderWidth = 1.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func configureNavigation() {
        
        guard let user = user else {
            return
        }
        
        title = user.nickname
    }
}

// MARK:- Action Evetns -
extension ChatDetailViewController {
    
    @IBAction func btnSendCLK(_ sender: UIButton) {
        
        guard txtMessage.text.count > 0,
            let message = txtMessage.text,
            let name = nickName else {
            print("Please type your message.")
            return
        }
        
        txtMessage.resignFirstResponder()
        SocketHelper.shared.sendMessage(message: message, withNickname: name)
        txtMessage.text = nil
    }
}
