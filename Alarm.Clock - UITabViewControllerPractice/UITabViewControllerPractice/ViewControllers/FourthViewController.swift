//
//  FourthViewController.swift
//  UITabViewControllerPractice
//
//  Created by Mathew Lantsov on 15.02.2024.
//

import UIKit

class FourthViewController: UIViewController {

    
    var setTimerPicker = UIPickerView()
    
    var hrTitle = UILabel()
    var minTitle = UILabel()
    var secTitle = UILabel()
    var endTextFrame = UILabel()
    var endText = UILabel()
    var selectRingText = UILabel()
    
    var startButton = UIButton()
    var cancelButton = UIButton()
    var ringtineButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Bar
        self.title = ""
        if let scaledBarImg = UIImage(named: "last") {
            
            var tabBarItem = UITabBarItem()
            
            tabBarItem = UITabBarItem(title: "Timer", image: scaledBarImg, tag: 3)
            
            self.tabBarItem = tabBarItem
        }
        

        setTimerPicker.delegate = self
        setTimerPicker.dataSource = self
        
        setTimerPicker.center.x = self.view.center.x - 15
        setTimerPicker.center.y = self.view.center.y - 220
        
        
        hrTitle.text = "Hr"
        hrTitle.textColor = .white
        hrTitle.font = UIFont.systemFont(ofSize: 20)
        hrTitle.frame = CGRect(x: setTimerPicker.center.x - 80, y: setTimerPicker.center.y - 30, width: 60, height: 60)
        
        minTitle.text = "Min"
        minTitle.textColor = .white
        minTitle.font = UIFont.systemFont(ofSize: 20)
        minTitle.frame = CGRect(x: setTimerPicker.center.x + 20, y: setTimerPicker.center.y - 30, width: 60, height: 60)
        
        secTitle.text = "Sec"
        secTitle.textColor = .white
        secTitle.font = UIFont.systemFont(ofSize: 20)
        secTitle.frame = CGRect(x: setTimerPicker.center.x + 135, y: setTimerPicker.center.y - 30, width: 60, height: 60)
        
        startButton.setImage(UIImage(named: "startbutton"), for: .normal)
        startButton.frame = CGRect(
            x: self.view.center.x + 80,
            y: self.view.center.y - 90,
            width: 100,
            height: 100
        ) 
        
        cancelButton.setImage(UIImage(named: "cancelButton"), for: .normal)
        cancelButton.frame = CGRect(
            x: self.view.center.x - 190,
            y: self.view.center.y - 90,
            width: 100,
            height: 100
        )
        
        endTextFrame.text = ""
        endTextFrame.backgroundColor =   UIColor(
            red: 0.20,
            green: 0.20,
            blue: 0.20,
            alpha: 1.0
            )
        
        endTextFrame.textColor = .white
        endTextFrame.layer.cornerRadius = 16
        endTextFrame.layer.masksToBounds = true
        
        endTextFrame.frame = CGRect(
            x: self.view.center.x - 190,
            y: self.view.center.y + 30,
            width: 380, height: 50)
        
                
        endText.text = "When over"
        endText.textColor = .white
        endText.frame = CGRect(
            x: self.view.center.x - 180,
          y: self.view.center.y + 30,
          width: 380, height: 50)
        
        selectRingText.text = "Ringtone >"
        selectRingText.textColor = .lightText
        selectRingText.frame = CGRect(
            x: self.view.center.x + 80,
          y: self.view.center.y + 30,
          width: 380, height: 50)
        
        view.addSubview(setTimerPicker)
        view.addSubview(hrTitle)
        view.addSubview(minTitle)
        view.addSubview(secTitle)
        view.addSubview(startButton)
        view.addSubview(cancelButton)
        view.addSubview(endTextFrame)
        view.addSubview(endText)
        view.addSubview(selectRingText)
    }
}

extension FourthViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1,2:
            return 61
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var title = ""
        switch component {
        case 0:
            title = "\(row)"
        case 1:
            title = "\(row)"
        case 2:
            title = "\(row)"
        default:
            return nil
        }
        return NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    

    
}
