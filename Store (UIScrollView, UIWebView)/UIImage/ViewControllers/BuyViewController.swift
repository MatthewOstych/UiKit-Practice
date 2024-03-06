//
//  BuyViewController.swift
//  UIImage
//
//  Created by Mathew Lantsov on 01.03.2024.
//

import UIKit

final class BuyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = ""
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Buy", image: UIImage(named: "search"), tag: 0)
        self.tabBarItem = tabBarItem
        
    }
    



}
