//
//  ChatViewModel.swift
//  socket_demo
//
//  Created by Krishna Soni on 30/12/19.
//  Copyright © 2019 Krishna Soni. All rights reserved.
//

import Foundation

final class ChatViewModel {
    
    var arrUsers: KxSwift<[User]> = KxSwift<[User]>([])
    
    func fetchParticipantList(_ name: String) {
        
        SocketHelper.shared.participantList {[weak self] (result: [User]?) in
            
            guard let self = self,
                let users = result else{
                    return
            }
            
            var filterUsers: [User] = users
            
            // Removed login user from list
            if let index = filterUsers.firstIndex(where: {$0.nickname == name}) {
                filterUsers.remove(at: index)
            }
            
            self.arrUsers.value = filterUsers
        }
    }
}
