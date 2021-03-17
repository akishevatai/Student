//
//  SceneDelegate.swift
//  Student
//
//  Created by Atai Akishev on 9/23/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let dataModel = DataModel()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let navigationController = window?.rootViewController as! UINavigationController
        let controller = navigationController.viewControllers[0] as! StudentTableViewController
        controller.dataModel = dataModel
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
      saveData()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
      
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
     saveData()
    }
    
    func saveData() {
        dataModel.saveStudentInfo()
    }


}

