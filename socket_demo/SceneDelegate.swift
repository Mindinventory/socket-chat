//
//  SceneDelegate.swift
//  socket_demo
//
//  Created by Krishna Soni on 30/12/19.
//  Copyright © 2019 Krishna Soni. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        self.window = window
        
        
        let storyboard = UIStoryboard(name: "chat", bundle: nil)
        let joinChatViewController = storyboard.instantiateViewController(withIdentifier: "JoinChatViewController")
        let nav = UINavigationController(rootViewController: joinChatViewController)
        window.rootViewController = nav
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        SocketIOManager.shared.establishConnection()
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        SocketIOManager.shared.closeConnection()
    }


}

