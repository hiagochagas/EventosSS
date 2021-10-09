//
//  SceneDelegate.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let mainVC = EventListViewController()
        mainVC.title = "Eventos"
        mainVC.view.backgroundColor = .systemBackground
        let mainNav = UINavigationController(rootViewController: mainVC)
        mainNav.navigationBar.backgroundColor = .systemBackground
        mainNav.navigationBar.prefersLargeTitles = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = mainNav
        window?.makeKeyAndVisible()
    }


}

