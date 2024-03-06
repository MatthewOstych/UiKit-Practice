//
//  SecondViewController.swift
//  UIImage
//
//  Created by Mathew Lantsov on 25.02.2024.
//

import UIKit

final class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Cart", image: UIImage(named: "search"), tag: 0)
        self.tabBarItem = tabBarItem
    }

}
