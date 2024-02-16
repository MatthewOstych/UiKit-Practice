//
//  ThirdViewController.swift
//  UITabViewControllerPractice
//
//  Created by Mathew Lantsov on 15.02.2024.
//

import UIKit

class ThirdViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Секундомер"

        
        if let scaledBarImg = UIImage(named: "counter") {
            
        var tabBarItem = UITabBarItem()
            
        tabBarItem = UITabBarItem(title: "Секундомер", image: scaledBarImg, tag: 2)
            
        self.tabBarItem = tabBarItem
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
