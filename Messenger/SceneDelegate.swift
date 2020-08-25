//
//  SceneDelegate.swift
//  Messenger
//
//  Created by Gustavo on 11/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
        window?.makeKeyAndVisible()
    }

    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}

