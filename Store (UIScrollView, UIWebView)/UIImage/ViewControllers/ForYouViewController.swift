//
//  ForYouViewController.swift
//  UIImage
//
//  Created by Mathew Lantsov on 01.03.2024.
//

import UIKit

final class ForYouViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        //Adding navigationBar
        self.navigationItem.title = ""
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "For You", image: UIImage(named: "search"), tag: 0)
        self.tabBarItem = tabBarItem
        
        addTexts()
        addPlask()
    }
    
    
    //MARK: - UI
    func addTexts() {
        let forYoutextLabel = UILabel()
        let newsTextLabel = UILabel()
        
        forYoutextLabel.text = "For You"
        forYoutextLabel.textColor = .black
        forYoutextLabel.frame = CGRect(x: 20,
                                  y: 20,
                                  width: 200,
                                  height: 200)
        forYoutextLabel.font = UIFont.boldSystemFont(ofSize: 30)
        self.view.addSubview(forYoutextLabel)
        
        let verticalLine = UIView(frame: CGRect(x: 0,
                                                y: 145,
                                                width: self.view.frame.width,
                                                height: 0.4))
        verticalLine.backgroundColor = UIColor.black
        verticalLine.alpha = 0.6
        view.addSubview(verticalLine)
        
        newsTextLabel.text = "News"
        newsTextLabel.frame = CGRect(x: 20,
                                     y: 80,
                                     width: 200,
                                     height: 200)
        newsTextLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(newsTextLabel)
        
    }
    
    func addPlask() {
        let plask = UIView()
        let goodImg = UIImage(named: "mac")
        let goodImgView = UIImageView()
        
        let delivertext = UILabel()
        let whatGoodDEliveryText = UILabel()
        let (placedOrderText, deliveringText, DeiveredText) = (UILabel(), UILabel(), UILabel())
        
        
        let deliveryProgressBar = UIProgressView()
        
        plask.frame = CGRect(x: 10,
                             y: 230,
                             width: self.view.bounds.width - 20,
                             height: 150)

        plask.backgroundColor = .white
        plask.layer.shadowColor = UIColor.black.cgColor
        plask.layer.shadowOpacity = 0.2
        plask.layer.cornerRadius = 19
        plask.layer.shadowOffset = .zero
        plask.layer.shadowRadius = 3
        plask.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(plask)
        
//        if let goodImgCheck = UIImage(named: "mac") {
//            goodImg = goodImgCheck.resized(to: CGSize(width: 20.0, height: 20.0))!
//        }
        
        goodImgView.image = goodImg
        goodImgView.contentMode = .scaleAspectFit
        goodImgView.frame = CGRect(x: plask.frame.minX + 10,
                                   y: plask.frame.minY,
                                   width: 100,
                                   height: 100)
        self.view.addSubview(goodImgView)
        
        delivertext.text = "Your order is delivering."
        delivertext.font = UIFont.boldSystemFont(ofSize: 16)
        delivertext.frame = CGRect(x: plask.frame.minX + 120,
                                   y: plask.frame.minY + 20,
                                   width: 300,
                                   height: 30)
        view.addSubview(delivertext)
        
        whatGoodDEliveryText.text = "MacBook, Delivery tommorow"
        whatGoodDEliveryText.font = UIFont.systemFont(ofSize: 14)
        whatGoodDEliveryText.frame = CGRect(x: plask.frame.minX + 120,
                                   y: plask.frame.minY + 50,
                                   width: 300,
                                   height: 30)
        whatGoodDEliveryText.textColor = .systemGray
        view.addSubview(whatGoodDEliveryText)
        
        deliveryProgressBar.progressViewStyle = .default
        deliveryProgressBar.progress = 0.5
        deliveryProgressBar.progressTintColor = .systemGreen
        deliveryProgressBar.frame = CGRect(x: plask.frame.minX + 5,
                                           y: plask.frame.minY + 100,
                                           width: plask.bounds.width - 10,
                                           height: 200)
        
        deliveryProgressBar.layer.cornerRadius = 8
        deliveryProgressBar.layer.sublayers?[1].cornerRadius = 8
        deliveryProgressBar.subviews[1].clipsToBounds = true
        deliveryProgressBar.layer.masksToBounds = true
        deliveryProgressBar.transform = deliveryProgressBar.transform.scaledBy(x: 1, y: 2.3)
        self.view.addSubview(deliveryProgressBar)
        
        placedOrderText.text = "Order Placed"
        placedOrderText.font = UIFont.boldSystemFont(ofSize: 15)
        placedOrderText.frame = CGRect(x: plask.frame.minX + 10,
                                 y: plask.frame.minY + 75,
                                 width: 100,
                                 height: 100)
        view.addSubview(placedOrderText)
        
        deliveringText.text = "Delivering"
        deliveringText.font = UIFont.boldSystemFont(ofSize: 15)
        deliveringText.frame = CGRect(x: plask.frame.minX + 140,
                                 y: plask.frame.minY + 74,
                                 width: 100,
                                 height: 100)
        view.addSubview(deliveringText)
        
        DeiveredText.text = "Delivered"
        DeiveredText.font = UIFont.boldSystemFont(ofSize: 15)
        DeiveredText.frame = CGRect(x: plask.frame.maxX - 80,
                                 y: plask.frame.minY + 74,
                                 width: 100,
                                 height: 100)
        view.addSubview(DeiveredText)
    }
    

}

