//
//  SecondViewController.swift
//  UITabViewControllerPractice
//
//  Created by Mathew Lantsov on 15.02.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    var budilnikText = UILabel()
    var sonText = UILabel()
    
    var addButton = UIButton()
    var plusButton = UIButton()
    var addNewBud = UIButton()
    
    var mainBudText = UILabel()
    var otherText = UILabel()
    
    var firstBud = UILabel()
    var secondBud = UILabel()
    
    var firstBudSwitch = UISwitch()
    var secondBudSwitch = UISwitch()
    
    var toolbar = UIToolbar()
    
    var lineOne = UIView()
    var lineTwo = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Будильник"
        
        //Bar
        if let barImg = UIImage(named: "budilka") {
            let scaledBarImg = barImg.resizedImage(targetSize: CGSize(width: 27, height: 30))
            
            var tabBarItem = UITabBarItem()
            
            tabBarItem = UITabBarItem(title: "Alarm", image: scaledBarImg, tag: 1)
            self.tabBarItem = tabBarItem
        }
        
        
        
        budilnikText.text = "Alarm"
        budilnikText.textColor = .white
        budilnikText.font = UIFont.boldSystemFont(ofSize: 30)
        budilnikText.frame = CGRect(
            x: self.view.center.x - 170,
            y: self.view.center.y - 340,
            width: 200, height: 50)
        
        addButton.setTitle("Change", for: .normal)
        addButton.setTitleColor(.orange, for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        addButton.frame = CGRect(
            x: self.view.center.x - 205, y:
                self.view.center.y - 380,
            width: 150, height: 50)
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.orange, for: .normal)
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        plusButton.frame = CGRect(
            x: self.view.center.x + 100,
            y: self.view.center.y - 380,
            width: 100, height: 50)
        
        sonText.text = "Sleep | Wake Up"
        sonText.textColor = .white
        sonText.font = UIFont.boldSystemFont(ofSize: 21)
        sonText.frame = CGRect(
            x: self.view.center.x - 170,
            y: self.view.center.y - 300,
            width: 400, height: 50)
        
        lineOne.backgroundColor = .white
        lineOne.alpha = 0.2
        lineOne.frame = CGRect(
            x: self.view.center.x - 200,
            y: self.view.center.y - 255,
            width: UIScreen.main.bounds.width,
            height: 1
        )
        
        lineTwo.backgroundColor = .white
        lineTwo.alpha = 0.2
        lineTwo.frame = CGRect(
            x: self.view.center.x - 200,
            y: self.view.center.y - 200,
            width: UIScreen.main.bounds.width,
            height: 1
        )
        
        mainBudText.text = "No alarm set"
        mainBudText.textColor = .gray
        mainBudText.font = UIFont.systemFont(ofSize: 19)
        mainBudText.frame = CGRect(
            x: self.view.center.x - 170,
            y: self.view.center.y - 250,
            width: 400, height: 50)
        
        otherText.text = "Others"
        otherText.textColor = .white
        otherText.font = UIFont.boldSystemFont(ofSize: 24)
        otherText.frame = CGRect(
            x: self.view.center.x - 170,
            y: self.view.center.y - 200,
            width: 400, height: 50)
        
        
        
        addNewBud.setTitle("SET", for: .normal)
        addNewBud.backgroundColor = UIColor(
            red: 0.20,
            green: 0.20,
            blue: 0.20,
            alpha: 1.0)
        addNewBud.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        addNewBud.setTitleColor(.orange, for: .normal)
        addNewBud.layer.cornerRadius = 16
        addNewBud.frame = CGRect(
            x: self.view.center.x + 50,
            y: self.view.center.y - 240,
            width: 120, height: 30
        )
        
        
        firstBud.text = "15:00"
        firstBud.textColor = .gray
        firstBud.font = UIFont.monospacedDigitSystemFont(ofSize: 60, weight: .light)
        firstBud.frame = CGRect(
            x: self.view.center.x - 180,
            y: self.view.center.y - 210,
            width: 200,
            height: 200
        )
        
        secondBud.text = "19:00"
        secondBud.textColor = .gray
        secondBud.font = UIFont.monospacedDigitSystemFont(ofSize: 60, weight: .light)
        secondBud.frame = CGRect(
            x: self.view.center.x - 180,
            y: self.view.center.y - 130,
            width: 200,
            height: 200
        )
        
        
        firstBudSwitch.frame = CGRect(
            x: self.view.center.x + 100,
            y: self.view.center.y - 120,
            width: 100,
            height: 100)
        firstBudSwitch.addTarget(self, action: #selector(firstbudFunc), for: .touchUpInside)
        
        secondBudSwitch.frame = CGRect(
            x: self.view.center.x + 100,
            y: self.view.center.y - 50,
            width: 100,
            height: 100
        )
        secondBudSwitch.addTarget(self, action: #selector(secbudFunc), for: .touchUpInside)
        
        
        self.view.addSubview(budilnikText)
        self.view.addSubview(addButton)
        self.view.addSubview(plusButton)
        self.view.addSubview(toolbar)
        self.view.addSubview(sonText)
        self.view.addSubview(lineOne)
        self.view.addSubview(mainBudText)
        self.view.addSubview(addNewBud)
        self.view.addSubview(lineTwo)
        self.view.addSubview(otherText)
        self.view.addSubview(firstBud)
        self.view.addSubview(secondBud)
        self.view.addSubview(firstBudSwitch)
        self.view.addSubview(secondBudSwitch)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.backgroundColor = UIColor(
            red: 0.20,
            green: 0.20,
            blue: 0.20,
            alpha: 1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.backgroundColor = UIColor.clear
        
    }
    
    @objc func firstbudFunc() {
        if firstBudSwitch.isOn {
            firstBud.textColor = .white
        } else {
            firstBud.textColor = .gray
        }
    }
    
    @objc func secbudFunc() {
        if secondBudSwitch.isOn {
            secondBud.textColor = .white
        } else {
            secondBud.textColor = .gray
        }
    }
}
    
extension UIImage {
    func resizedImage(targetSize: CGSize) -> UIImage {
        let size = self.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

     
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
