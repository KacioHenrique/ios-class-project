//
//  SceneDelegate.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 29/04/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: MainPostViewController())
        window.rootViewController = navigation
        self.window = window
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
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

