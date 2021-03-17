//
//  SceneDelegate.swift
//  StudentsApp
//
//  Created by Aslan Arapbaev on 9/25/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let dataModel = DataModel()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        let navController = window!.rootViewController as! UINavigationController
        let controller = navController.viewControllers[0] as! ViewController
        
        controller.dataModel = dataModel
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       // close app
        saveData()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
      
    }

    func sceneWillResignActive(_ scene: UIScene) {
   
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       // EnterBackground
        saveData()
    }

    func saveData() {
        dataModel.saveStudents()
    }

}

