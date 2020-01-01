//
//  ChatListTableViewCell.swift
//  socket_demo
//
//  Created by Krishna Soni on 30/12/19.
//  Copyright © 2019 Krishna Soni. All rights reserved.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewOnlineStatus: UIView! {
        didSet {
            viewOnlineStatus.layer.cornerRadius = viewOnlineStatus.frame.width/2
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ user: User) {
        lblName.text = user.nickname ?? ""
        viewOnlineStatus.isHidden = !(user.isConnected ?? false)
    }
    
}
