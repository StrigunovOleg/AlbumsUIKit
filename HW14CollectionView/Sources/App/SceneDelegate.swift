//
//  SceneDelegate.swift
//  HW14CollectionView
//
//  Created by Олег Стригунов on 29.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScence = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScence.coordinateSpace.bounds)
        window?.windowScene = windowScence
        window?.rootViewController = TabBarConteller()
        window?.makeKeyAndVisible()
    }

   
}

