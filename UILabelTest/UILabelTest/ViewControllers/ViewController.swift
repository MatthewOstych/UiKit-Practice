//
//  ViewController.swift
//  UILabelTest
//
//  Created by Mathew Lantsov on 18.02.2024.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Vars, lets
    var mainText = UILabel()
    var fontSizeText = UILabel()
    var textSizeSlider = UISlider()
    var segmentControllerTextAligment = UISegmentedControl()
    let segmentItems = ["Left", "Center", "Right"]
    //MARK: - AppRun
    override func viewDidLoad() {
        super.viewDidLoad()

        var tabbarItem = UITabBarItem()
        tabbarItem = UITabBarItem(title: "Text", image: UIImage(named: "home"), tag: 0)
        self.tabBarItem = tabbarItem
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addText))
        
        
        mainText.text = "Press + on the top."
        mainText.numberOfLines = 0
        mainText.textAlignment = .center
        mainText.lineBreakMode = .byWordWrapping
        mainText.adjustsFontSizeToFitWidth = true
        mainText.font = UIFont.systemFont(ofSize: 19)
        mainText.textColor = .black
        mainText.backgroundColor = .clear
        
        mainText.shadowColor = .darkGray
        mainText.shadowOffset = CGSize(width: 1, height: 1)
        
        mainText.sizeToFit()
        mainText.frame = CGRect(
            x: self.view.center.x - 150,
            y: self.view.center.y - 190,
            width: 300, height: 200)
        mainText.layer.borderColor = UIColor.black.cgColor
        mainText.layer.borderWidth = 2.0
        
        fontSizeText.text = "Change Size of The text"
        fontSizeText.frame = CGRect(
            x: self.view.center.x - 150,
            y: self.view.center.y + 45,
            width: 300, height: 23)
            
        textSizeSlider.minimumValue = 10
        textSizeSlider.maximumValue = 150
        textSizeSlider.addTarget(self, action: #selector(changeTextFont), for: .valueChanged)
        textSizeSlider.frame = CGRect(
            x: self.view.center.x - 150,
            y: self.view.center.y + 75,
            width: 300, height: 23)
        
        segmentControllerTextAligment.isMomentary = true
        segmentControllerTextAligment = UISegmentedControl(items: segmentItems)
        segmentControllerTextAligment.selectedSegmentIndex = 1
        segmentControllerTextAligment.addTarget(self, action: #selector(segmentControllerTaped), for: .valueChanged)
        segmentControllerTextAligment.frame = CGRect(
            x: self.view.center.x - 120,
            y: self.view.center.y + 180,
            width: 250,
            height: 30)
        
        
        self.view.addSubview(textSizeSlider)
        self.view.addSubview(mainText)
        self.view.addSubview(fontSizeText)
        self.view.addSubview(segmentControllerTextAligment)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainText.textColor = TxtColorBase.textColor
        mainText.backgroundColor = TxtColorBase.backbroundColor
        mainText.shadowColor = TxtColorBase.shadowEvaili
    }
    //MARK: - Funcs
    @objc func addText() {
        let alertContorller = UIAlertController(title: nil, message: "Add text", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let text = alertContorller.textFields?.first
            self.mainText.text = text?.text
        }
        
        alertContorller.addTextField()
        alertContorller.addAction(action)
        
        self.present(alertContorller, animated: true, completion: nil)
    }
    
    @objc func changeTextFont(sender: UISlider) {
        if sender == textSizeSlider {
            self.mainText.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
        }
    }
    
    @objc func segmentControllerTaped(param: UISegmentedControl) {
        switch param.selectedSegmentIndex {
        case 0:
            mainText.textAlignment = .left
        case 1:
            mainText.textAlignment = .center
        case 2:
            mainText.textAlignment = .right
        default:
            ()
        }
    }
}


