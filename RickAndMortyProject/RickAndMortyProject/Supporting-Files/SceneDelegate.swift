//
//  SceneDelegate.swift
//  RickAndMortyProject
//
//  Created by Lau on 27/05/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var context: Context!
    
    var mainCoordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        
        let client = HTTPClient()
        context = Context(client: client)
        let screen = Screens(context: context)
        
        mainCoordinator = MainCoordinator(window: window, screens: screen)
        
        mainCoordinator?.start()
    }


}

