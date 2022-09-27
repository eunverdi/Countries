//
//  MainTabBarController.swift
//  CountriesApp
//
//  Created by Ensar Batuhan Ünverdi on 23.09.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor.black
    }
}
