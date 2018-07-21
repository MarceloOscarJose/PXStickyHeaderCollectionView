//
//  AppDelegate.swift
//  PXStickyHeaderCollectionView
//
//  Created by MarceloJoseML on 07/21/2018.
//  Copyright (c) 2018 MarceloJoseML. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate:UIResponder, UIApplicationDelegate, UINavigationControllerDelegate {

    var window: UIWindow?
    var mainNavigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.mainNavigationController = UINavigationController()

        if let mainNavigationController = self.mainNavigationController {
            mainNavigationController.delegate = self
            mainNavigationController.setNavigationBarHidden(false, animated:false)
            mainNavigationController.pushViewController(MainViewController(), animated:true)

            self.window = UIWindow(frame: UIScreen.main.bounds)
            if let window = self.window {
                window.rootViewController = mainNavigationController
                window.makeKeyAndVisible()
            }
        }

        return true
    }
}
